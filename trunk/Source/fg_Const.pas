{*****************************************************************************
 *
 * Project  : Mat_Dept
 * Unit Name: fg_Const
 * Purpose  : ������ ��������� ��� ������
 * Create   : 14.06.06
 * History  :
 *
 *****************************************************************************}

unit fg_Const;

interface

type
  arrayID = array of Longint;

  // ����� ��������� ���� ��������������
  TActionEditForm = (doNew, doEdit, doView);
  // doNew  - ���� ����� ������
  // doEdit - �������������� ������
  // doView - �������� ������

  // ����� ��������� ��������� ����
  TActionListForm = (doViewList, doFilterList, doChooseList, doViewCloseList, doChooseCloseList, doFilterLeftList);
  // doViewList        - �������� ������� ������
  // doFilterList      - �������� ������ � ���������� ��������
  // doChooseList      - ����� �� ������
  // doViewCloseList   - �� ��������� �������
  // doChooseCloseList - ����� �� ������, �� �� ��������� �������

  // ����� ��������� ��������
  TActionSimpleFilter = (doEditFilter, doSetFilter, doUnsetFilter);
  // doEditFilter  - ������ ��������� ������� � ���������� ������
  // doSetFilter   - ��������� ��������� ������� �� �������
  // doUnsetFilter - ��������� ������

  // ��� ���������� ������� ��������������
  TCorrectEdit = (doCorrectEdit, doErrorEdit, doCancelEdit, doChooseDouble);
  // doCorrectEdit  - �������
  // doErrorEdit    - ������
  // doCancelEdit   - ������� �������
  // doChooseDouble - ���� ������� ������������ ������ (�� ������)

const

  MaxType=35; // ���������� ���� � �������
  MaxDualListType=7; // ���������� ������� ���� � �������
  MaxTripleListType=5; // ���������� ������� ���� � �������
  MaxSimpleFilter=35; // ���������� �������� � �������

// ���� ��������

  // �����

  cContractor = 1; // ���������� ������������
  cContract = 2; // ���������� ���������


  // ������� �����

  cApp_Mat_Rate = 1; // ���������� ������������� ��������� � ����� ������
  cReason_Discard = 2; // ���������� ������ ��������
  cPredmetToPredmet = 3; // ����� ������ �� ����������� �������
  cAct_Discard_Rem = 4; //��� �������� � ���
  cCard_Start_Mat = 5; // ����� �������-������� ���������
  cStart_Det = 6; // ������ ���


  // ������� �����

  cCard_Subst_Mat2 = 1;
  cStart_Mat = 2; // ������ ��� "����� ��"


  // �������

  cSimpleFilterContractor = 1;
  cSimpleFilterContract = 2;

implementation

end.
