import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_app/utils/context_extenssion.dart';
import 'package:store_app/wigets/item_cart.dart';

import '../../themes/app_color.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  bool _selectChoose = true;
  int _itemCount = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const AppColors().backgroundApp2,
      appBar: AppBar(
        backgroundColor: const AppColors().backgroundApp2,

        leadingWidth: 100,
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
                          if (_selectChoose != false) {
                            _selectChoose = !_selectChoose;
                          }
                        });
                      },
                      padding: EdgeInsets.symmetric(horizontal: 14.w),
                      value: 'Sort by price',
                      height: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Sort by price', style: GoogleFonts.poppins()),
                          Icon(_selectChoose ? null : Icons.check,
                              color: Colors.green),
                        ],
                      )),
                  const PopupMenuDivider(),
                  PopupMenuItem(
                      onTap: () {
                        setState(() {
                          if (_selectChoose != true) {
                            _selectChoose = !_selectChoose;
                          }
                        });
                      },
                      padding: EdgeInsets.symmetric(horizontal: 14.w),
                      value: 'Sort by date',
                      height: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Sort by date', style: GoogleFonts.poppins()),
                          Icon(_selectChoose ? Icons.check : null,
                              color: Colors.green),
                        ],
                      )),
                  const PopupMenuDivider(
                    height: 20,
                  ),
                  PopupMenuItem(
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    value: 'Remove all items',
                    height: 20,
                    child: Text(
                      'Remove all items',
                      style: GoogleFonts.poppins(color: Colors.red),
                    ),
                  ),
                ];
              }),
          SizedBox(
            width: 15.w,
          ),
        ],
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
      body: ListView(children: [
        ListView.builder(
            // separatorBuilder: (BuildContext context, int index) =>  Divider(color: const AppColors().blake2,
            //   thickness: 0.2,),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            itemCount: _itemCount,
            itemBuilder: (context, index) {
              return   Slidable(
                key: ValueKey(index),
                endActionPane: ActionPane(
                  motion: const BehindMotion(),
                  dismissible: DismissiblePane(onDismissed: () {}),
                  children:  [
                    SlidableAction(
                      onPressed: (context) {
                        setState(() {
                          _itemCount--;
                        });
                      },
                      backgroundColor: const AppColors().red,
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Remove from\nFavourites',
                    ),
                  ],
                ), child:   Container(),
              );
            }
            ),
        Text(
          textAlign: TextAlign.center,
          "Total Items: 4 Items",
          style: context.getGoogle(
              fontSize: 16,
              weight: FontWeight.bold,
              color: const AppColors().blueOcc),
        ),
        Text(
          textAlign: TextAlign.center,
          "Total Price: \$266",
          style: context.getGoogle(
              fontSize: 16,
              weight: FontWeight.bold,
              color: const AppColors().blake2),
        ),
        SizedBox(
          height: 40.h,
          width: double.infinity,
        ),

      ]

      ),
    );
  }
}
// children: [
//   Slidable(
//     endActionPane: ActionPane(
//       motion: const ScrollMotion(),
//       dismissible: DismissiblePane(onDismissed: () {}),
//       children:  [
//         SlidableAction(
//           onPressed: (context) {},
//           backgroundColor: Color(0xFFFE4A49),
//           foregroundColor: Colors.white,
//           icon: Icons.delete,
//           label: 'Remove from\nFavourites',
//         ),
//       ],
//     ), child:  const ItemCart(),
//   ),
//   const ItemCart(),
//   SizedBox(
//     height: 40.h,
//     width: double.infinity,
//   ),

// ],
///
// /  Text(
//     textAlign: TextAlign.center,
//     "Total Items: 4 Items",
//     style: context.getGoogle(
//     fontSize: 16,
//     weight: FontWeight.bold,
//     color: const AppColors().blueOcc),
//     ),
//     Text(
//     textAlign: TextAlign.center,
//     "Total Price: \$266",
//     style: context.getGoogle(
//     fontSize: 16,
//     weight: FontWeight.bold,
//     color: const AppColors().blake2),
//     ),
//     SizedBox(
//     height: 40.h,
//     width: double.infinity,
//     ),
