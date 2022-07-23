class GoogleModel {
  bool? success;
  String? token;

  GoogleModel({this.success, this.token});

  GoogleModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    token = json['token'];
  }

}