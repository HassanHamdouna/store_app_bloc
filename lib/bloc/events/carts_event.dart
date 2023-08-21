import 'package:store_app/models/cart.dart';

class CartsEvent {

}

class CreateCartsEvent extends CartsEvent {
  final Cart cart ;

  CreateCartsEvent(this.cart);
}

class ReadCartsEvent extends CartsEvent {

}

class ChangeQuantityCartsEvent extends CartsEvent {
  final int index;
  final int count;

  ChangeQuantityCartsEvent(this.index, this.count);
}

class ClearCartsEvent extends CartsEvent{

}