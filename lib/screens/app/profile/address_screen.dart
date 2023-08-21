import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/utils/context_extenssion.dart';

import '../../../themes/app_color.dart';
import '../../../wigets/app_text_field.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  bool? _newValue = true;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const AppColors().backgroundApp2,
      appBar: AppBar(
        backgroundColor: const AppColors().backgroundApp2,
        actions: [
          IconButton(
              onPressed: () {},
              icon:
                  Icon(Icons.more_vert_sharp, color: const AppColors().purple)),
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.h,
                width: double.infinity,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name",
                    style: context.getGoogle(
                        fontSize: 12,
                        weight: FontWeight.w500,
                        color: const AppColors().blake2),
                  ),
                  SizedBox(
                    height: 10.h,
                    width: double.infinity,
                  ),
                  AppTextField(
                    controller: _emailController,
                    onChange: () {
                      setState(() {
                        if (_emailController.text.isNotEmpty) {}
                      });
                    },
                    title: "Name",
                    focusedBorderColor: const AppColors().purple,
                    enabledBorderColor: _emailController.text.isNotEmpty
                        ? const AppColors().purple
                        : const AppColors().gray2,
                    prefixIcon: null,
                    suffixIcon: null,
                  ),
                  SizedBox(
                    height: 20.h,
                    width: double.infinity,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Address",
                    style: context.getGoogle(
                        fontSize: 12,
                        weight: FontWeight.w500,
                        color: const AppColors().blake2),
                  ),
                  SizedBox(
                    height: 10.h,
                    width: double.infinity,
                  ),
                  AppTextField(
                    controller: _emailController,
                    onChange: () {
                      setState(() {
                        if (_emailController.text.isNotEmpty) {}
                      });
                    },
                    title: "Address",
                    focusedBorderColor: const AppColors().purple,
                    enabledBorderColor: _emailController.text.isNotEmpty
                        ? const AppColors().purple
                        : const AppColors().gray2,
                    prefixIcon: null,
                    suffixIcon: null,
                  ),
                  SizedBox(
                    height: 20.h,
                    width: double.infinity,
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "City",
                        style: context.getGoogle(
                            fontSize: 12,
                            weight: FontWeight.w500,
                            color: const AppColors().blake2),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        width: 150.w,
                        child: AppTextField(
                          controller: _emailController,
                          onChange: () {
                            setState(() {
                              if (_emailController.text.isNotEmpty) {}
                            });
                          },
                          title: "City",
                          focusedBorderColor: const AppColors().purple,
                          enabledBorderColor: _emailController.text.isNotEmpty
                              ? const AppColors().purple
                              : const AppColors().gray2,
                          prefixIcon: null,
                          suffixIcon: null,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ZIP Code",
                        style: context.getGoogle(
                            fontSize: 12,
                            weight: FontWeight.w500,
                            color: const AppColors().blake2),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        width: 150.w,
                        child: AppTextField(
                          controller: _emailController,
                          onChange: () {
                            setState(() {
                              if (_emailController.text.isNotEmpty) {}
                            });
                          },
                          title: "ZIP Code",
                          focusedBorderColor: const AppColors().purple,
                          enabledBorderColor: _emailController.text.isNotEmpty
                              ? const AppColors().purple
                              : const AppColors().gray2,
                          prefixIcon: null,
                          suffixIcon: null,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mobile number",
                    style: context.getGoogle(
                        fontSize: 12,
                        weight: FontWeight.w500,
                        color: const AppColors().blake2),
                  ),
                  SizedBox(
                    height: 10.h,
                    width: double.infinity,
                  ),
                  AppTextField(
                    controller: _emailController,
                    onChange: () {
                      setState(() {
                        if (_emailController.text.isNotEmpty) {}
                      });
                    },
                    title: "Mobile number",
                    focusedBorderColor: const AppColors().purple,
                    enabledBorderColor: _emailController.text.isNotEmpty
                        ? const AppColors().purple
                        : const AppColors().gray2,
                    prefixIcon: null,
                    suffixIcon: null,
                  ),
                  SizedBox(
                    height: 20.h,
                    width: double.infinity,
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                      side: MaterialStateBorderSide.resolveWith((states) {
                        if(states.contains(MaterialState.pressed)){
                          return BorderSide(color: const AppColors().gray2);
                        }
                        else{
                          return BorderSide(color: const AppColors().gray2);
                        }
                      }),
                      value: _newValue,
                      // side: BorderSide(color: const AppColors().gray2, width: 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      activeColor: Colors.transparent,
                      checkColor: Colors.green,
                      onChanged: (bool? value) {
                        setState(() {
                          _newValue = value;
                        });
                      }),
                  Text(
                    "Set as default address",
                    style: context.getGoogle(
                        fontSize: 12,
                        weight: FontWeight.w500,
                        color: const AppColors().blake2),
                  ),
                ],
              ),
              SizedBox(
                height: 60.h,
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
                    "Next",
                    style: context.getGoogle(
                        fontSize: 14,
                        weight: FontWeight.w600,
                        color: const AppColors().white),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
