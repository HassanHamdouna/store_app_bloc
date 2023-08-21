import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_app/themes/app_color.dart';
import 'package:store_app/utils/context_extenssion.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 80.h,
            ),
            Text(
              'Simply',
              style: context.getGoogle(
                  fontSize: 25,
                  weight: FontWeight.bold,
                  color: const AppColors().blake2),
            ),
            Text("Select your photographer, \n then go to session!",
                style: context.getGoogle(
                    fontSize: 16,
                    weight: FontWeight.w500,
                    color: const AppColors().blake2),
                textAlign: TextAlign.center),
            SizedBox(
              height: 100.h,
            ),
            Image.asset('images/image_1.png',
                width: 241, height: 289, fit: BoxFit.cover),
            SizedBox(
              height: 120.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        Navigator.pushReplacementNamed(
                            context, '/login_screen');
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const AppColors().purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        minimumSize: const Size(135, 50)),
                    child: Text(
                      "Sign in",
                      style: context.getGoogle(
                          fontSize: 14,
                          weight: FontWeight.w600,
                          color: const AppColors().white),
                    )),
                SizedBox(
                  width: 20.w,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        Navigator.pushReplacementNamed(
                            context, '/register_screen');
                      });
                    },
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
                      "Sign up",
                      style: context.getGoogle(
                          fontSize: 14,
                          weight: FontWeight.w600,
                          color: const AppColors().purple),
                    )),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
