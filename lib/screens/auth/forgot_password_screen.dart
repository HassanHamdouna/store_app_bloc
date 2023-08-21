import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/utils/context_extenssion.dart';

import '../../themes/app_color.dart';
import '../../wigets/app_text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  late TextEditingController _emailController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: IconButton(onPressed: ()=>Navigator.pop(context),icon: Icon(Icons.arrow_back_ios,color: const AppColors().purple)),
        titleSpacing: -25,
        centerTitle: false,
        title: Text("Back", style: context.getGoogle(
              fontSize: 16,
              weight: FontWeight.bold,
              color: const AppColors().purple),),
      ),

     body: Padding(
       padding:  EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
         Text(
         "Recover\nyour account",
         style: context.getGoogle(
             fontSize: 25,
             weight: FontWeight.bold,
             color: const AppColors().blake2),),


           SizedBox(
             height: 167.h,
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
             title: "Enter email or phone number ",
             focusedBorderColor: const AppColors().purple,
             enabledBorderColor:_emailController.text.isNotEmpty? const AppColors().purple:const AppColors().gray2,
             prefixIcon: null,
             suffixIcon: null,
           ),

           SizedBox(
             height: 20.h,
             width: double.infinity,
           ),
           ElevatedButton(
               onPressed: () {
                 setState(() {
                   Navigator.pushReplacementNamed(
                       context, '/bottom_navigation_screen');
                 });
               },
               style: ElevatedButton.styleFrom(
                   backgroundColor: const AppColors().purple,
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(10.r),
                   ),
                   minimumSize: const Size(double.infinity, 50)),
               child: Text(
                 "Next",
                 style: context.getGoogle(
                     fontSize: 14,
                     weight: FontWeight.w600,
                     color: const AppColors().white),
               )),
           SizedBox(
             height: 230.h,
             width: double.infinity,
           ),
         ],
       ),
     ),
    );
  }
}
