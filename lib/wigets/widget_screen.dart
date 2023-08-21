import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/utils/context_extenssion.dart';

import '../../themes/app_color.dart';
class WidgetScreen extends StatelessWidget {
  const WidgetScreen({
    required this.image,
    required this.title,
    required this.subTitle,
    required this.textButton,
    required this.onPressed,
    super.key,
  });

  final String image;
  final String title;
  final String subTitle;
  final String textButton;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 60.h,
          ),
          Image.asset('images/$image.png'),
          SizedBox(
            height: 70.h,
          ),
          Text(title,style: context.getGoogle(fontSize: 25, weight: FontWeight.bold, color: const AppColors().blake2),),
          SizedBox(
            height: 15.h,
          ),
          Text(textAlign: TextAlign.center,subTitle,style: context.getGoogle(fontSize: 14, weight: FontWeight.w300, color: const AppColors().blake2),),
          SizedBox(
            height: 120.h,
          ),
          ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                  backgroundColor: const AppColors().purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  minimumSize: const Size(double.infinity, 50)),
              child: Text(
                textButton,
                style: context.getGoogle(
                    fontSize: 14,
                    weight: FontWeight.w600,
                    color: const AppColors().white),
              )),
        ],
      ),
    );
  }
}
