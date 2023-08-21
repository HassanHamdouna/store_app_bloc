import 'package:sqflite/sqflite.dart';
import 'package:store_app/database/db_controller.dart';
import 'package:store_app/models/process_response.dart';
import 'package:store_app/preferences/shared_pref_controller.dart';

import '../../models/user.dart';

class UserDbController {
  // login AND register AND check email unique

  final Database _database = DbController().database;

  Future<ProcessResponse> login({required String email, required String password}) async {
    List<Map<String, dynamic>> rowMapLogin = await _database.query(
        User.tableName,
        where: 'email = ? AND password = ?',
        whereArgs: [email, password]);

    if (rowMapLogin.isNotEmpty) {
      User user = User.formMap(rowMapLogin.first);
      SharedPrefController().save(user: user);
      return  ProcessResponse(massage: 'Logged in successfully', success: true);
    }
    return  ProcessResponse(massage: 'Credentials error, check and try again!', success: false);

  }

  Future<ProcessResponse> register({required User user}) async {
    if (await _isUniqueEmail(email: user.email)) {
      int newRowId = await _database.insert(User.tableName, user.toMap());
      // SharedPrefController().save(user: user);
      return ProcessResponse(
          massage:
              newRowId != 0 ? 'Registered successfully' : 'Register failed!',
          success: newRowId != 0,);
    }else {
      return ProcessResponse(
          massage: 'Email exist, use another', success: false);
    }
  }

  Future<bool> _isUniqueEmail({required String email}) async {
    List<Map<String, dynamic>> rowMapEmail = await _database
        .rawQuery('SELECT * FROM users WHERE email = ?', [email]);
    return rowMapEmail.isEmpty;
  }
}
