class PostTimeModel {
  String? message;
  int? codice;

  PostTimeModel({this.message, this.codice});

  PostTimeModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    codice = json['codice'];
  }


}