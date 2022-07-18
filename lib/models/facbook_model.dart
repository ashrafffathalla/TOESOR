class FaceBookModel {
  bool? success;
  String? token;

  FaceBookModel({this.success, this.token});
  
  FaceBookModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    token = json['token'];
  }

}