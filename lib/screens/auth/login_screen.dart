import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:store_app/database/controllers/user_db_controller.dart';
import 'package:store_app/get/language_getx_controller.dart';
import 'package:store_app/models/process_response.dart';
import 'package:store_app/preferences/shared_pref_controller.dart';
import 'package:store_app/provider/language_provider.dart';
import 'package:store_app/themes/app_color.dart';
import 'package:store_app/utils/context_extenssion.dart';

import '../../wigets/app_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscure = false;
  String _language = 'en';
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        leading:IconButton(onPressed: (){
          _showLanguageBottomSheet();
        },icon: Icon(Icons.language,color: const AppColors().purple,size: 35,)),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50.h,
                width: double.infinity,
              ),
              Image.asset('images/icon_logo.png'),
              SizedBox(
                height: 50.h,
                width: double.infinity,
              ),
              AppTextField(
                controller: _emailController,
                onChange: () {
                  setState(() {
                    if(_emailController.text.isNotEmpty){

                    }
                  });
                },
                title: "Email",
                focusedBorderColor: const AppColors().purple,
                enabledBorderColor:_emailController.text.isNotEmpty? const AppColors().purple:const AppColors().gray2,
                prefixIcon: Image.asset('images/icon_email.png'),
                suffixIcon: null,
              ),
              SizedBox(
                height: 20.h,
                width: double.infinity,
              ),
              AppTextField(
                controller: _passwordController,
                  onChange: () {
                  setState(() {
                    print(_passwordController.text);

                  });
                  },
                  title: "Password",
                  obscureText: _obscure,
                  focusedBorderColor: const AppColors().purple,
                  enabledBorderColor:_passwordController.text.isNotEmpty? const AppColors().purple:const AppColors().gray2,
                  prefixIcon: Image.asset(
                    'images/icon_lock.png',
                    color: const AppColors().icongray,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscure = !_obscure;
                      });
                    },
                    icon: _obscure
                        ? Icon(Icons.remove_red_eye_outlined,
                            color: const AppColors().gray2)
                        : Icon(Icons.visibility_off_outlined,
                            color: const AppColors().gray2),
                  )),
              SizedBox(
                height: 20.h,
                width: double.infinity,
              ),
              Align(
               alignment: AlignmentDirectional.bottomEnd,
               child: InkWell(
                 onTap: (){
                   setState(() {
                     Navigator.pushNamed(context, '/forgot_password_screen');
                   });
                 },
                 child: Text(
                  "Forgot Password?",
                  style: context.getGoogle(
                      fontSize: 12,
                      weight: FontWeight.bold,
                      color: const AppColors().purple),),
               ),
             ),
              SizedBox(
                height: 40.h,
                width: double.infinity,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _preformLogin();
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const AppColors().purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      minimumSize: const Size(double.infinity, 50)),
                  child: Text(
                    "Sign in",
                    style: context.getGoogle(
                        fontSize: 14,
                        weight: FontWeight.w600,
                        color: const AppColors().white),
                  )),
              SizedBox(
                height: 200.h,
                width: double.infinity,
              ),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: InkWell(
                  onTap: (){
                    setState(() {
                      Navigator.pushReplacementNamed(context, '/register_screen');
                    });
                  },
                  child: Text(
                    "Create an account?",
                    style: context.getGoogle(
                        fontSize: 12,
                        weight: FontWeight.bold,
                        color: const AppColors().purple),),
                ),
              ),
              SizedBox(
                height: 0.h,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _preformLogin(){
    if(_checkData()){
      _login();
    }
  }
  bool _checkData(){
    if(_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty){
      return true;
    }
    context.showSnackBar(massage: 'empty Data ',error: true);
    return false;
  }

  void _login() async{
    ProcessResponse processResponse =  await UserDbController().login(email: _emailController.text, password: _passwordController.text);
    if(processResponse.success){
      Navigator.pushReplacementNamed(
          context, '/bottom_navigation_screen');
    }
    context.showSnackBar(massage: processResponse.massage,error:!processResponse.success);

  }
  void _showLanguageBottomSheet() async{
    String? langCode = await showModalBottomSheet(
        context: context,
        shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
        ) ,
        clipBehavior: Clip.antiAlias,
        builder: (context){
      return BottomSheet(
          onClosing: (){},
          builder: (context){
        return StatefulBuilder(builder: (context, setState) {
          return Padding(
            padding:  EdgeInsets.symmetric(horizontal: 25.w,vertical: 15.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Change Language",
                  style: context.getGoogle(
                      fontSize: 20,
                      weight: FontWeight.bold,
                      color: const AppColors().blake2),),
                Text(
                  "Choose suitable Language",
                  style: context.getGoogle(
                      fontSize: 14,
                      weight: FontWeight.bold,
                      color: const AppColors().blake2),),
                const Divider(),
                RadioListTile(title:Text(
                  "English",
                  style: context.getGoogle(
                      fontSize: 14,
                      weight: FontWeight.bold,
                      color: const AppColors().blake2),),value: 'en', groupValue: _language, onChanged: (String? value){
                  setState(() {
                    _language = value!;
                    Navigator.pop(context,'en');
                  });
                }),
                RadioListTile(title:Text(
                  "العربية",
                  style: context.getGoogle(
                      fontSize: 14,
                      weight: FontWeight.bold,
                      color: const AppColors().blake2),),value: 'ar', groupValue: _language, onChanged: (String? value){
                  setState(() {
                    _language = value!;
                    Navigator.pop(context,'ar');
                  });
                }),

              ],
            ),
          );
        },);
      });
    },
    );
    if(langCode!=null){
      LanguageGetXController.to.changeLanguage();
    }
  }
}
