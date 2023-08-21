import 'package:get/get.dart';
import 'package:store_app/database/controllers/product_db_controller.dart';
import 'package:store_app/models/process_response.dart';
import 'package:store_app/models/product.dart';

class ProductsGetXController extends GetxController {
  List<Product> products = <Product>[];

  final ProductDbController _productDbController = ProductDbController();

  static ProductsGetXController get to => Get.find<ProductsGetXController>();


  @override
  void onInit() {
    read();
    super.onInit();
  }

  Future<ProcessResponse> create(Product product) async {
    int newRowId = await _productDbController.create(product);
    if (newRowId != 0) {
      product.id = newRowId;
      products.add(product);
      update();
    }
    return getResponse(newRowId != 0);
  }

  void read() async {
    products = await _productDbController.read();
    update();
  }

  Future<ProcessResponse> updateProduct(Product product) async {
    bool updated = await _productDbController.update(product);
    if (updated) {
      int index = products.indexWhere((element) => element.id == product.id);
      if (index != 0) {
        products[index] = product;
        update();
      }
    }
    return getResponse(updated);
  }

  Future<ProcessResponse> delete(int index) async {
    bool delete = await _productDbController.delete(products[index].id);
    if (delete) {
      products.removeAt(index);
      update();
    }
    return getResponse(delete);
  }

  ProcessResponse getResponse(bool success) {
    return ProcessResponse(
        massage:
            success ? 'Operation completed successfully' : 'Operation failed! ',
        success: success);
  }
}
