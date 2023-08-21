import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_app/utils/context_extenssion.dart';

import '../themes/app_color.dart';

class ItemCart extends StatelessWidget {
  const ItemCart({
    super.key,
    required this.nameProduct,
    required this.priceProduct,
    required this.quantityProduct,
    this.buttonPlus,
      this.buttonMinus,
      this.text,
    this.visible = false,
  });
  final String nameProduct;
  final String priceProduct;
  final String quantityProduct;

  final GestureTapCallback? buttonPlus;
  final GestureTapCallback? buttonMinus;
  final String? text;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            Align(
                alignment: AlignmentDirectional.center,child: Image.asset('images/image_product.png')),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    nameProduct,
                    style: context.getGoogle(
                        fontSize: 16,
                        weight: FontWeight.bold,
                        color: const AppColors().blake2),
                  ),
                  Row(
                    children: [
                      Text(
                        priceProduct,
                        style: context.getGoogle(
                            fontSize: 16,
                            weight: FontWeight.bold,
                            color: const AppColors().blueOcc),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Text(
                        quantityProduct,
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            decoration: TextDecoration.lineThrough,
                            decorationThickness: 3,
                            fontWeight: FontWeight.bold,
                            color: const AppColors().red),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Visibility(
                    visible: visible,
                    child: Container(
                      width: 70.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        color: const AppColors().grayOcc,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: buttonMinus,
                            child: Text(
                              "-",
                              style: context.getGoogle(
                                  fontSize: 16,
                                  weight: FontWeight.bold,
                                  color: const AppColors().purple),
                            ),
                          ),
                          Text(text.toString(),
                            style: context.getGoogle(
                                fontSize: 16,
                                weight: FontWeight.bold,
                                color: const AppColors().blake2),
                          ),
                          InkWell(
                            onTap: buttonPlus,
                            child: Text(
                              "+",
                              style: context.getGoogle(
                                  fontSize: 16,
                                  weight: FontWeight.bold,
                                  color: const AppColors().purple),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],

              ),

            ),
          ],
        ),
        Divider(
          color: const AppColors().blake2,
          thickness: 0.2,
        ),
      ],
    );
  }
}
