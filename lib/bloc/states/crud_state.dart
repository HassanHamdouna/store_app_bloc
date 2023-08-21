enum ProcessType { create, update, delete }

class CurdState {}

class ProcessState extends CurdState {
  final String massage;
  final bool success;
  final ProcessType processType;

  ProcessState(this.massage, this.success, this.processType);
}

class ReadState<T> extends CurdState {
  final List<T> data;

  ReadState(this.data);
}

class ShowState<T> extends CurdState {
  T? model;

  ShowState(this.model);
}

class LoadingState extends CurdState{

}

