import 'dart:async';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:toesor/modules/confirm_map_one_screen/cubit/states.dart';
import 'package:toesor/modules/mapScreen/cubit/cubit.dart';
import 'package:toesor/shared/style/colors.dart';
import '../../../shared/constance/constant.dart';
import '../../../shared/network/remote/location_helper.dart';

class ConfirmaMapScreenCubit extends Cubit<ConfirmaMapScreenStates>{
  ConfirmaMapScreenCubit() :  super(InitialConfirmaMapScreenStates());

  static ConfirmaMapScreenCubit get(context) => BlocProvider.of(context);


  Position? position;
  Future<void> getMyCurrentLocation() async {
    position = await LocationHelper.getCurrentLocation().whenComplete(() {
      emit(ChangePositionLocationConfirmaMapScreen());
    });
  }
  ///GETPolyPoints
  List<LatLng> polylineCoordinates=[];
  int? items;
  void getPolyPoints(BuildContext context)async{
    PolylinePoints polyPoints = PolylinePoints();
    PolylineResult ? result;
    for(int i = 0 ; i < MapScreenCubit.get(context).data.length;i++){

      for(int j = 0; j< MapScreenCubit.get(context).data[i].lap!.length;j++){
         result = await polyPoints.getRouteBetweenCoordinates(
            google_Api_key,
            PointLatLng(
                position!.latitude, position!.longitude
              //30.033333,31.233334
            ),
            PointLatLng(
              //30.352540,31.601750
              double.parse(MapScreenCubit.get(context).data[i].lap![j].tappaLat.toString()),
              double.parse(MapScreenCubit.get(context).data[i].lap![j].tappaLng.toString(),
              ),
            ),
        );
      }
    }

    if(result!.points.isNotEmpty){
      result.points.forEach((PointLatLng point)=>polylineCoordinates.add(
        LatLng(point.latitude, point.longitude),
      ));
      emit(PolylineState());
    }
  }
  /// EndGETPolyPoints
  final Completer<GoogleMapController> mapController = Completer();

  Future<void> goToMyCurrentLocation(context) async {
    final GoogleMapController controller = await mapController.future;
    print(position!.latitude + position!.longitude);
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      bearing: 0.0,
      target: LatLng(position!.latitude, position!.longitude),
      tilt: 0.0,
      zoom: 17.0,
    )));
    emit(GoToMyCurrentLocationConfirmaMapScreenState());
  }

  Set<Marker> markers = {};
  ScrollController listScrollController = ScrollController();

  Set<Marker> myCurrentMarker(context) {
    markers.add(Marker(
      position: LatLng(ConfirmaMapScreenCubit.get(context).position!.latitude,
          ConfirmaMapScreenCubit.get(context).position!.longitude),
      markerId: const MarkerId('1000'),
      infoWindow: const InfoWindow(title: "La tua posizione attuale"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    ));
    emit(AddCurrentMarkerSetConfirmaMapScreenState());
    return markers;
  }
  ///Custom Marker
  BitmapDescriptor? customMarker;
  Future<BitmapDescriptor?> setCustomMarker()async{
    customMarker = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), 'assets/images/marker.png');
    emit(SetCustomMarkerConfirmaMapScreenState());
    return customMarker;
  }

  ///GetTapMarkers
  Future<Set<Marker>> getTapMarkers(context,int markerIndex) async {
    print(MapScreenCubit.get(context).data.length);
    if (MapScreenCubit.get(context).data.isNotEmpty) {
      for (int item = 0; item < MapScreenCubit.get(context).data[markerIndex].lap!.length; item++) {
        markers.add(Marker(
          position: LatLng(double.parse(MapScreenCubit.get(context).data[markerIndex].lap![item].tappaLat.toString()),
              double.parse(MapScreenCubit.get(context).data[markerIndex].lap![item].tappaLng.toString())),
          markerId: MarkerId('$item'),
          onTap: () {
            getPolyPoints(context);
            showFlexibleBottomSheet(
              isExpand: true,
              bottomSheetColor: Colors.transparent,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              minHeight: 0,
              initHeight: 0.13,
              maxHeight: 0.17,
              context: context,
              builder: (context, scrollController, space) => Padding(
                padding:  EdgeInsets.symmetric(
                  horizontal: 10.sp,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                      color: kPopColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      )),
                  child: ListView(
                    controller: scrollController,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.015,
                        ),
                        child: Column(
                          children: [
                            SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Padding(
                                padding:  EdgeInsets.symmetric(
                                    horizontal: 10.sp,
                                    vertical: 10.sp
                                ),
                                child: Column(
                                  children: [
                                    Center(
                                      child: Text(
                                        "Conferma di essere \n arrivato a destinazione",
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Comfortaa',
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.sp,
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.symmetric(
                                          horizontal: 90.sp
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color:const Color(0XFF5BA57B),
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'CONFERMA',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Comfortaa',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 6.sp,
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            );
          },
          infoWindow: InfoWindow(
            title: MapScreenCubit.get(context).data[markerIndex].lap![item].nameTappa.toString(),
          ),
          icon:await BitmapDescriptor.fromAssetImage(
              const ImageConfiguration(size: Size(50, 50)), 'assets/images/marker.png'
          ),
        ));
      }
    }
    emit(AddTapMarkerToSet());
    return markers;
  }
///END GetTapMarkers

}