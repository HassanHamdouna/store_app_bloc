import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:store_app/database/controllers/product_db_controller.dart';
import 'package:store_app/models/process_response.dart';
import 'package:store_app/models/product.dart';

class ProductsProvider extends ChangeNotifier{

  List<Product> products = <Product>[];

  final ProductDbController _productDbController = ProductDbController();

  Future<ProcessResponse> create(Product product) async{
   int  newRowId = await _productDbController.create(product);
   if(newRowId !=0){
     product.id = newRowId;
     products.add(product);
     notifyListeners();
   }
   return getResponse(newRowId!=0);
  }

  void read() async{
    products = await _productDbController.read();
    notifyListeners();
  }

  Future<ProcessResponse> update(Product product) async{
    bool update = await _productDbController.update(product);
    if(update){
      int index = products.indexWhere((element) => element.id == product.id);
      if(index !=0){
        products[index] = product;
        notifyListeners();
      }
    }
    return getResponse(update);
  }

  Future<ProcessResponse> delete(int index) async{
    bool delete =  await _productDbController.delete(products[index].id);
    if(delete){
      products.removeAt(index);
      notifyListeners();
    }
    return getResponse(delete);
  }

  ProcessResponse getResponse(bool success){
    return ProcessResponse(massage: success ? 'Operation completed successfully':'Operation failed! '
        ,success: success);
  }

}