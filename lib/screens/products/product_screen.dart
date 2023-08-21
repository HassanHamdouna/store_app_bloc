
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:store_app/bloc/bloc/products_bloc.dart';
import 'package:store_app/bloc/events/crud_event.dart';
import 'package:store_app/bloc/states/crud_state.dart';
import 'package:store_app/models/process_response.dart';
import 'package:store_app/models/product.dart';
import 'package:store_app/preferences/shared_pref_controller.dart';
import 'package:store_app/provider/products_provider.dart';
import 'package:store_app/utils/context_extenssion.dart';

import '../../get/products_getx_controller.dart';
import '../../wigets/app_text_field.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key, this.product}) : super(key: key);

  final Product? product;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late TextEditingController _nameTextController;
  late TextEditingController _infoTextController;
  late TextEditingController _priceTextController;
  late TextEditingController _quantityTextController;

  @override
  void initState() {
    super.initState();
    _nameTextController = TextEditingController(text: widget.product?.name);
    _infoTextController = TextEditingController(text: widget.product?.info);
    _priceTextController = TextEditingController(text: widget.product?.price.toString());
    _quantityTextController = TextEditingController(text: widget.product?.quantity.toString());
  }

  @override
  void dispose() {
    _nameTextController.dispose();
    _infoTextController.dispose();
    _priceTextController.dispose();
    _quantityTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: BlocListener<ProductsBloc, CurdState>(
        listenWhen: (previous, current) => current is ProcessState &&( current.processType == ProcessType.create || current.processType == ProcessType.update),
        listener: (context, state) {
          state as ProcessState;
          if(state.success){
            isUpdateProduct ? Navigator.pop(context): clear();
          }
          context.showSnackBar(massage: state.massage,error: !state.success);
        },
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
          children: [
            Text(
              isUpdateProduct ?'Update product' :'create product',
              style: GoogleFonts.cairo(
                fontSize: 22.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.h),
            AppTextField(
              enabledBorderColor: Colors.black,
              focusedBorderColor: Colors.black,
              suffixIcon: null,
              onChange: (){},
              title: 'name',
              prefixIcon: Icon(Icons.title),
              keyboardType: TextInputType.text,
              controller: _nameTextController,
            ),
            SizedBox(height: 10.h),
            AppTextField(
              enabledBorderColor: Colors.black,
              focusedBorderColor: Colors.black,
              suffixIcon: null,
              onChange: (){},
              title: 'info',
              prefixIcon: Icon(Icons.info),
              keyboardType: TextInputType.text,
              controller: _infoTextController,
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Expanded(
                  child: AppTextField(
                    title: 'price',
                    suffixIcon: null,
                    onChange: (){},
                    enabledBorderColor: Colors.black,
                    focusedBorderColor: Colors.black,
                    prefixIcon: Icon(Icons.monetization_on_outlined),
                    keyboardType: const TextInputType.numberWithOptions(
                        signed: false, decimal: true),
                    controller: _priceTextController,
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: AppTextField(
                    enabledBorderColor: Colors.black,
                    focusedBorderColor: Colors.black,
                    suffixIcon: null,
                    onChange: (){},
                    title: 'quantity',
                    prefixIcon: Icon(Icons.numbers),
                    keyboardType: const TextInputType.numberWithOptions(
                        signed: false, decimal: false),
                    controller: _quantityTextController,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            ElevatedButton(
              onPressed: ()=>_performSave(),
              child: Text('save'),
            )
          ],
        ),
      )
    );
  }

  bool get isUpdateProduct => widget.product != null;


  void _performSave() {
    if (_checkData()) {
      _save();
    }
  }

  bool _checkData() {
    if (_nameTextController.text.isNotEmpty &&
        _infoTextController.text.isNotEmpty &&
        _priceTextController.text.isNotEmpty &&
        _quantityTextController.text.isNotEmpty) {
      return true;
    }
    context.showSnackBar(
      massage: 'error_data', error: true,);
    return false;
  }

  void _save()  {
    //TODO: Call Database save function from ProductProvider as (Intermediate) Layer between UI & Controllers
       isUpdateProduct
    ?  BlocProvider.of<ProductsBloc>(context).add(UpdateEvent(product))
    :  BlocProvider.of<ProductsBloc>(context).add(CreateEvent(product));



  }

  Product get product {
    Product product = isUpdateProduct ? widget.product! :Product();
    product.name = _nameTextController.text;
    product.info = _infoTextController.text;
    product.price = double.parse(_priceTextController.text);
    product.quantity = int.parse(_quantityTextController.text);
    // print(SharedPrefController().getValueKey<int>(PrefKey.id.name));
    product.userId = SharedPrefController().getValueKey<int>(PrefKey.id.name)??1;
    return product;
  }
  void clear(){
    _nameTextController.clear();
    _infoTextController.clear();
    _priceTextController.clear();
    _quantityTextController.clear();
  }

}
