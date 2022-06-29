class LoginModel {
  User? user;
  String?code;
  String? token;
  LoginModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ?  User.fromJson(json['user']) : null;
    token = json['token'];
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