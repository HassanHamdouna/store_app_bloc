import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/utils/context_extenssion.dart';

import '../../../themes/app_color.dart';

class ItemCreditCard extends StatelessWidget {
  const ItemCreditCard({
    super.key,
    this.cardNumber = '0000 0000 0000',
    required this.cardName,
    required this.numberMonth,
    required this.numberDay ,
  });

  final String? cardNumber;
  final String? cardName;
  final int? numberMonth;
  final String numberDay;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      color: AppColors().blueOcc,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Container(
        height: 170.h,
        width: 285.w,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Image.asset(
                    "images/visa_logo.png",
                    height: 40.h,
                    width: 50.w,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Container(
                  alignment: AlignmentDirectional.centerStart,
                  child: Image.asset(
                    "images/contact_less.png",
                    height: 30.h,
                    width: 50.w,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              ' $cardNumber ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 21,
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cardholder',
                      style: context.getGoogle(
                          color: const AppColors().white,
                          fontSize: 10,
                          weight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      cardName.toString(),
                      style: context.getGoogle(
                          color: const AppColors().white,
                          fontSize: 12,
                          weight: FontWeight.w500),
                    )
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Exp. Date',
                      style: context.getGoogle(
                          color: const AppColors().white,
                          fontSize: 10,
                          weight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      '${numberMonth.toString()}/${numberDay.toString()}',
                      style: context.getGoogle(
                          color: const AppColors().white,
                          fontSize: 12,
                          weight: FontWeight.w500),
                    )
                  ],
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
