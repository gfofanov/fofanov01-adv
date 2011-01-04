{***************************************************************
 *
 * Unit Name: Double
 * Purpose  : определение повторного запуска программы
 * Author   : Vladimir Titov (2:5061/32.14)
 * History  :
 *
 ****************************************************************}
Unit Second_Start;

Interface
Uses Windows, SysUtils, Forms, Controls;

Type
  TAppManager = Class( TObject )
  private
    Procedure AppMessage( Var Msg : TMsg; Var Handled : Boolean );
  End;

Procedure CheckInstance( Const aMutexName : String; aMultiInstance, aShowApp : boolean );
// MutexName-уникальное имя мьютекса,
// MultiInstance-разрешается ли запуск нескольких копий программы,
// ShowApp-показывать ли предыдущие копии.
// Для создания имени мьютекса рекомендуется использовать строковое представление
// GUID-а(достаточно нажать в редакторе комбинацию Ctrl+Shift+G).

Procedure CreateException( Const Msg : String );
Procedure RegWindowMessage( Const MutexName : String );
Procedure CreateAppEvent;

Implementation

Const
  OneInstMsg = 'Программа уже запущена!';
  MultiInstMsg = OneInstMsg + ' Создать еще одну копию?';
  CaptionText = 'Предупреждение';

Var
  MutexHandle : THandle;
  WM_INSTANCE : word;
  AppManager : TAppManager;

Procedure CheckInstance( Const aMutexName : String; aMultiInstance, aShowApp : boolean );
Var
  MultiInstance, ShowApp : Boolean;
  MutexName : String;
Begin
  MutexName := aMutexName;
  MultiInstance := aMultiInstance;
  ShowApp := aShowApp;

  RegWindowMessage( MutexName );

  MutexHandle := OpenMutex( MUTEX_ALL_ACCESS, True, PChar( MutexName ) );
  If ( MutexHandle = 0 ) Then
    Begin
      MutexHandle := CreateMutex( Nil, false, PChar( MutexName ) );
      If ( MutexHandle = 0 ) Then
        CreateException( 'Ошибка при создании мьютекса : ' )
      Else
        If ShowApp Then CreateAppEvent;
    End
  Else
    If Not MultiInstance Then
      Begin
        Application.MessageBox( OneInstMsg, CaptionText, MB_OK );
        If ShowApp Then PostMessage( HWND_BROADCAST, WM_INSTANCE, 0, 0 );
        Halt( 1 );
      End
    Else Begin
        If Application.MessageBox( MultiInstMsg, CaptionText, MB_YESNO ) <> IDYES
          Then
          Begin
            If ShowApp Then PostMessage( HWND_BROADCAST, WM_INSTANCE, 0, 0 );
            Halt( 2 );
          End
        Else
          If ShowApp Then CreateAppEvent;
      End;
End;

Procedure CreateAppEvent;
Begin
  AppManager := TAppManager.Create;
  Application.OnMessage := AppManager.AppMessage;
End;

Procedure RegWindowMessage( Const MutexName : String );
Begin
  WM_INSTANCE := RegisterWindowMessage( PChar( MutexName ) );
  If WM_INSTANCE = 0 Then
    CreateException( 'Ошибка при регистрации нового сообщения: ' );
End;

Procedure CreateException( Const Msg : String );
Begin
  Raise Exception.Create( Msg + #13#10 + SysErrorMessage( GetLastError ) );
End;

Procedure TAppManager.AppMessage( Var Msg : TMsg; Var Handled : Boolean );
Begin
  If Msg.message = WM_INSTANCE Then
    Begin
      Application.Restore;
      Application.BringToFront;
      Handled := true;
    End;
End;

initialization

finalization
  If ( MutexHandle <> 0 ) Then
    CloseHandle( MutexHandle );
  If Assigned( AppManager ) Then
    Begin
      AppManager.Free;
      AppManager := Nil;
    End;
end.
