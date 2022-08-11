// class TimeScreenModel {
//   bool? success;
//   String? message;
//   Details? details;
//   Lap? lap;
//   Sponsor? sponsor;
//   SponsorCategories? sponsorCategories;
//
//
//
//   TimeScreenModel.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     message = json['message'];
//     details = json['Details'] != null ?  Details.fromJson(json['Details']) : null;
//     lap = json['lap'] != null ?  Lap.fromJson(json['lap']) : null;
//     sponsor = json['sponsor'] != null ?  Sponsor.fromJson(json['sponsor']) : null;
//     sponsorCategories = json['sponsor_categories'] != null ?  SponsorCategories.fromJson(json['sponsor_categories']) : null;
//   }
//
//
// }
//
// class Details {
//   int? routeID;
//   String? roueName;
//   String? descr;
//   String? length;
//   String? duration;
//   String? routeAddress;
//   String? routeLat;
//   String? routeLng;
//   String? routeStatus;
//
//
//
//   Details.fromJson(Map<String, dynamic> json) {
//     routeID = json['Route_ID'];
//     roueName = json['Roue_Name'];
//     descr = json['descr'];
//     length = json['length'];
//     duration = json['duration'];
//     routeAddress = json['RouteAddress'];
//     routeLat = json['Route_Lat'];
//     routeLng = json['Route_Lng'];
//     routeStatus = json['Route_Status'];
//   }
//
//
// }
//
// class Lap {
//   int? iDTappeCaccia;
//   String? routeID;
//   String? tappaOrderNumber;
//   String? nameTappa;
//   String? descrTappa;
//   String? tappaLat;
//   String? tappaLng;
//   List<Quiz>? quiz;
//
//
//   Lap.fromJson(Map<String, dynamic> json) {
//     iDTappeCaccia = json['ID_Tappe_Caccia'];
//     routeID = json['Route_ID'];
//     tappaOrderNumber = json['Tappa_OrderNumber'];
//     nameTappa = json['name_Tappa'];
//     descrTappa = json['descr_Tappa'];
//     tappaLat = json['Tappa_Lat'];
//     tappaLng = json['Tappa_Lng'];
//     if (json['quiz'] != null) {
//       quiz = <Quiz>[];
//       json['quiz'].forEach((v) {
//         quiz!.add( Quiz.fromJson(v));
//       });
//     }
//   }
//
// }
//
// class Quiz {
//   int? idQuiz;
//   String? iDTappa;
//   String? placeName;
//   String? question;
//   String? answer;
//   List<QuizMedia>? quizMedia;
//   List<QuizTips>? quizTips;
//
//
//   Quiz.fromJson(Map<String, dynamic> json) {
//     idQuiz = json['id_quiz'];
//     iDTappa = json['ID_Tappa'];
//     placeName = json['Place_Name'];
//     question = json['Question'];
//     answer = json['answer'];
//     if (json['quiz_media'] != null) {
//       quizMedia = <QuizMedia>[];
//       json['quiz_media'].forEach((v) {
//         quizMedia!.add( QuizMedia.fromJson(v));
//       });
//     }
//     if (json['quiz_tips'] != null) {
//       quizTips = <QuizTips>[];
//       json['quiz_tips'].forEach((v) {
//         quizTips!.add( QuizTips.fromJson(v));
//       });
//     }
//   }
//
//
// }
//
// class QuizMedia {
//   int? idMedia;
//   String? iDQuiz;
//   String? path;
//
//
//   QuizMedia.fromJson(Map<String, dynamic> json) {
//     idMedia = json['id_Media'];
//     iDQuiz = json['ID_Quiz'];
//     path = json['path'];
//   }
//
//
// }
//
// class QuizTips {
//   int? idTip;
//   String? iDQuiz;
//   String? tipTitle;
//
//
//   QuizTips.fromJson(Map<String, dynamic> json) {
//     idTip = json['id_Tip'];
//     iDQuiz = json['ID_Quiz'];
//     tipTitle = json['Tip_Title'];
//   }
//
// }
//
// class Sponsor {
//   int? idSpoAssociato;
//   String? sponsorID;
//   String? cacciaID;
//   int? idSponsor;
//   String? name;
//   String? descr;
//   String? indirizzo;
//   String? geoLat;
//   String? geoLng;
//   String? media;
//   String? category;
//   String? coupon;
//
//
//   Sponsor.fromJson(Map<String, dynamic> json) {
//     idSpoAssociato = json['id_spo_associato'];
//     sponsorID = json['Sponsor_ID'];
//     cacciaID = json['Caccia_ID'];
//     idSponsor = json['id_sponsor'];
//     name = json['name'];
//     descr = json['descr'];
//     indirizzo = json['Indirizzo'];
//     geoLat = json['Geo_Lat'];
//     geoLng = json['Geo_Lng'];
//     media = json['media'];
//     category = json['category'];
//     coupon = json['Coupon'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id_spo_associato'] = this.idSpoAssociato;
//     data['Sponsor_ID'] = this.sponsorID;
//     data['Caccia_ID'] = this.cacciaID;
//     data['id_sponsor'] = this.idSponsor;
//     data['name'] = this.name;
//     data['descr'] = this.descr;
//     data['Indirizzo'] = this.indirizzo;
//     data['Geo_Lat'] = this.geoLat;
//     data['Geo_Lng'] = this.geoLng;
//     data['media'] = this.media;
//     data['category'] = this.category;
//     data['Coupon'] = this.coupon;
//     return data;
//   }
// }
//
// class SponsorCategories {
//   int? idCatSponsors;
//   String? categoryName;
//   String? createdAt;
//   String? updatedAt;
//
//
//
//   SponsorCategories.fromJson(Map<String, dynamic> json) {
//     idCatSponsors = json['id_Cat_Sponsors'];
//     categoryName = json['Category_Name'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
// }

class TimeScreenModel {
  bool? success;
  String? message;
  Details? details;
  Lap? lap;



  TimeScreenModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    details = json['Details'] != null ?  Details.fromJson(json['Details']) : null;
    lap = json['lap'] != null ?  Lap.fromJson(json['lap']) : null;

  }
}

class Details {
  int? routeID;
  String? roueName;
  String? descr;
  String? length;
  String? duration;
  String? routeAddress;
  String? routeLat;
  String? routeLng;
  String? routeStatus;



  Details.fromJson(Map<String, dynamic> json) {
    routeID = json['Route_ID'];
    roueName = json['Roue_Name'];
    descr = json['descr'];
    length = json['length'];
    duration = json['duration'];
    routeAddress = json['RouteAddress'];
    routeLat = json['Route_Lat'];
    routeLng = json['Route_Lng'];
    routeStatus = json['Route_Status'];
  }

}

class Lap {
  int? iDTappeCaccia;
  String? routeID;
  String? nextTapID;
  String? nameTappa;
  String? descrTappa;
  String? tappaLat;
  String? tappaLng;
  List<Quiz>? quiz;

  Lap.fromJson(Map<String, dynamic> json) {
    iDTappeCaccia = json['ID_Tappe_Caccia'];
    routeID = json['Route_ID'];
    nextTapID = json['Next_Tap_ID'];
    nameTappa = json['name_Tappa'];
    descrTappa = json['descr_Tappa'];
    tappaLat = json['Tappa_Lat'];
    tappaLng = json['Tappa_Lng'];
    if (json['quiz'] != null) {
      quiz = <Quiz>[];
      json['quiz'].forEach((v) {
        quiz!.add( Quiz.fromJson(v));
      });
    }
  }
}

class Quiz {
  int? idQuiz;
  String? iDTappa;
  String? placeName;
  String? media;
  String? question;
  String? answer;
  List<QuizTips>? quizTips;

  Quiz.fromJson(Map<String, dynamic> json) {
    idQuiz = json['id_quiz'];
    iDTappa = json['ID_Tappa'];
    placeName = json['Place_Name'];
    media = json['media'];
    question = json['Question'];
    answer = json['answer'];
    if (json['quiz_tips'] != null) {
      quizTips = <QuizTips>[];
      json['quiz_tips'].forEach((v) {
        quizTips!.add( QuizTips.fromJson(v));
      });
    }
  }
}

class QuizTips {
  int? idTip;
  String? iDQuiz;
  String? tipTitle;

  QuizTips.fromJson(Map<String, dynamic> json) {
    idTip = json['id_Tip'];
    iDQuiz = json['ID_Quiz'];
    tipTitle = json['Tip_Title'];
  }
}
