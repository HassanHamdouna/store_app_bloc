import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../themes/app_color.dart';

class ItemListSetting extends StatelessWidget {
  const ItemListSetting({
    super.key,
    required this.onTap,
    required this.child1,
    required this.title,
    required this.child2,
     this.visible = true,
  });

  final GestureTapCallback? onTap;
  final Widget? child1;
  final String title;
  final Widget? child2;
  final bool visible;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric( horizontal: 20.w),
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: InkWell(
              onTap: onTap,
              child: Row(
                children: [
                  Container(
                    child: child1,
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Text(title,style: GoogleFonts.roboto(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: const AppColors().blake2,
                  ),),

                  const Spacer(),
                  Container(
                    child: child2,
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: visible,
            child: Divider(
              thickness: 0.2,
              color: const AppColors().blake,
            ),
          ),
        ],
      ),
    );
  }
}
