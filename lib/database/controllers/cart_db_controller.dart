import 'package:store_app/database/db_operations.dart';
import 'package:store_app/models/cart.dart';
import 'package:store_app/preferences/shared_pref_controller.dart';

class CartDbController extends DbOperations<Cart> {
  int userId = SharedPrefController().getValueKey<int>(PrefKey.id.name)??1;

  @override
  Future<int> create(Cart model) async {
    int newRowId = await database.insert(Cart.tableName, model.toMap());
    return newRowId;
  }

  @override
  Future<bool> delete(int id) async {
    int countOfDeleteRow = await database.delete(Cart.tableName,
        where: 'id = ? AND user_id = ?', whereArgs: [id, userId]);

    return  countOfDeleteRow == 1;
  }


  @override
  Future<List<Cart>> read() async {
    // List<Map<String, dynamic>> rowMap = await database
    //     .query(Cart.tableName, where: 'user_id =?', whereArgs: [userId]);

    List<Map<String, dynamic>> rowMap = await database.rawQuery(
        'SELECT carts.id, carts.product_id, carts.count, carts.total, carts.price, carts.user_id, products.name '
        'FROM carts JOIN products ON carts.product_id = products.id '
        'WHERE carts.user_id = ?',[userId]);

    print('rowMap : $rowMap');
    return  rowMap.map((newRowMap) => Cart.formMap(newRowMap)).toList();
  }

  @override
  Future<bool> update(Cart model) async {
   int countOfUpdateRow = await database.update(
     Cart.tableName,
       model.toMap(),
   where: 'id = ? AND user_id = ?',
     whereArgs: [model.id,userId]
   );
   return countOfUpdateRow==1;
  }

  @override
  Future<bool> clear() async {
    int count0fDeletedRows = await database.delete(Cart.tableName,
    where: 'user_id = ?',
    whereArgs: [userId]
    );

    return count0fDeletedRows > 0;
  }

  @override
  Future<Cart?> show(int id) {
    // TODO: implement show
    throw UnimplementedError();
  }
}
