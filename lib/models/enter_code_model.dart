class EnterCodeModel {
  String? message;
  int? code;

  EnterCodeModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
  }
}