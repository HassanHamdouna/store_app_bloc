import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/models/user.dart';
enum PrefKey{language,loginIn,loginOut,email,id, phone, password}
class SharedPrefController{
  SharedPrefController._();

  late SharedPreferences _sharedPreferences;

  static SharedPrefController? _instance;

  factory  SharedPrefController(){
    return _instance??=  SharedPrefController._();
  }

  Future<void> initProvider() async{
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  void changeLanguage({required String langCode}){
    _sharedPreferences.setString(PrefKey.language.name, langCode);
  }

  void save({required User user}){
    _sharedPreferences.setBool(PrefKey.loginIn.name, true);
    _sharedPreferences.setInt(PrefKey.id.name, user.id);
    // print(user.id);
    _sharedPreferences.setString(PrefKey.email.name, user.email);
    _sharedPreferences.setInt(PrefKey.phone.name, user.phone);
    _sharedPreferences.setString(PrefKey.password.name, user.password);
  }

  T? getValueKey<T>(String key){
    if(_sharedPreferences.containsKey(key)){
      return _sharedPreferences.get(key) as T;
    }
    return null;
  }

  Future<bool> removeValueFor(String key) async {
    if(_sharedPreferences.containsKey(key)){
      return  _sharedPreferences.remove(key);
    }
    return false;

  }

  Future<bool> clear(){
    return _sharedPreferences.clear();
  }



}