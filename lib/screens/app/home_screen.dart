import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/bloc/bloc/carts_bloc.dart';
import 'package:store_app/bloc/bloc/products_bloc.dart';
import 'package:store_app/bloc/events/carts_event.dart';
import 'package:store_app/bloc/events/crud_event.dart';
import 'package:store_app/bloc/states/crud_state.dart';
import 'package:store_app/models/cart.dart';
import 'package:store_app/models/product.dart';
import 'package:store_app/preferences/shared_pref_controller.dart';
import 'package:store_app/screens/products/product_screen.dart';
import 'package:store_app/utils/context_extenssion.dart';
import '../../themes/app_color.dart';
import '../../wigets/item_product.dart';
import '../../wigets/section_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    BlocProvider.of<ProductsBloc>(context).add(ReadEvent());
    BlocProvider.of<CartsBloc>(context).add(ReadCartsEvent());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const AppColors().backgroundApp2,

        leadingWidth: 100,
        actions: [
          Icon(Icons.search, size: 30, color: const AppColors().purple),
          SizedBox(
            width: 15.w,
          ),
        ],
        // leading: IconButton(
        //     onPressed: () {},
        //     icon: Icon(Icons.arrow_back_ios, color: const AppColors().purple)),
        titleSpacing: 30,
        centerTitle: false,
        title: Text(
          "Select from categories",
          style: context.getGoogle(
              fontSize: 18,
              weight: FontWeight.bold,
              color: const AppColors().blake2),
        ),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              SizedBox(
                height: 20.h,
              ),
              TabBar(
                padding: EdgeInsets.zero,
                labelPadding: EdgeInsets.symmetric(horizontal: 10.w),
                controller: _tabController,
                indicatorColor: Colors.transparent,
                unselectedLabelColor: const AppColors().purple,
                isScrollable: false,
                labelColor: const AppColors().purple,
                labelStyle: context.getGoogle(
                    fontSize: 12,
                    weight: FontWeight.w500,
                    color: const AppColors().purple),
                unselectedLabelStyle: context.getGoogle(
                    fontSize: 12,
                    weight: FontWeight.w500,
                    color: const AppColors().purple),
                tabs: [
                  Container(
                      width: double.infinity,
                      decoration: CustomTabInactive(),
                      child: const Tab(
                        child: Text('Watches'),
                      )),
                  Container(
                      width: double.infinity,
                      decoration: CustomTabInactive(),
                      child: const Tab(
                        child: Text('Bracelets'),
                      )),
                  Container(
                      width: double.infinity,
                      decoration: CustomTabInactive(),
                      child: const Tab(
                        child: Text('Straps'),
                      )),
                  Container(
                      width: double.infinity,
                      decoration: CustomTabInactive(),
                      child: const Tab(
                        child: Text('Set'),
                      )),

                  // Tab(child: Text('Watches'),),
                  //     Tab(child: Text('Bracelets'),),
                  //     Tab(child: Text('Straps'),),
                  //     Tab(child: Text('Set'),),
                  // Tab(child: Text('Bracelets'),),
                  // Tab(child: Text('Straps'),),
                ],
              ),
              SectionHome(title: 'Most Selling', onPressed: () {}),
              SizedBox(
                height: 20.h,
              ),
              // ItemProduct(),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 250,
                ),
                child: BlocConsumer<ProductsBloc, CurdState>(
                  listenWhen: (previous, current) =>
                      current is ProcessState &&
                      (current.processType == ProcessType.delete),
                  listener: (context, state) {
                    state as ProcessState;
                    context.showSnackBar(
                        massage: state.massage, error: !state.success);
                  },
                  buildWhen: (previous, current) =>
                      current is ReadState || current is LoadingState,
                  builder: (context, state) {
                    if (state is LoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is ReadState) {
                      return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1, mainAxisExtent: 200),
                          itemCount: state.data.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return ItemProduct(
                              onPressedAddCart: () {
                                // CartsGetXController.to.create(getCart(state.data[index]));
                                BlocProvider.of<CartsBloc>(context).add(CreateCartsEvent(getCart(state.data[index])));
                              },
                              onTab: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductScreen(
                                          product: state.data[index]),
                                    ));
                              },
                              onPressedDelete: () =>
                                  BlocProvider.of<ProductsBloc>(context)
                                      .add(DeleteEvent(index)),
                              nameProduct: state.data[index].name,
                              infoProduct: state.data[index].info,
                              priceProduct: state.data[index].price.toString(),
                              qurProduct: state.data[index].quantity.toString(),
                            );
                          });
                    } else {
                      return const Center(
                        child: Text('No Data'),
                      );
                    }
                  },
                ),
                // child: BlocListener<ProductsBloc,CurdState>(
                //   listenWhen: (previous, current) => current is ProcessState && (current.processType == ProcessType.delete),
                //   listener: (context, state) {
                //     state as ProcessState;
                //     context.showSnackBar(massage: state.massage,error: !state.success);
                //   },
                //   child: BlocBuilder<ProductsBloc, CurdState>(
                //     buildWhen: (previous, current) =>  current is ReadState || current is LoadingState   ,
                //     builder: (context, state) {
                //       if(state is LoadingState){
                //         return const Center(child: CircularProgressIndicator(),);
                //       }
                //       else if(state is ReadState){
                //         return GridView.builder(
                //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //                 crossAxisCount: 1,mainAxisExtent: 200),
                //             itemCount: state.data.length,
                //             scrollDirection: Axis.horizontal,
                //             itemBuilder: (context, index) {
                //               return  ItemProduct(
                //                 onPressedAddCart: (){
                //                   // CartsGetXController.to.create(getCart(state.data[index]));
                //                 },
                //                 onTab: (){
                //                   Navigator.push(context, MaterialPageRoute(builder:(context) => ProductScreen(product: state.data[index]),));
                //                 },
                //                 onPressedDelete: ()=>BlocProvider.of<ProductsBloc>(context).add(DeleteEvent(index)),
                //                 nameProduct: state.data[index].name,
                //                 infoProduct:  state.data[index].info,
                //                 priceProduct:  state.data[index].price.toString(),
                //                 qurProduct:  state.data[index].quantity.toString(),);
                //             });
                //       }
                //       else{
                //         return const Center(child: Text('No Data'),);
                //       }
                //     },
                //
                //   ),
                // ),
              ),
              SectionHome(title: 'Recent Added', onPressed: () {}),
              // ConstrainedBox(
              //   constraints: const BoxConstraints(
              //     maxHeight: 250,
              //   ),
              //   child: GridView.builder(
              //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //           crossAxisCount: 1,mainAxisExtent: 200),
              //       itemCount: 4,
              //       scrollDirection: Axis.horizontal,
              //       itemBuilder: (context, index) {
              //         return const ItemProduct();
              //       }),
              // ),
            ],
          ),
          Positioned(
            bottom: 30,
            right: 30,
            child: FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/product_screen');
                },
                child: const Icon(Icons.add)),
          ),
        ],
      ),
    );
  }

  Cart getCart(Product product) {
    Cart cart = Cart();
    cart.productId = product.id;
    cart.price = product.price;
    cart.total = product.price;
    cart.userId = SharedPrefController().getValueKey<int>(PrefKey.id.name) ?? 1;
    cart.count = 1;
    cart.productName = product.name;
    return cart;
  }

  BoxDecoration CustomTabInactive() {
    return BoxDecoration(
      border: Border.all(color: const AppColors().gray2),
      borderRadius: BorderRadius.circular(10),
      color: const AppColors().grayOcc,
    );
  }
}
