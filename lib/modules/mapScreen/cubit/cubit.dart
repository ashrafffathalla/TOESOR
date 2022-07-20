import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:toesor/models/get_all_routes_model.dart';
import 'package:toesor/modules/mapScreen/cubit/states.dart';
import 'package:toesor/shared/end_points.dart';
import '../../../shared/network/remote/dio_helper.dart';
import '../../../shared/network/remote/location_helper.dart';

class MapScreenCubit extends Cubit<MapScreenStates>{
  MapScreenCubit() : super (InitialMapScreenState());
  static MapScreenCubit get(context)=>BlocProvider.of(context);
  
  List<DataModel> data = <DataModel>[];
  bool? success;
  String? message;

  Future<void> getAllRotes() async {
    emit(LoadingTabTwoMapScreenState());
    DioHelper.getData(
        methodUrl: GET_ALLROUTE
    ).then((value) {
      success = value.data['success'];
      message = value.data['message'];
      data = List<DataModel>.from(value.data['data'].map((element) =>DataModel.fromJson(element)));

      emit(SuccessTabTwoMapScreenState(data));
    }).catchError((error) {
      emit(ErrorTabTwoMapScreenState(error));
    });
  }
   Position? position ;

  Future<void> getMyCurrentLocation() async {
     position = await LocationHelper.getCurrentLocation().whenComplete(() {
      emit(ChangePositionLocationMapScreen());
    });
  }

  final Completer<GoogleMapController> mapController = Completer();
  Future<void> goToMyCurrentLocation(context) async {
    final GoogleMapController controller = await mapController.future;
    controller.animateCamera(
        CameraUpdate.newCameraPosition(CameraPosition(
          bearing: 0.0,
          target: LatLng(position!.latitude, position!.longitude),
          tilt: 0.0,
          zoom: 17.0,
        )));
    emit(GoToMyCurrentLocationState());
  }


  Set<Marker> markers = {};

  Set<Marker> myCurrentMarker(context){
    markers.add(Marker(
      position: LatLng(MapScreenCubit.get(context).position!.latitude, MapScreenCubit.get(context).position!.longitude),
      markerId: const MarkerId('1000'),
      onTap: () {},
      infoWindow: const InfoWindow(title: "Your Current Location"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    ));
    emit(AddMarkerToSet());
    return markers;
  }

  Set<Marker> getMarkers() {
    if(data.isNotEmpty){
      for(int item = 0;item < data.length;item++){
        markers.add(Marker(
          markerId: MarkerId('$item'),
          onTap: (){

          },
          position: LatLng(double.parse(data[item].routeLat.toString()),double.parse(data[item].routeLng.toString())),
          infoWindow: InfoWindow( //popup info
            title: '${data[item].descr}',
            //snippet: 'My Custom Subtitle',
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),));
      }
    }
    emit(AddMarkerToSet());
    return markers;
  }

  void addMarkerToMarkersAndUpdateUI(Marker marker) {
    markers.add(marker);
    emit(AddMarkerToSet());
  }
}