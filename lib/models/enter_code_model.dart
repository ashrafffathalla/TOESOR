class EnterCodeModel {
  String? message;
  dynamic code;

  EnterCodeModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
  }
}