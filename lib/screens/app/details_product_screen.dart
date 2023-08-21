import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/utils/context_extenssion.dart';

import '../../themes/app_color.dart';

class DetailsProductScreen extends StatefulWidget {
  const DetailsProductScreen({Key? key}) : super(key: key);

  @override
  State<DetailsProductScreen> createState() => _DetailsProductScreenState();
}

class _DetailsProductScreenState extends State<DetailsProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const AppColors().backgroundApp2,
      appBar: AppBar(
        backgroundColor: const AppColors().backgroundApp2,
        leadingWidth: 100,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios, color: const AppColors().purple)),
        titleSpacing: -25,
        centerTitle: false,
        title: Text(
          "Back",
          style: context.getGoogle(
              fontSize: 16,
              weight: FontWeight.bold,
              color: const AppColors().purple),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        children: [
          Image.asset(
            'images/iamge_product_2.png',
            width: 315.w,
            height: 220.h,
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Expanded(
                  flex: 4,
                  child: Text(
                'Montpellier White Chronograph Watch',
                style: context.getGoogle(
                    fontSize: 18,
                    weight: FontWeight.bold,
                    color: const AppColors().blake2),
              )),
              Expanded(
                flex: 1,
                  child: Text(
                '\$189',
                style: context.getGoogle(
                    fontSize: 18,
                    weight: FontWeight.bold,
                    color: const AppColors().blake2),
              )),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Divider(
            color: const AppColors().blake2,
          ),
          Text(
            'Inspired by Scandinavian design and engineering, the ontpellier watch is a quality-built accessory for everyday wear. This handmade timepiece has crystal quartz movement, blue crocodile-embossed leather strap and silver water resistant stainless steel case.  Whether you slip it on solo or with a stack of  Grand Frank bangles, the result is timeless.',
            style: context.getGoogle(
                fontSize: 14,
                weight: FontWeight.w400,
                color: const AppColors().blake2),
          ),
          SizedBox(
            height: 50.h,
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
                "Add to Cart",
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
