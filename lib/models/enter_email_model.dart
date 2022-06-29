class EnterEmailModel {
  String? message;
  int? code;

  EnterEmailModel({this.message, this.code});

  EnterEmailModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
  }

}