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
  cAdv = 3; // ��������� �����������
  cSide = 4; // ������� ��������� �����������
  cMeasure = 5; // ���������� ������ ���������
  cSpr_Mat = 6; // �������� � ������
  cMat_Price = 7; // ���� ��������� ��� ������
  cOrder_Doc = 8; // �����
  cOrder_Comp = 9; // ������ �������

  // ������� �����

  cAdvSide = 1; // ��������� ����������� � �� �������
  cSprMat_Price = 2; // ���������, ������ � ����
  cOrder = 3; // ������


  // ������� �����

  cCard_Subst_Mat2 = 1;
  cStart_Mat = 2; // ������ ��� "����� ��"


  // �������

  cSimpleFilterContractor = 1;
  cSimpleFilterContract = 2;
  cSimpleFilterAdv = 3;
  cSimpleFilterSide = 4;
  cSimpleFilterMeasure = 5;
  cSimpleFilterMat = 6;
  cSimpleFilterMat_Price = 7;
  cSimpleFilterOrder = 8;
  cSimpleFilterOrder_Comp = 9;

implementation

end.
