class SponsorCategoryModel {
  bool? success;
  String? message;
  List<Data>? data;
  int? numeroTappaAttuale;

  SponsorCategoryModel({this.success, this.message, this.data});

  SponsorCategoryModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add( Data.fromJson(v));
      });
    }
    numeroTappaAttuale = json['NumeroTappaAttuale'];
  }


}

class Data {
  int? idCatSponsors;
  String? categoryName;
  String? createdAt;
  String? updatedAt;


  Data.fromJson(Map<String, dynamic> json) {
    idCatSponsors = json['id_Cat_Sponsors'];
    categoryName = json['Category_Name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }


}