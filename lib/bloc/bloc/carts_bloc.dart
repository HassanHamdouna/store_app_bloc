import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/bloc/events/carts_event.dart';
import 'package:store_app/bloc/states/crud_state.dart';
import 'package:store_app/database/controllers/cart_db_controller.dart';

import '../../models/cart.dart';

class CartsBloc extends Bloc<CartsEvent, CurdState> {
  CartsBloc(super.initialState) {
    on<CreateCartsEvent>(_onCreateBloc);
    on<ReadCartsEvent>(_onReadBloc);
    on<ChangeQuantityCartsEvent>(_onChangeQuantityBloc);
    on<ClearCartsEvent>(_onClearBloc);
  }

  List<Cart> _cartsItems = <Cart>[];
  final CartDbController _dbController = CartDbController();
  double _totalAll = 0;

  double _quantityAll = 0;

  void _onCreateBloc(CreateCartsEvent event, Emitter emit) async {
    int index = _cartsItems
        .indexWhere((element) => element.productId == event.cart.productId);

    /// check is product new in cart or NO
    if (index == -1) {
      /// new Item in cart
      int newRowId = await _dbController.create(event.cart);
      if (newRowId != 0) {
        _totalAll += event.cart.total;
        _quantityAll += 1;
        event.cart.id = newRowId;
        _cartsItems.add(event.cart);
        emit(ReadState<Cart>(_cartsItems));
      }
      emit(ProcessState(
          newRowId != 0 ? 'Operation completed' : 'Operation failed!',
          newRowId != 0,
          ProcessType.create));
    } else {
      /// product Item in Update in cart
      int newCount = _cartsItems[index].count + 1;
      bool updated=  await _changeQuantity(index, newCount);
      emit(ProcessState(
          updated ? 'Operation completed' : 'Operation failed!',
          updated,
          ProcessType.update));
    }

    emit(ReadState<Cart>(_cartsItems));

  }

  void _onReadBloc(ReadCartsEvent event, Emitter emit) async {
    _cartsItems = await _dbController.read();
    emit(ReadState<Cart>(_cartsItems));

  }

  void _onChangeQuantityBloc(ChangeQuantityCartsEvent event, Emitter emit) async {

    bool updated=  await _changeQuantity(event.index, event.count);
    emit(ProcessState(
        updated ? 'Operation completed' : 'Operation failed!',
        updated,
        ProcessType.update));
    emit(ReadState(_cartsItems));
  }

  void _onClearBloc(ClearCartsEvent event, Emitter emit) async {
    bool cleared = await _dbController.clear();
    if (cleared) {
      _totalAll = 0;
      _quantityAll = 0;
      _cartsItems.clear();
      emit(ReadState<Cart>(_cartsItems));
    }
    emit(ProcessState(
        cleared ? 'Operation completed' : 'Operation failed!',
        cleared,
        ProcessType.delete));
  }



  Future<bool> _changeQuantity(int index, int count) async {
    bool isDelete = count == 0;
    Cart cart = _cartsItems[index];
    bool result = isDelete
        ? await _dbController.delete(cart.id)
        : await _dbController.update(cart);

    if (result) {
      if (isDelete) {
        _totalAll -= cart.total;
        _quantityAll -= 1;
        _cartsItems.removeAt(index);
      } else {
        if (cart.count > count) {
          cart.count = count;
          cart.total = cart.price * cart.count;
          _totalAll -= cart.price;
          _quantityAll -= 1;
        } else {
          cart.count = count;
          cart.total = cart.price * cart.count;
          _totalAll += cart.price;
          _quantityAll += 1;
        }

        _cartsItems[index] = cart;
      }
    }

    return result;
  }

  String get totalAll => _totalAll.toString();
  String get quantityAll => _quantityAll.toString();
}
