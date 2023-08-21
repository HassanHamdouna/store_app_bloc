class CurdEvent {}

class CreateEvent<T> extends CurdEvent {
  final T model;

  CreateEvent(this.model);
}

class DeleteEvent extends CurdEvent {
  final int index;

  DeleteEvent(this.index);
}

class ReadEvent extends CurdEvent {}

class ShowEvent extends CurdEvent {
  final int id;

  ShowEvent(this.id);
}

class UpdateEvent<T> extends CurdEvent {
  final T model;

  UpdateEvent(this.model);
}
