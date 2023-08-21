import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:store_app/database/controllers/cart_db_controller.dart';
import 'package:store_app/models/cart.dart';
import 'package:store_app/models/process_response.dart';

class CartsGetXController extends GetxController {
  RxList<Cart> cartsItems = <Cart>[].obs;
  RxBool loading = false.obs;

  final CartDbController _cartDbController = CartDbController();

  static CartsGetXController get to => Get.find<CartsGetXController>();

  @override
  void onInit() {
    read();
    super.onInit();
  }

  double totalAll = 0;
  double quantityAll = 0;

  Future<ProcessResponse> create(Cart cart) async {
    int index =
        cartsItems.indexWhere((element) => element.productId == cart.productId);

    /// check is product new in cart or NO
    print('possis index $index');
    if (index == -1) {
      /// new Item in cart
      int newRowId = await _cartDbController.create(cart);
      if (newRowId != 0) {
        totalAll += cart.total;
        quantityAll += 1;
        cart.id = newRowId;
        cartsItems.add(cart);
      }
      return getResponse(newRowId != 0);
    } else {
      /// product Item in Update in cart
      int newCount = cartsItems[index].count + 1;
      return changeQuantity(index, newCount);
    }
  }

  // void read() async {
  //   cartsItems = await _cartDbController.read();
  //   for (Cart cart in cartsItems) {
  //     totalAll += cart.total;
  //     quantityAll += cart.count;
  //   }
  //   notifyListeners();
  // }

  void read() async {
    loading.value = true;
    cartsItems.value = await _cartDbController.read();
    for (Cart cart in cartsItems) {
      int newCountRead = cart.count += 0;
      cart.total = cart.price * newCountRead;

      // totalAll = cart.total;
      // quantityAll += 1;
    }
    loading.value = false;
  }

  ///   function (1) Delete AND (2) Update .
  Future<ProcessResponse> changeQuantity(int index, int count) async {
    bool isDelete = count == 0;
    Cart cart = cartsItems[index];
    bool result = isDelete
        ? await _cartDbController.delete(cart.id)
        : await _cartDbController.update(cart);

    if (result) {
      if (isDelete) {
        totalAll -= cart.total;
        quantityAll -= 1;
        cartsItems.removeAt(index);
      } else {
        if (cart.count > count) {
          cart.count = count;
          cart.total = cart.price * cart.count;
          totalAll -= cart.price;
          quantityAll -= 1;
        } else {
          cart.count = count;
          cart.total = cart.price * cart.count;
          totalAll += cart.price;
          quantityAll += 1;
        }

        cartsItems[index] = cart;
      }
    }

    return getResponse(result);
  }

  Future<ProcessResponse> clear() async {
    bool cleared = await _cartDbController.clear();
    if (cleared) {
      totalAll = 0;
      quantityAll = 0;
      cartsItems.clear();
    }
    return getResponse(cleared);
  }

  ProcessResponse getResponse(bool success) {
    return ProcessResponse(
        massage:
            success ? 'Operation completed successfully' : 'Operation failed! ',
        success: success);
  }
}
