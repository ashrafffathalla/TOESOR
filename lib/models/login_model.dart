class LoginModel {
  User? user;
  String?code;
  String? token;
  LoginModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ?  User.fromJson(json['user']) : null;
    token = json['token'];
    code = json['code'];
  }
}
class User {
  String? status;
  String? email;
  String? NickName;
  String? UserPic;

  User.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    email = json['email'];
    NickName = json['NickName'];
    UserPic = json['UserPic'];

  }

}