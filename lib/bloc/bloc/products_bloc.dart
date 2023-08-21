import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/bloc/events/crud_event.dart';
import 'package:store_app/bloc/states/crud_state.dart';
import 'package:store_app/database/controllers/product_db_controller.dart';
import 'package:store_app/models/product.dart';

class ProductsBloc extends Bloc<CurdEvent, CurdState> {
  ProductsBloc(super.initialState) {
    on<CreateEvent<Product>>(_onCreateBloc);
    on<ReadEvent>(_onReadBloc);
    on<UpdateEvent<Product>>(_onUpdateBloc);
    on<DeleteEvent>(_onDeleteBloc);
    on<ShowEvent>(_onShowBloc);
  }

  List<Product> _product  = <Product>[];
  ProductDbController _DbController = ProductDbController();

  void _onCreateBloc(CreateEvent<Product> event, Emitter<CurdState> emit) async{
    int newRowId = await _DbController.create(event.model);
    if(newRowId !=0){
      event.model.id = newRowId;
      _product.add(event.model);
      emit(ReadState<Product>(_product));
    }
    emit(ProcessState(newRowId !=0 ? 'Operation completed' : 'Operation failed!', newRowId !=0, ProcessType.create));
  }

  void _onReadBloc(ReadEvent event, Emitter<CurdState> emit) async {
    emit(LoadingState());
    _product = await _DbController.read();
    emit(ReadState<Product>(_product));
  }

  void _onUpdateBloc(UpdateEvent<Product> event, Emitter<CurdState> emit) async{
    bool updated = await _DbController.update(event.model);
    if(updated){
      int index = _product.indexWhere((element) => element.id == event.model.id);
      if(index != -1){
        _product[index] = event.model;
        emit(ReadState<Product>(_product));
      }
    }
    emit(ProcessState(updated ? 'Operation completed' : 'Operation failed!', updated, ProcessType.update));
  }



  void _onDeleteBloc(DeleteEvent event, Emitter<CurdState> emit) async {
    bool deleted = await _DbController.delete(_product[event.index].id);
    if(deleted){
      _product.removeAt(event.index);
      emit(ReadState<Product>(_product));
    }
    emit(ProcessState(deleted ? 'Operation completed' : 'Operation failed!', deleted, ProcessType.delete));

  }

  void _onShowBloc(ShowEvent event, Emitter<CurdState> emit) async{
    Product? product  = await  _DbController.show(event.id);
    emit(ShowState<Product>(product));
  }
}
