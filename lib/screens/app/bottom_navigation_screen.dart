import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_app/models/bn_screen.dart';
import 'package:store_app/screens/app/cart_screen.dart';
import 'package:store_app/screens/app/favourite_screen.dart';
import 'package:store_app/screens/app/home_screen.dart';
import 'package:store_app/screens/app/profile_screen.dart';
import 'package:store_app/themes/app_color.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _curren =0 ;
  final List<BnScreen> _scren =   <BnScreen>  [
    BnScreen(widgetScreen: const HomeScreen()),
    BnScreen(widgetScreen: const CartScreen()),
    BnScreen(widgetScreen: const FavouriteScreen()),
    BnScreen(widgetScreen: const ProfileScreen()),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: _scren[_curren].widgetScreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _curren,
        onTap: (int index){
          setState(() {
            _curren = index;
          });
        },
        elevation: 10,
        selectedItemColor: const AppColors().purple,
        selectedLabelStyle: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w600
        ),
        unselectedLabelStyle: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w500
        ),
        backgroundColor: const AppColors().white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('images/icon_home.png',color: const AppColors().gray2),
            activeIcon: Image.asset('images/icon_home.png',color: const AppColors().purple,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/icon_cart.png',color: const AppColors().gray2),
            activeIcon: Image.asset('images/icon_cart.png',color: const AppColors().purple,),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/icon_favorite.png',color: const AppColors().gray2),
            activeIcon: Image.asset('images/icon_favorite.png',color: const AppColors().purple,),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/icon_profile.png',color: const AppColors().gray2),
            activeIcon: Image.asset('images/icon_profile.png',color: const AppColors().purple,),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
