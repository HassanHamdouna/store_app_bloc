import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/utils/context_extenssion.dart';

import '../themes/app_color.dart';

class SectionHome extends StatelessWidget {
  const SectionHome({
    super.key,
    required this.title,
    required this.onPressed,

  });

  final Function()? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: context.getGoogle(
                fontSize: 18,
                weight: FontWeight.w800,
                color: const AppColors().blake2),
          ),
          TextButton(
            onPressed: onPressed,
            child: Text("View All",
            style: context.getGoogle(
                fontSize: 14,
                weight: FontWeight.bold,
                color: const AppColors().purple),
          ),
          ),
        ],
      ),
    );
  }
}
