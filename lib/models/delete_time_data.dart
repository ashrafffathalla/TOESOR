class DeleteTimeModel {
  bool? success;
  String? message;
  int? codice;

  DeleteTimeModel({this.success, this.message, this.codice});

  DeleteTimeModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    codice = json['codice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['codice'] = this.codice;
    return data;
  }
}