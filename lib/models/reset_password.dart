class ResetPasswordModel {
  String? message;
  ResetPasswordModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }


}