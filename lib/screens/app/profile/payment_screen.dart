import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_app/utils/context_extenssion.dart';

import '../../../themes/app_color.dart';
import '../../../wigets/app_text_field.dart';
import '../../../wigets/item_credit_card.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  bool _selectChoose = true;

  late TextEditingController _cardNameController;
  late TextEditingController _cardNumberController;
  late TextEditingController _cvvController;
  late TextEditingController _monthNumberController;
  late TextEditingController _dayNumberController;

  @override
  void initState() {
    super.initState();
    _cardNameController = TextEditingController();
    _cardNumberController = TextEditingController();
    _cvvController = TextEditingController();
    _monthNumberController = TextEditingController();
    _dayNumberController  = TextEditingController();
  }

  @override
  void dispose() {
    _cardNameController.dispose();
    _cardNumberController.dispose();
    _cvvController.dispose();
    _monthNumberController.dispose();
    _dayNumberController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const AppColors().backgroundApp2,
      appBar: AppBar(
        backgroundColor: const AppColors().backgroundApp2,
        actions: [
          PopupMenuButton<String>(
              icon: Icon(Icons.more_vert_sharp,
                  size: 30, color: const AppColors().purple),
              elevation: 10,
              offset: const Offset(-10, 55),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                      onTap: () {
                        setState(() {
                          if (_selectChoose != true) {
                            _selectChoose = !_selectChoose;
                          }
                        });
                      },
                      padding: EdgeInsets.symmetric(horizontal: 14.w),
                      value: 'Make Default',
                      height: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Make Default', style: GoogleFonts.poppins()),
                          Icon(_selectChoose ? Icons.check : null,
                              color: Colors.green),
                        ],
                      )),
                  const PopupMenuDivider(
                    height: 20,
                  ),
                  PopupMenuItem(
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    value: 'Remove Card',
                    height: 20,
                    child: Text(
                      'Remove Card',
                      style: GoogleFonts.poppins(color: Colors.red),
                    ),
                    onTap: () {
                      Future.delayed(
                        const Duration(seconds: 0), () => _showAlertDialog()
                      );
                    },
                  ),

                ];
              }),
          SizedBox(
            width: 15.w,
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                  width: double.infinity,
                ),
                 const Align(
                  alignment: AlignmentDirectional.center,

                  child:  ItemCreditCard(cardName: 'hassan',numberDay: '23',numberMonth: 3,cardNumber: '1020 3040 5060'),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cardholder Name",
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
                      keyboardType: TextInputType.name,
                      controller: _cardNameController,
                      onChange: () {
                        setState(() {
                          if (_cardNameController.text.isNotEmpty) {}
                        });
                      },
                      title: "Cardholder Name",
                      focusedBorderColor: const AppColors().purple,
                      enabledBorderColor: _cardNameController.text.isNotEmpty
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
                      "Card Number",
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
                      keyboardType: TextInputType.number,
                      controller: _cardNumberController,
                      onChange: () {
                        setState(() {
                          if (_cardNumberController.text.isNotEmpty) {}
                        });
                      },
                      title: "0000 0000 0000",
                      focusedBorderColor: const AppColors().purple,
                      enabledBorderColor: _cardNumberController.text.isNotEmpty
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
                          "cvv\\cvc",
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
                            keyboardType: TextInputType.number,
                            controller: _cvvController,
                            onChange: () {
                              setState(() {
                                if (_cvvController.text.isNotEmpty) {}
                              });
                            },
                            title: "000",
                            focusedBorderColor: const AppColors().purple,
                            enabledBorderColor: _cvvController.text.isNotEmpty
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
                          "Exp. Date",
                          style: context.getGoogle(
                              fontSize: 12,
                              weight: FontWeight.w500,
                              color: const AppColors().blake2),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          width: 70.w,
                          child: AppTextField(
                            keyboardType: TextInputType.number,
                            controller: _monthNumberController,
                            onChange: () {
                              setState(() {
                                if (_monthNumberController.text.isNotEmpty) {}
                              });
                            },
                            title: "00",
                            focusedBorderColor: const AppColors().purple,
                            enabledBorderColor: _monthNumberController.text.isNotEmpty
                                ? const AppColors().purple
                                : const AppColors().gray2,
                            prefixIcon: null,
                            suffixIcon: null,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "",
                          style: context.getGoogle(
                              fontSize: 12,
                              weight: FontWeight.w500,
                              color: const AppColors().blake2),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          width: 70.w,
                          child: AppTextField(
                            keyboardType: TextInputType.number,
                            controller: _dayNumberController,
                            onChange: () {
                              setState(() {
                                if (_dayNumberController.text.isNotEmpty) {}
                              });
                            },
                            title: "00",
                            focusedBorderColor: const AppColors().purple,
                            enabledBorderColor: _dayNumberController.text.isNotEmpty
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
                SizedBox(
                  height: 20.h,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // Navigator.pushReplacementNamed(
                        //     context, '/bottom_navigation_screen');
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const AppColors().purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        minimumSize: const Size(double.infinity, 50)),
                    child: Text(
                      "Submit Order",
                      style: context.getGoogle(
                          fontSize: 14,
                          weight: FontWeight.w600,
                          color: const AppColors().white),
                    )),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }

  _showAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {

          // return AlertDialog(
          //   title: Text("Accept?"),
          //   content: Text("Do you accept?"),
          //   actions: [
          //     TextButton(child: Text("Yes"),onPressed: (){
          //       Navigator.of(context).pop(); // Close the dialog
          //     }),
          //     TextButton(child: Text("No"),onPressed: (){
          //       Navigator.of(context).pop(); // Close the dialog
          //     }),
          //   ],
          // );
          return Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              height: 200,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 25.w,vertical: 25.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  Text(
                  "Are you sure to remove\n this card?",
                  textAlign: TextAlign.center,
                  style: context.getGoogle(
                      fontSize: 14,
                      weight: FontWeight.w600,
                      color: const AppColors().blake2),),
                    Spacer(),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                        Spacer(),
                      ElevatedButton(
                          onPressed: () =>Navigator.of(context).pop(),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              minimumSize: const Size(120, 50)),
                          child: Text(
                            "Cancel",
                            style: context.getGoogle(
                                fontSize: 14,
                                weight: FontWeight.w600,
                                color: const AppColors().purple),
                          )),
                      SizedBox(
                          width: 20.w,
                        ),
                      ElevatedButton(
                          onPressed: () =>Navigator.of(context).pop(),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const AppColors().purple,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              minimumSize: const Size(120, 50)),
                          child: Text(
                            "Remove",
                            style: context.getGoogle(
                                fontSize: 14,
                                weight: FontWeight.w600,
                                color: const AppColors().white),
                          )),
                        Spacer(),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          );

        },);

      },
    );
  }

}


