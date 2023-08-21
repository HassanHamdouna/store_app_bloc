
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:store_app/preferences/shared_pref_controller.dart';

class LanguageGetXController extends GetxController{
  String currentLanguage = SharedPrefController().getValueKey<String>(PrefKey.language.name)??'en';

   RxString language = ''.obs ;

   static LanguageGetXController get to => Get.find<LanguageGetXController>();

  @override
  void onInit() {
    language.value = currentLanguage;
    super.onInit();
  }

  void  changeLanguage(){
    language.value = language.value == 'en' ? 'ar':'en';
    SharedPrefController().changeLanguage(langCode: language.value);
  }
}