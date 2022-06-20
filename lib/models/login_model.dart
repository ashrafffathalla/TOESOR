class LoginModel {
  User? user;
  LoginModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ?  User.fromJson(json['user']) : null;
  }
}
class User {
  String? status;
  String? email;

  User.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    email = json['email'];

  }

}