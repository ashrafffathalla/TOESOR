class ClasificaModel {
  bool? success;
  String? message;
  List<Classifica>? classifica;



  ClasificaModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['Classifica'] != null) {
      classifica = <Classifica>[];
      json['Classifica'].forEach((v) {
        classifica!.add( Classifica.fromJson(v));
      });
    }
  }


}

class Classifica {
  String? userId;
  String? userNickName;
  String? userPic;
  String? tempoClassifica;



  Classifica.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userNickName = json['UserNickName'];
    userPic = json['UserPic'];
    tempoClassifica = json['TempoClassifica'];
  }


}