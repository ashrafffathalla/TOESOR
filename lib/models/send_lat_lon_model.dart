class LatLonModel {
  String? message;
  int? codice;

  LatLonModel({this.message, this.codice});

  LatLonModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    codice = json['codice'];
  }

}