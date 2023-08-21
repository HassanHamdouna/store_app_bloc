
import 'package:flutter/cupertino.dart';
import 'package:store_app/preferences/shared_pref_controller.dart';

class LanguageProvider extends ChangeNotifier{

  String language = SharedPrefController().getValueKey<String>(PrefKey.language.name)??'en';


  void  changeLanguage(){
    language = language== 'en' ? 'ar':'en';
    SharedPrefController().changeLanguage(langCode: language);
    notifyListeners();
  }
}