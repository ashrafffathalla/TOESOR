
class SingleRouteModel {
  bool? success;
  String? message;
  Details? details;
  List<Lap>? lap;
  List<Sponsor>? sponsor;
  List<SponsorCategories>? sponsor_categories;


  SingleRouteModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    details =
    json['Details'] != null ?  Details.fromJson(json['Details']) : null;
    if (json['lap'] != null) {
      lap = List<Lap>.from(json["lap"].map((item) => Lap.fromJson(item)));
    }
    if (json['sponsor'] != null) {
      sponsor = List<Sponsor>.from(json["sponsor"].map((item) => Sponsor.fromJson(item)));
    }
    if (json['sponsor_categories'] != null) {
      sponsor_categories = List<SponsorCategories>.from(json["sponsor_categories"].map((item) => SponsorCategories.fromJson(item)));
    }
  }

}

class Details {
  int? routeID;
  String? roueName;
  String? descr;
  String? length;
  String? duration;
  String? routeLat;
  String? routeLng;

  Details(
      {this.routeID,
        this.roueName,
        this.descr,
        this.length,
        this.duration,
        this.routeLat,
        this.routeLng});

  Details.fromJson(Map<String, dynamic> json) {
    routeID = json['Route_ID'];
    roueName = json['Roue_Name'];
    descr = json['descr'];
    length = json['length'];
    duration = json['duration'];
    routeLat = json['Route_Lat'];
    routeLng = json['Route_Lng'];
  }

}

class Lap {
  int? iDTappeCaccia;
  String? routeID;
  String? tappaOrderNumber;
  String? nameTappa;
  String? descrTappa;
  String? tappaLat;
  String? tappaLng;


  Lap.fromJson(Map<String, dynamic> json) {
    iDTappeCaccia = json['ID_Tappe_Caccia'];
    routeID = json['Route_ID'];
    tappaOrderNumber = json['Tappa_OrderNumber'];
    nameTappa = json['name_Tappa'];
    descrTappa = json['descr_Tappa'];
    tappaLat = json['Tappa_Lat'];
    tappaLng = json['Tappa_Lng'];

    }
  }

class Sponsor {
  int? idSpoAssociato;
  String? sponsorID;
  String? cacciaID;
  int? idSponsor;
  String? name;
  String? descr;
  String? indirizzo;
  String? geoLat;
  String? geoLng;
  String? media;
  String? category;
  String? coupon;


  Sponsor.fromJson(Map<String, dynamic> json) {
    idSpoAssociato = json['id_spo_associato'];
    sponsorID = json['Sponsor_ID'];
    cacciaID = json['Caccia_ID'];
    idSponsor = json['id_sponsor'];
    name = json['name'];
    descr = json['descr'];
    indirizzo = json['Indirizzo'];
    geoLat = json['Geo_Lat'];
    geoLng = json['Geo_Lng'];
    media = json['media'];
    category = json['category'];
    coupon = json['Coupon'];
  }
}
  class SponsorCategories {
  int? idCatSponsors;
  String? categoryName;

  SponsorCategories.fromJson(Map<String, dynamic> json) {
  idCatSponsors = json['id_Cat_Sponsors'];
  categoryName = json['Category_Name'];

  }

}