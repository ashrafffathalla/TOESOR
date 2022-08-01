class EditPasswordModel {
  String? message;
  int? statusCode;

  EditPasswordModel({this.message, this.statusCode});

  EditPasswordModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['status_code'];
  }

}