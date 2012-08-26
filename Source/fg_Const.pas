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
  cAdv = 3; // Рекламная конструкция
  cSide = 4; // Сторона рекламной конструкции
  cMeasure = 5; // Справочник единиц измерения
  cSpr_Mat = 6; // Материал и работа
  cMat_Price = 7; // Цена материала или работы
  cOrder_Doc = 8; // Заказ
  cOrder_Comp = 9; // Состав заказов

  // Двойные формы

  cAdvSide = 1; // Рекламные конструкции и их стороны
  cSprMat_Price = 2; // Материалы, работа и цены
  cOrder = 3; // Заказы


  // Тройные формы

  cCard_Subst_Mat2 = 1;
  cStart_Mat = 2; // Запуск ДСЕ "Через МЦ"


  // Фильтры

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
