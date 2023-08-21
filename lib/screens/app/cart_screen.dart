import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_app/bloc/bloc/carts_bloc.dart';
import 'package:store_app/bloc/events/carts_event.dart';
import 'package:store_app/bloc/states/crud_state.dart';
import 'package:store_app/models/cart.dart';
import 'package:store_app/utils/context_extenssion.dart';
import 'package:store_app/wigets/widget_screen.dart';

import '../../themes/app_color.dart';
import '../../wigets/item_cart.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool _selectChoose = true;



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
                    onTap: () {
                      BlocProvider.of<CartsBloc>(context).add(ClearCartsEvent());
                    },
                  ),
                ];
              }),
          SizedBox(
            width: 15.w,
          ),
        ],
        leading: IconButton(
            onPressed: () {},
            icon:
            Icon(Icons.arrow_back_ios, color: const AppColors().purple)),
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
      body: BlocConsumer<CartsBloc, CurdState>(
        listenWhen: (previous, current) => current is ProcessState ,
        listener: (context, state) {

        },

        buildWhen: (previous, current) => current is ReadState<Cart> || current is LoadingState,
        builder: (context, state) {
          if(state is LoadingState){
            return const Center(child: CircularProgressIndicator(),);
          }
          else if (state is ReadState && state.data.isNotEmpty) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: state.data.length,
                    itemBuilder: (context, index) {
                      return ItemCart(
                        priceProduct:
                        "price: ${state.data[index].total}",
                        quantityProduct:
                        "Quantity : ${state.data[index].count}",
                        nameProduct: state.data[index].productName,
                        visible: true,
                        buttonMinus: () {
                          // CartsGetXController.to.changeQuantity(
                          //     index, state.data[index].count - 1);
                          BlocProvider.of<CartsBloc>(context).add(ChangeQuantityCartsEvent(index, state.data[index].count - 1));
                        },
                        buttonPlus: () {
                          setState(() {
                            // CartsGetXController.to.changeQuantity(
                            //     index, state.data[index].count + 1);
                            BlocProvider.of<CartsBloc>(context).add(ChangeQuantityCartsEvent(index, state.data[index].count + 1));

                          });
                        },
                        text: state.data[index].count.toString(),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40.h,
                        width: double.infinity,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        //${/*controller.quantityAll*/}
                        "Total Items: ${BlocProvider.of<CartsBloc>(context,listen: true).quantityAll} Items",
                        style: context.getGoogle(
                            fontSize: 16,
                            weight: FontWeight.bold,
                            color: const AppColors().blueOcc),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        //${/*controller.totalAll*/}
                        "Total Price: ${BlocProvider.of<CartsBloc>(context,listen: true).totalAll} ",
                        style: context.getGoogle(
                            fontSize: 16,
                            weight: FontWeight.bold,
                            color: const AppColors().blake2),
                      ),
                      SizedBox(
                        height: 40.h,
                        width: double.infinity,
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
                            "Proceed to Checkout",
                            style: context.getGoogle(
                                fontSize: 14,
                                weight: FontWeight.w600,
                                color: const AppColors().white),
                          )),
                      SizedBox(
                        height: 40.h,
                        width: double.infinity,
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return WidgetScreen(
                image: 'image_empty',
                title: 'Cart is Empty!',
                subTitle: 'Let’s find something special for you.',
                textButton: 'Start Shopping',
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, '/bottom_navigation_screen');
                });
          }
        },
      ),
      );

/*        body: GetX<CartsGetXController>(
          init: CartsGetXController(),
          global: true,
          builder: ( CartsGetXController controller) {
            if (controller.cartsItems.isNotEmpty) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: controller.cartsItems.length,
                      itemBuilder: (context, index) {
                        return ItemCart(
                          priceProduct:
                          "price: ${controller.cartsItems[index].total}",
                          quantityProduct:
                          "Quantity : ${controller.cartsItems[index].count}",
                          nameProduct: controller.cartsItems[index].productName,
                          visible: true,
                          buttonMinus: () {
                            CartsGetXController.to.changeQuantity(
                                index, controller.cartsItems[index].count - 1);
                          },
                          buttonPlus: () {
                            setState(() {
                              CartsGetXController.to.changeQuantity(
                                  index, controller.cartsItems[index].count + 1);
                            });
                          },
                          text: controller.cartsItems[index].count.toString(),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40.h,
                          width: double.infinity,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          "Total Items: ${controller.quantityAll} Items",
                          style: context.getGoogle(
                              fontSize: 16,
                              weight: FontWeight.bold,
                              color: const AppColors().blueOcc),
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          "Total Price: ${controller.totalAll}",
                          style: context.getGoogle(
                              fontSize: 16,
                              weight: FontWeight.bold,
                              color: const AppColors().blake2),
                        ),
                        SizedBox(
                          height: 40.h,
                          width: double.infinity,
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
                              "Proceed to Checkout",
                              style: context.getGoogle(
                                  fontSize: 14,
                                  weight: FontWeight.w600,
                                  color: const AppColors().white),
                            )),
                        SizedBox(
                          height: 40.h,
                          width: double.infinity,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return WidgetScreen(
                  image: 'image_empty',
                  title: 'Cart is Empty!',
                  subTitle: 'Let’s find something special for you.',
                  textButton: 'Start Shopping',
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, '/bottom_navigation_screen');
                  });
            }
          },
        ),*/
      // body: WidgetScreen(onPressed: (){},textButton: 'Start Shopping',title: 'Cart is Empty!',subTitle: 'Let’s find something special for you.', image: 'image_empty'),

    // );
  }
}
