import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_app/utils/context_extenssion.dart';
import '../../themes/app_color.dart';

class ItemProduct extends StatelessWidget {
  const ItemProduct({
    super.key,
    required this.nameProduct,
    required this.infoProduct,
    required this.priceProduct,
    required this.qurProduct,
    required this.onTab,
    required this.onPressedDelete,
    required this.onPressedAddCart,
  });

  final String nameProduct;
  final String infoProduct;
  final String priceProduct;
  final String qurProduct;
  final Function()? onTab;
  final Function()? onPressedDelete;
  final Function()? onPressedAddCart;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: onTab,
            child: Container(
              height: 148.h,
              width: 140.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: const AppColors().grayOcc,

              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 8.w, vertical: 2.h),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Align(
                            alignment: AlignmentDirectional.topEnd,
                            child: IconButton(onPressed: onPressedDelete,icon: Icon(Icons.delete,color: const AppColors().red),)),
                        Spacer(),
                        Align(
                            alignment: AlignmentDirectional.topEnd,
                            child: IconButton(onPressed: onPressedAddCart,icon: Icon(Icons.add_shopping_cart_outlined,color: const AppColors().red),)),
                        Spacer(),
                        Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Icon(Icons.favorite,color: const AppColors().red,)),


                      ],
                    ),
                    Image.asset('images/image_product_2.png', width: 100.w, height: 100.h, fit: BoxFit.cover),

                  ],
                ),
              ),
            ),
          ),
          Text(
            nameProduct,
            style: context.getGoogle(
                fontSize: 14,
                weight: FontWeight.w600,
                color: const AppColors().purple),
          ),
          Text(
            infoProduct,
            style: context.getGoogle(
                fontSize: 14,
                weight: FontWeight.w600,
                color: const AppColors().blake2),
          ),
          Row(
            children: [
              Text(
                priceProduct,
                style: context.getGoogle(
                    fontSize: 14,
                    weight: FontWeight.w600,
                    color: const AppColors().blueOcc),
              ),
              SizedBox(
                width: 15.w,
              ),
              Text(
                qurProduct,
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    decoration: TextDecoration.lineThrough,
                    decorationThickness: 3,
                    fontWeight: FontWeight.w600,
                    color: const AppColors().red),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
