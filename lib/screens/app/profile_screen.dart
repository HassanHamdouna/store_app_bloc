import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';
import 'package:store_app/get/carts_getx_controller.dart';
import 'package:store_app/get/products_getx_controller.dart';
import 'package:store_app/preferences/shared_pref_controller.dart';
import 'package:store_app/utils/context_extenssion.dart';
import 'package:store_app/wigets/item_list_setting.dart';

import '../../themes/app_color.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const AppColors().white,
      appBar: AppBar(
        backgroundColor: const AppColors().backgroundApp2,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.edit, color: const AppColors().purple)),
          SizedBox(
            width: 20.w,
          ),
        ],
        leadingWidth: 100,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
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
      body: Column(
        children: [

          Container(
            color: const AppColors().backgroundApp2,
            child: Column(
              children: [
                SizedBox(
                  height: 8.h,
                  width: double.infinity,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Image.asset(
                      'images/image_profile.png',
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Text(
                      'Tanya Robinson',
                      style: context.getGoogle(
                        fontSize: 20.sp,
                        weight: FontWeight.bold,
                        color: const AppColors().blake2,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50.h,
                ),
              ],
            ),
          ),
          Container(
            color: const AppColors().white,
            child: Column(
              children: [
                ItemListSetting(
                    onTap: () {
                    },
                    child1: Icon(
                      Icons.notifications,
                      color: const AppColors().purple,

                    ),
                    title: 'Notifications',
                    child2: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: const AppColors().purple,
                    )),
                ItemListSetting(
                    onTap: () {},
                    child1: Icon(
                      Icons.description_sharp,
                      color: const AppColors().purple,
                    ),
                    title: 'My Orders',
                    child2: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: const AppColors().purple,
                    )),
                ItemListSetting(
                    onTap: () =>Navigator.pushNamed(context, '/address_screen'),
                    child1: Icon(
                      Icons.near_me,
                      color: const AppColors().purple,
                    ),
                    title: 'Address',
                    child2: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: const AppColors().purple,
                    )),
                ItemListSetting(
                    onTap: () => Navigator.pushNamed(context, '/payment_screen'),
                    child1: Icon(
                      Icons.payment_outlined,
                      color: const AppColors().purple,
                    ),
                    title: 'Payment',
                    child2: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: const AppColors().purple,
                    )),
                ItemListSetting(
                    onTap: () {},
                    child1: Icon(
                      Icons.favorite,
                      color: const AppColors().purple,
                    ),
                    title: 'Favourites',
                    child2: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: const AppColors().purple,
                    )),
                ItemListSetting(
                    onTap: () {},
                    child1: Icon(
                      Icons.settings,
                      color: const AppColors().purple,
                    ),
                    title: 'Settings',
                    child2: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: const AppColors().purple,
                    ),
                    visible: true),
                ItemListSetting(
                    onTap: () {
                      SharedPrefController().removeValueFor(PrefKey.loginIn.name);
                      Navigator.pushReplacementNamed(context, '/login_screen');
                      Get.delete<CartsGetXController>();
                      Get.delete<ProductsGetXController>();
                    },
                    child1: Icon(
                      Icons.logout_rounded,
                      color: const AppColors().purple,
                    ),
                    title: 'Log out',
                    child2: null,
                    visible: false),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
