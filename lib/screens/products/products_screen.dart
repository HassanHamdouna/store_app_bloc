// import 'package:elancer2_database_app/models/cart.dart';
// import 'package:elancer2_database_app/models/process_response.dart';
// import 'package:elancer2_database_app/models/product.dart';
// import 'package:elancer2_database_app/prefs/shared_pref_controller.dart';
// import 'package:elancer2_database_app/provider/cart_provider.dart';
// import 'package:elancer2_database_app/provider/products_getx_controller.dart';
// import 'package:elancer2_database_app/screen/app/products/product_screen.dart';
// import 'package:elancer2_database_app/utils/context_extenssion.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:provider/provider.dart';
//
// class ProductsScreen extends StatefulWidget {
//   const ProductsScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ProductsScreen> createState() => _ProductsScreenState();
// }
//
// class _ProductsScreenState extends State<ProductsScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Provider.of<CartProvider>(context, listen: false).read();
//     Provider.of<ProductsProvider>(context, listen: false).read();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(context.localizations.products),
//         actions: [
//           IconButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => ProductScreen(),
//                 ),
//               );
//             },
//             icon: Icon(Icons.add),
//           ),
//           IconButton(
//             onPressed: () {
//               _confirmLogoutDialog();
//             },
//             icon: const Icon(Icons.logout),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: (){
//           Navigator.pushNamed(context, '/cart_screen');
//         },
//         child: Icon(Icons.shopping_cart),
//       ),
//       body: Consumer<ProductsProvider>(
//         builder: (context, ProductsProvider value, child) {
//           if (value.products.isNotEmpty) {
//             return ListView.builder(
//               itemCount: value.products.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   leading: Icon(Icons.shop),
//                   title: Text(value.products[index].name),
//                   subtitle: Text(value.products[index].info),
//                   trailing: Column(
//                     children: [
//                       Expanded(
//                         child: IconButton(
//                           onPressed: () => _deleteProduct(index),
//                           padding: EdgeInsets.zero,
//                           iconSize: 18,
//                           visualDensity: const VisualDensity(
//                             vertical: VisualDensity.minimumDensity,
//                             horizontal: VisualDensity.minimumDensity,
//                           ),
//                           icon: Icon(Icons.delete),
//                         ),
//                       ),
//                       Expanded(
//                         child: IconButton(
//                           onPressed: () {
//                             Provider.of<CartProvider>(context,listen: false)
//                                 .create(getCart(value.products[index]));
//                           },
//                           padding: EdgeInsets.zero,
//                           iconSize: 18,
//                           visualDensity: const VisualDensity(
//                             vertical: VisualDensity.minimumDensity,
//                             horizontal: VisualDensity.minimumDensity,
//                           ),
//                           icon: Icon(Icons.shopping_cart_checkout_sharp),
//                         ),
//                       ),
//                     ],
//                   ),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => ProductScreen(
//                           product: value.products[index],
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//             );
//           } else {
//             return Center(
//               child: Text(
//                 'NO DATA',
//                 style: GoogleFonts.cairo(
//                   fontSize: 24,
//                   color: Colors.black45,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
//
//   Cart getCart(Product product) {
//     Cart cart = Cart();
//     cart.productId = product.id;
//     cart.price = product.price;
//     cart.total = product.price;
//     cart.userId = SharedPrefController().getValueFor<int>(PrefKeys.id.name)!;
//     cart.count = 1;
//     cart.productName = product.name;
//     return cart;
//   }
//
//   void _confirmLogoutDialog() async {
//     bool? result = await showDialog<bool>(
//       context: context,
//       // barrierColor: Colors.red.shade100.withOpacity(0.5),
//       barrierDismissible: false,
//       builder: (context) {
//         return AlertDialog(
//           title: Text(
//             AppLocalizations.of(context)!.confirm_logout_title,
//           ),
//           titleTextStyle: GoogleFonts.cairo(
//             fontSize: 16,
//             color: Colors.black,
//           ),
//           content: Text(
//             AppLocalizations.of(context)!.confirm_logout_content,
//           ),
//           contentTextStyle: GoogleFonts.cairo(
//             fontSize: 13,
//             color: Colors.black45,
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context, true);
//               },
//               child: Text(
//                 AppLocalizations.of(context)!.confirm,
//                 style: GoogleFonts.cairo(color: Colors.red),
//               ),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context, false);
//               },
//               child: Text(
//                 AppLocalizations.of(context)!.cancel,
//                 style: GoogleFonts.cairo(),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//     if (result ?? false) {
//       // bool cleared = await SharedPrefController().removeValueFor(PrefKeys.loggedIn.name);
//       bool cleared = await SharedPrefController().clear();
//       if (cleared) {
//         Navigator.pushReplacementNamed(context, '/login_screen');
//       }
//     }
//   }
//
//   void _deleteProduct(int index) async {
//     ProcessResponse processResponse =
//         await Provider.of<ProductsProvider>(context, listen: false)
//             .delete(index);
//     context.showSnackBar(
//       message: processResponse.message,
//       error: !processResponse.success,
//     );
//   }
// }
