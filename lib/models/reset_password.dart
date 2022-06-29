class ResetPasswordModel {
  String? message;
  int? code;
  ResetPasswordModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
  }


}