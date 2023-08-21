import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/utils/context_extenssion.dart';

import '../themes/app_color.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const AppColors().white,
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30.h,
            ),
            Text('Are you sure to remove\n           this card?',style: context.getGoogle(fontSize: 16, weight: FontWeight.w500, color: const AppColors().blake2),),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        side: BorderSide(
                            color: const AppColors().purple, width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        minimumSize: const Size(135, 50)),
                    child: Text(
                      "Cancel ",
                      style: context.getGoogle(
                          fontSize: 14,
                          weight: FontWeight.w600,
                          color: const AppColors().purple),
                    )),
                SizedBox(
                  width: 20.w,
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const AppColors().purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        minimumSize: const Size(135, 50)),
                    child: Text(
                      "Remove",
                      style: context.getGoogle(
                          fontSize: 14,
                          weight: FontWeight.w600,
                          color: const AppColors().white),
                    )),
                Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
