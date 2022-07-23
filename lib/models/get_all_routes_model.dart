/*
class GetAllRoutesModel {
  bool? success;
  String? message;
  List<DataRoute> data = [];

  GetAllRoutesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
      json['data'].forEach((element) {
        data.add(DataRoute.fromJson(element));
      });
    }
  }




class DataRoute {
  int? routeID;
  String? descr;
  String? length;
  String? duration;
  String? routeLat;
  String? routeLng;

  DataRoute.fromJson(Map<String, dynamic> json) {
    routeID = json['Route_ID'];
    descr = json['descr'];
    length = json['length'];
    duration = json['duration'];
    routeLat = json['Route_Lat'];
    routeLng = json['Route_Lng'];
  }


}
*/
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

  DataModel.fromJson(Map<String, dynamic> json) {
    routeID = json['Route_ID'];
    Roue_Name = json['Roue_Name'];
    descr = json['descr'];
    length = json['length'];
    duration = json['duration'];
    routeLat = json['Route_Lat'];
    routeLng = json['Route_Lng'];

  }
}