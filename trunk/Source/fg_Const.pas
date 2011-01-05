{*****************************************************************************
 *
 * Project  : Mat_Dept
 * Unit Name: fg_Const
 * Purpose  : Разные константы для работы
 * Create   : 14.06.06
 * History  :
 *
 *****************************************************************************}

unit fg_Const;

interface

type
  arrayID = array of Longint;

  // Набор состояний форм редактирования
  TActionEditForm = (doNew, doEdit, doView);
  // doNew  - ввод новой записи
  // doEdit - редактирование записи
  // doView - просмотр записи

  // Набор состояний списковых форм
  TActionListForm = (doViewList, doFilterList, doChooseList, doViewCloseList, doChooseCloseList, doFilterLeftList);
  // doViewList        - просмотр полного списка
  // doFilterList      - просмотр списка с включенным фильтром
  // doChooseList      - выбор из списка
  // doViewCloseList   - не открывать датасет
  // doChooseCloseList - выбор из списка, но не открывать датасет

  // Набор состояний фильтров
  TActionSimpleFilter = (doEditFilter, doSetFilter, doUnsetFilter);
  // doEditFilter  - задать параметры фильтра в диалоговом режиме
  // doSetFilter   - прочитать параметры фильтра из реестра
  // doUnsetFilter - отключить фильтр

  // Как завершился процесс редактирования
  TCorrectEdit = (doCorrectEdit, doErrorEdit, doCancelEdit, doChooseDouble);
  // doCorrectEdit  - успешно
  // doErrorEdit    - ошибка
  // doCancelEdit   - процесс прерван
  // doChooseDouble - была выбрана существующая запись (из дублей)

const

  MaxType=35; // Количество форм в проекте
  MaxDualListType=7; // Количество двойных форм в проекте
  MaxTripleListType=5; // Количество тройных форм в проекте
  MaxSimpleFilter=35; // Количество фильтров в проекте

// Типы объектов

  // Формы

  cContractor = 1; // Справочник контрагентов
  cContract = 2; // Справочник договоров


  // Двойные формы

  cApp_Mat_Rate = 1; // Справочник применяемости материала и нормы затрат
  cReason_Discard = 2; // Справочник причин списания
  cPredmetToPredmet = 3; // Выбор детали из справочника деталей
  cAct_Discard_Rem = 4; //Акт списания с НЗП
  cCard_Start_Mat = 5; // Карта отпуска-запуска материала
  cStart_Det = 6; // Запуск ДСЕ


  // Тройные формы

  cCard_Subst_Mat2 = 1;
  cStart_Mat = 2; // Запуск ДСЕ "Через МЦ"


  // Фильтры

  cSimpleFilterContractor = 1;
  cSimpleFilterContract = 2;

implementation

end.
