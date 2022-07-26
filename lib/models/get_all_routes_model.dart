
class GetAllRoutesModel {
  bool? success;
  String? message;
  DataModel ? data;

  GetAllRoutesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ?  DataModel.fromJson(json['data']) : null;
   }
  }

class DataModel {
  int? routeID;
  String? Roue_Name;
  String? descr;
  String? length;
  String? duration;
  String? routeLat;
  String? routeLng;
  List<Lap>? lap;

  DataModel.fromJson(Map<String, dynamic> json) {
    routeID = json['Route_ID'];
    Roue_Name = json['Roue_Name'];
    descr = json['descr'];
    length = json['length'];
    duration = json['duration'];
    routeLat = json['Route_Lat'];
    routeLng = json['Route_Lng'];
    if (json['lap'] != null) {
      lap = <Lap>[];
      json['lap'].forEach((v) {
        lap!.add( Lap.fromJson(v));
      });
    }
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