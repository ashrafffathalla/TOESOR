class TimeScreenModel {
  bool? success;
  String? message;
  Details? details;
  Lap? lap;
  int? numeroTappaAttuale;



  TimeScreenModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    details = json['Details'] != null ?  Details.fromJson(json['Details']) : null;
    lap = json['lap'] != null ?  Lap.fromJson(json['lap']) : null;
    numeroTappaAttuale = json['NumeroTappaAttuale'];

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
