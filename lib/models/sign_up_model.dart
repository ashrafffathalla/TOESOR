class SignUpModel {
  User? user;

  SignUpModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ?  User.fromJson(json['user']) : null;
  }

}

class User {
  String? name;
  String? lastname;
  int? role;
  String? email;
  String? status;

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    lastname = json['lastname'];
    role = json['role'];
    email = json['email'];
    status = json['status'];
  }

}