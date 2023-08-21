class User {
  late int id;
  late int phone;
  late String email;
  late String password;

  User();
  static const String tableName ='users';

  User.formMap(Map<String,dynamic> rowMap) {
    id = rowMap['id'];
    phone = rowMap['phone'];
    email = rowMap['email'];
    password = rowMap['password'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['phone'] = phone;
    map['email'] = email;
    map['password'] = password;
    return map;
  }
}
