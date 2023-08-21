import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/utils/context_extenssion.dart';
import '../themes/app_color.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.obscureText = false,
    required this.title ,
     this.keyboardType = TextInputType.emailAddress ,
    required this.onChange ,
    required this.controller ,
    required this.enabledBorderColor,
    required this.focusedBorderColor,
    required this.prefixIcon,
    required this.suffixIcon,
  }) ;

  final bool obscureText ;
  final String title ;
  final TextInputType keyboardType ;
  final Widget? prefixIcon ;
  final Widget? suffixIcon ;
  final Color enabledBorderColor ;
  final Color focusedBorderColor ;
  final Function? onChange ;
  final TextEditingController? controller ;


  @override
  Widget build(BuildContext context) {
    return TextField(
      style: context.getGoogle(weight: FontWeight.w500,color: const AppColors().blake2,fontSize: 12),
      obscureText: obscureText,
      keyboardType: keyboardType,
      maxLines: 1,
      minLines: 1,
      // onTap: ,
      // onSubmitted: ,
      onChanged: (value) {
      if(onChange !=null){
        onChange!();
      }
      },
      controller: controller,
      decoration: InputDecoration(
        hintText: title,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 17.h),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: buildOutlineInputBorder(color:enabledBorderColor ),
        focusedBorder: buildOutlineInputBorder(color: focusedBorderColor),

      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder({Color color= Colors.transparent}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: color, width: 1),
      );
  }
}
