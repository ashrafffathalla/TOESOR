
class ClasificaModel {
  bool? success;
  String? message;
  List<Classifica>? classifica;
  List<BestPlayer>? bestPlayer;
  List<TuoTempoTuoLivello>? tuoTempoTuoLivello;
  int? totaleClassifica;



  ClasificaModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['Classifica'] != null) {
      classifica = <Classifica>[];
      json['Classifica'].forEach((v) {
        classifica!.add( Classifica.fromJson(v));
      });
    }
    if (json['Best_Player'] != null) {
      bestPlayer = <BestPlayer>[];
      json['Best_Player'].forEach((v) {
        bestPlayer!.add( BestPlayer.fromJson(v));
      });
    }
    if (json['TuoTempo_TuoLivello'] != null) {
      tuoTempoTuoLivello = <TuoTempoTuoLivello>[];
      json['TuoTempo_TuoLivello'].forEach((v) {
        tuoTempoTuoLivello!.add( TuoTempoTuoLivello.fromJson(v));
      });
    }
    /*
    tuoTempoTuoLivello = json['TuoTempo_TuoLivello'] != null ?  TuoTempoTuoLivello.fromJson(json['TuoTempo_TuoLivello']) : null;
    */
    totaleClassifica = json['TotaleClassifica'];
  }


}

class Classifica {
  int? userLevel;
  String? userId;
  String? userNickName;
  String? userPic;
  String? tempoClassifica;



  Classifica.fromJson(Map<String, dynamic> json) {
    userLevel = json['user_level'];
    userId = json['userId'];
    userNickName = json['UserNickName'];
    userPic = json['UserPic'];
    tempoClassifica = json['TempoClassifica'];
  }


}

class BestPlayer {
  int? userLevelPlayer;
  String? userIdPlayer;
  String? userNickNamePlayer;
  String? userPicPlayer;
  String? tempoClassificaPlayer;


  BestPlayer.fromJson(Map<String, dynamic> json) {
    userLevelPlayer = json['user_level'];
    userIdPlayer = json['userId'];
    userNickNamePlayer = json['UserNickName'];
    userPicPlayer = json['UserPic'];
    tempoClassificaPlayer = json['TempoClassifica'];
  }


}

class TuoTempoTuoLivello {
  int? userLevelTempo;
  String? userIdTempo;
  String? userNickNameTempo;
  String? userPicTempo;
  String? tempoClassificaTempo;

  TuoTempoTuoLivello.fromJson(Map<String, dynamic> json) {
    userLevelTempo = json['user_level'];
    userIdTempo = json['userId'];
    userNickNameTempo = json['UserNickName'];
    userPicTempo = json['UserPic'];
    tempoClassificaTempo = json['TempoClassifica'];
  }

}

