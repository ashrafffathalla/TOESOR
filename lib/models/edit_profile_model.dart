class EditProfileModel {
  String? message;
  int? codice;

  EditProfileModel({this.message, this.codice});

  EditProfileModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    codice = json['codice'];
  }


}