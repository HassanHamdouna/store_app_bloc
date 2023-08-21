import 'package:sqflite/sqflite.dart';
import 'package:store_app/database/db_controller.dart';
import 'package:store_app/database/db_operations.dart';
import 'package:store_app/models/product.dart';

class ProductDbController extends DbOperations<Product> {
  /// 1) Create
  /// 2) Delete
  /// 3) Update
  /// 4) Show
  /// 5) Read

  @override
  Future<int> create(Product model) async {
    // int newRowId = await database.rawInsert(
    //   'INSERT INTO products (name, info, price, quantity, user_id) VALUES (?, ?, ?, ?, ?)',
    // [model.name,model.info,model.price,model.quantity,model.userId]
    // );

    int newRowId = await database.insert(Product.tableName, model.toMap());

    return newRowId;
  }

  @override
  Future<bool> delete(int id) async {
    // int countOfDeletedRows = await database.rawDelete('DELETE FROM products WHERE id =?  ',[id]);
    int countOfDeletedRows = await database
        .delete(Product.tableName, where: 'id= ?', whereArgs: [id]);
    return countOfDeletedRows == 1;
  }

  @override
  Future<List<Product>> read() async {
    // List<Map<String,dynamic>> map =  await database.rawQuery('SELECT * FROM products');

    List<Map<String, dynamic>> rowMap = await database.query(Product.tableName);
    List<Product> products =
        rowMap.map((newRowMap) => Product.fromMap(newRowMap)).toList();
    return products;
  }

  @override
  Future<Product?> show(int id) async {
    // List<Map<String,dynamic>> romMap = await database.rawQuery('SELECT * FROM products WHERE id =? ',[id]);
    List<Map<String, dynamic>> romMap = await database
        .query(Product.tableName, where: 'id= ?', whereArgs: [id]);

    return romMap.isNotEmpty ? Product.fromMap(romMap.first) : null;
  }

  @override
  Future<bool> update(Product model) async {
    // int count0fUpdatedRows = await database.rawUpdate(
    //     'UPDATE products SET name = ?, info = ?, price = ?, quantity = ? WHERE id = ? AND user_id = ? ',
    // [model.id,model.name,model.info,model.price,model.quantity,model.userId]);

    int count0fUpdatedRows = await database.update(
        Product.tableName,
        model.toMap(),
        where:' id = ? AND user_id = ? ',
        whereArgs: [model.id, model.userId]
    );
    return count0fUpdatedRows ==1;

  }
}
