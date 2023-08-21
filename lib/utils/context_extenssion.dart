import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/app/bottom_navigation_screen.dart';
import '../screens/app/details_product_screen.dart';
import '../screens/app/profile/address_screen.dart';
import '../screens/app/profile/payment_screen.dart';
import '../screens/auth/forgot_password_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/register_screen.dart';
import '../screens/core/launch_screen.dart';
import '../screens/core/on_boarding_screen.dart';
import '../screens/products/product_screen.dart';


extension ContextHelper on BuildContext{

  Map<String,WidgetBuilder> get route => {
    '/launch_screen': (context) => const LaunchScreen(),
    '/on_boarding_screen': (context) => const OnBoardingScreen(),
    '/register_screen': (context) => const RegisterScreen(),
    '/login_screen': (context) => const LoginScreen(),
    '/forgot_password_screen': (context) =>
    const ForgotPasswordScreen(),
    '/bottom_navigation_screen': (context) =>
    const BottomNavigationScreen(),
    '/address_screen': (context) => const AddressScreen(),
    '/details_product_screen': (context) =>
    const DetailsProductScreen(),
    '/payment_screen': (context) => const PaymentScreen(),
    '/product_screen': (context) => const ProductScreen(),
  };

  ThemeData get appThem => ThemeData(
    appBarTheme: AppBarTheme(
      // color: Colors.transparent,
      titleSpacing: -25,
      centerTitle: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 16,
        // color: AppColors().purple,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: const IconThemeData(color: Colors.black),
    ),
    primarySwatch: Colors.blue,
  );

  void showSnackBar({required String massage, bool error = false }) {
    ScaffoldMessenger.of(this).showSnackBar(
        SnackBar(
        content: Text(massage, style: GoogleFonts.poppins(
          fontWeight:FontWeight.bold,
          fontSize: 14,
          color: Colors.white,
        ),),
         behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r)
          ),
          backgroundColor: error ? Colors.red : Colors.green,
          duration: const Duration(milliseconds: 800),
          dismissDirection: DismissDirection.horizontal,
        ),
    );
  }

  AppLocalizations get localizations {
    return AppLocalizations.of(this)!;
  }

  TextStyle getGoogle({required double fontSize, required FontWeight weight, required Color color,}){
    return GoogleFonts.poppins(
      fontSize: fontSize.sp,
      color:  color,
      fontWeight: weight,
    );
  }
}