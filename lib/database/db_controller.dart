import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbController {
  DbController._();

  late Database _database;
  static DbController? _instance;

  factory DbController(){
    return _instance ??= DbController._();
  }

  Database get database => _database;

  Future<void> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path,'app_db.sql');
    _database = await openDatabase(
        path,
      version: 1,
      onOpen: (Database database) {
      },
      onCreate: (Database db , version) async {
         await db.execute('CREATE TABLE users ('
             'id INTEGER PRIMARY KEY AUTOINCREMENT,'
             'phone  INTEGER NOT NULL,'
             'email TEXT NOT NULL,'
             'password TEXT NOT NULL'
             ')');
         await db.execute('CREATE TABLE products ('
             'id INTEGER PRIMARY KEY AUTOINCREMENT,'
             'name TEXT NOT NULL,'
             'info TEXT NOT NULL,'
             'price REAL NOT NULL,'
             'quantity INTEGER DEFAULT (0),'
             'user_id INTEGER,'
             'FOREIGN KEY (user_id) references users(id)'
             ')');
         await db.execute('CREATE TABLE carts ('
             'id INTEGER PRIMARY KEY AUTOINCREMENT,'
             'total REAL NOT NULL,'
             'count INTEGER NOT NULL,'
             'price REAL NOT NULL,'
             'user_id INTEGER,'
             'product_id INTEGER,'
             'FOREIGN KEY (user_id) references users(id),'
             'FOREIGN KEY (product_id) references products(id)'
             ')');
      },
      onUpgrade: (Database database, oldVersion, newVersion) {

      },
      onDowngrade: (Database database, oldVersion, newVersion) {

      },

    );
  }
}