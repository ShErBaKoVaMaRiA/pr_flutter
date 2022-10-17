//запросы к базе @Магазин одежды@
abstract class DataBaseRequest {
  /// Таблица Роли
  /// Поля таблицы: Название роли
  static const String tableRoles = 'Roles';

  /// Таблица Типы товаров
  /// Поля таблицы: Название типа
  static const String tableTypesProduct = 'Types_Product';

  /// Таблица Пункты выдачи
  /// Поля таблицы: Адрес, график работы
  static const String tablePointsIssue = 'Points_Issue';

  /// Таблица Материалы
  /// Поля таблицы: Название материала
  static const String tableMaterials = 'Materials';

  /// Таблица Аккаунты
  /// Поля таблицы: Логин, Пароль, Роль
  static const String tableAccounts = 'Accounts';

  /// Таблица Пользователи
  /// Поля таблицы: ФИО, дата рождения, размер скидки, аккаунт
  static const String tableUsers = 'Users';

  /// Таблица Товары
  /// Поля таблицы: наименование, цена, тип материала, тип одежды,размер, количество.
  static const String tableProducts = 'Products';

  /// Таблица Корзина
  /// Поля таблицы: Товар, клиент, количество
  static const String tableCarts = 'Carts';

  /// Таблица Заказы
  /// Поля таблицы: Товар, количество, итоговая стоимость, клиент, статус, дата продажи, пункт выдачи
  static const String tableOrders = 'Orders';

  static const List<String> tableList = [
    tableRoles,
    tableTypesProduct,
    tablePointsIssue,
    tableMaterials,
    tableAccounts,
    tableUsers,
    tableProducts,
    tableCarts,
    tableOrders,
  ];

  static const List<String> tableCreateList = [
    _createTableRoles,
    _createTableTypesProduct,
    _createTablePointsIssue,
    _createTableMaterials,
    _createTableAccounts,
    _createTableUsers,
    _createTableProducts,
    _createTableCarts,
    _createTableOrders,
  ];

  /// Запрос для создания таблицы Roles
  static const String _createTableRoles =
      'CREATE TABLE "$tableRoles" ("id_role" INTEGER,"name_role" TEXT NOT NULL UNIQUE, PRIMARY KEY("id_role" AUTOINCREMENT))';

  /// Запрос для создания таблицы Types Product
  static const String _createTableTypesProduct =
      'CREATE TABLE "$tableTypesProduct" ("id_type"	INTEGER,"name_type_product"	TEXT NOT NULL UNIQUE, PRIMARY KEY("id_type" AUTOINCREMENT))';

  /// Запрос для создания таблицы Points Issue
  static const String _createTablePointsIssue =
      'CREATE TABLE "$tablePointsIssue" ("id_point"	INTEGER,"address"	TEXT NOT NULL UNIQUE,"shedule_work"	TEXT NOT NULL UNIQUE,PRIMARY KEY("id_point" AUTOINCREMENT))';

  /// Запрос для создания таблицы Materials
  static const String _createTableMaterials =
      'CREATE TABLE "$tableMaterials" ("id_material" INTEGER,"name_material"	TEXT NOT NULL UNIQUE, PRIMARY KEY("id_material" AUTOINCREMENT))';

  /// Запрос для создания таблицы Accounts
  static const String _createTableAccounts =
      'CREATE TABLE "$tableAccounts" ("id_account"	INTEGER,"login"	TEXT NOT NULL UNIQUE,"password"	TEXT NOT NULL,"role_id"	INTEGER,FOREIGN KEY("role_id") REFERENCES "Roles"("id_role") ON DELETE CASCADE,PRIMARY KEY("id_account"))';

  /// Запрос для создания таблицы Users
  static const String _createTableUsers =
      'CREATE TABLE "$tableUsers" ("id_user"	INTEGER,"Surname"	TEXT NOT NULL,"Name"	TEXT NOT NULL,"Middlename"	TEXT NOT NULL,"DateBirthday"	NUMERIC NOT NULL,"Discount"	INTEGER NOT NULL,"account_id"	INTEGER NOT NULL UNIQUE,FOREIGN KEY("account_id") REFERENCES "Accounts"("id_account") ON DELETE CASCADE,PRIMARY KEY("id_user"))';

  /// Запрос для создания таблицы Products
  static const String _createTableProducts =
      'CREATE TABLE "$tableProducts" ("id_product" INTEGER,"Name"	TEXT NOT NULL,"Price"	REAL NOT NULL,"Sizes"	TEXT NOT NULL,"Count"	INTEGER NOT NULL,"material_id"	INTEGER,"type_id"	INTEGER,FOREIGN KEY("material_id") REFERENCES "Materials"("id_material") ON DELETE CASCADE,FOREIGN KEY("type_id") REFERENCES "Types_Product"("id_type") ON DELETE CASCADE,PRIMARY KEY("id_product"))';

  /// Запрос для создания таблицы Carts
  static const String _createTableCarts =
      'CREATE TABLE "$tableCarts" ("id_cart"	INTEGER,"count"	INTEGER NOT NULL,"product_id"	INTEGER,"user_id"	INTEGER,FOREIGN KEY("user_id") REFERENCES "Users"("id_user") ON DELETE CASCADE,FOREIGN KEY("product_id") REFERENCES "Products"("id_product") ON DELETE CASCADE,PRIMARY KEY("id_cart"))';

  /// Запрос для создания таблицы Orders
  static const String _createTableOrders =
      'CREATE TABLE "$tableOrders" ("id_order"	INTEGER,"product_id" INTEGER NOT NULL, "count" INTEGER NOT NULL, "final_cost" REAL NOT NULL,"user_id" INTEGER NOT NULL, "status" TEXT NOT NULL, "date_sale" NUMERIC NOT NULL, "point_id" INTEGER NOT NULL,FOREIGN KEY("product_id") REFERENCES "Products"("id_product"),FOREIGN KEY("user_id") REFERENCES "Users"("id_user") ON DELETE CASCADE,FOREIGN KEY("point_id") REFERENCES "Points_Issue"("id_point") ON DELETE CASCADE,PRIMARY KEY("id_order"))';

  static String deleteTable(String table) => 'Drop table $table';
}
