import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/database/controllers/user_db_controller.dart';
import 'package:store_app/models/process_response.dart';
import 'package:store_app/preferences/shared_pref_controller.dart';
import 'package:store_app/utils/context_extenssion.dart';

import '../../models/user.dart';
import '../../themes/app_color.dart';
import '../../wigets/app_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscure = false;

  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: SingleChildScrollView(
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

                    });
                  },
                  title: "Email",
                  focusedBorderColor: const AppColors().purple,
                  enabledBorderColor:_emailController.text.isNotEmpty? const AppColors().purple:const AppColors().gray2,
                  prefixIcon: Image.asset('images/icon_email.png'),
                  suffixIcon: _emailController.text.isNotEmpty ? Image.asset('images/icon_check.png'): null,
                ),
                SizedBox(
                  height: 20.h,
                  width: double.infinity,
                ),
                AppTextField(
                  controller: _phoneController,
                  onChange: () {
                    setState(() {

                    });
                  },
                  title: "Mobile Number",
                  keyboardType: TextInputType.phone,
                  focusedBorderColor: const AppColors().purple,
                  enabledBorderColor:_phoneController.text.isNotEmpty? const AppColors().purple:const AppColors().gray2,
                  prefixIcon: Image.asset('images/icon_phone.png'),
                  suffixIcon: _phoneController.text.isNotEmpty ? Image.asset('images/icon_check.png'): null,
                ),
                SizedBox(
                  height: 20.h,
                  width: double.infinity,
                ),
                AppTextField(
                    controller: _passwordController,
                    onChange: () {
                      setState(() {

                      });
                    },
                    title: "Password",
                    obscureText: _obscure,
                    focusedBorderColor: const AppColors().purple,
                    // enabledBorderColor: const AppColors().gray2,
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
                  height: 40.h,
                  width: double.infinity,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _preformRegister();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const AppColors().purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        minimumSize: const Size(double.infinity, 50)),
                    child: Text(
                      "Create an account",
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
                        Navigator.pushReplacementNamed(context, '/login_screen');
                      });
                    },
                    child: Text(
                      "Already have account?",
                      style: context.getGoogle(
                          fontSize: 12,
                          weight: FontWeight.bold,
                          color: const AppColors().purple),),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                  width: double.infinity,
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> _preformRegister() async{
    if(_checkData()){
     await _register();
    }
  }
  bool _checkData(){
    if(_emailController.text.isNotEmpty && _phoneController.text.isNotEmpty && _passwordController.text.isNotEmpty){
      return true;
    }
    context.showSnackBar(massage: 'empty Data ',error: true);
    return false;
  }

  Future<void> _register() async{
    ProcessResponse processResponse =  await UserDbController().register(user: user);

    if(processResponse.success) {
      Navigator.pushReplacementNamed(
          context, '/bottom_navigation_screen');
    }
    context.showSnackBar(massage: processResponse.massage ,error:!processResponse.success );

  }
  User get user {
    User user = User();
    user.email = _emailController.text;
    user.phone = int.parse(_phoneController.text);
    user.password = _passwordController.text;
    return user;
  }

}
