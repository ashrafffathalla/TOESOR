import 'dart:async';
import 'dart:math';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:toesor/models/get_all_routes_model.dart';
import 'package:toesor/models/send_lat_lon_model.dart';
import 'package:toesor/modules/gioca_screen/gioca_screen.dart';
import 'package:toesor/modules/mapScreen/cubit/states.dart';
import 'package:toesor/shared/components/colors_dots/colors_dots_screen.dart';
import 'package:toesor/shared/components/components.dart';
import 'package:toesor/shared/end_points.dart';
import '../../../shared/network/remote/dio_helper.dart';
import '../../../shared/network/remote/location_helper.dart';
import '../../../shared/style/colors.dart';

class MapScreenCubit extends Cubit<MapScreenStates> {
  MapScreenCubit() : super(InitialMapScreenState());

  static MapScreenCubit get(context) => BlocProvider.of(context);

  List<DataModel> data = <DataModel>[];
  bool? success;
  String? message;
  Future<void> getAllRotes() async {
    emit(LoadingTabTwoMapScreenState());
    DioHelper.getData(methodUrl: GET_ALLROUTE).then((value) {
      success = value.data['success'];
      message = value.data['message'];
      data = List<DataModel>.from(
          value.data['data'].map((element) => DataModel.fromJson(element)));
      emit(SuccessTabTwoMapScreenState(data));
    }).catchError((error) {
      print(error.toString());
      emit(ErrorTabTwoMapScreenState(error.toString()));
    });
  }

  Position? position;
  Future<void> getMyCurrentLocation() async {
    position = await LocationHelper.getCurrentLocation().whenComplete(() {
      emit(ChangePositionLocationMapScreen());
    });
  }

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
    emit(GoToMyCurrentLocationState());
  }

  ///Distance Between your currentLocation And Marker

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    emit(CalculateDistanceState());
    return 12742 * asin(sqrt(a));
  }

  Set<Marker> markers = {};
  ScrollController listScrollController = ScrollController();

  Set<Marker> myCurrentMarker(context) {
    markers.add(Marker(
      position: LatLng(MapScreenCubit.get(context).position!.latitude,
          MapScreenCubit.get(context).position!.longitude),
      markerId: const MarkerId('1000'),
      infoWindow: const InfoWindow(title: "La tua posizione attuale"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    ));
    emit(AddCurrentMarkerSet());
    return markers;
  }
///Custom Marker
  BitmapDescriptor? customMarker;
  Future<BitmapDescriptor?> setCustomMarker()async{
    customMarker = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), 'assets/images/marker.png');
    emit(SetCustomMarker());
    return customMarker;
  }
  Future<Set<Marker>> getMarkers(context) async {
    print(data.length);
    if (data.isNotEmpty) {
      for (int item = 0; item < data.length; item++) {
        markers.add(Marker(
          position: LatLng(double.parse(data[item].routeLat.toString()),
              double.parse(data[item].routeLng.toString())),
          markerId: MarkerId('$item'),
          onTap: () {
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
            initHeight: 0.27,
            maxHeight: 0.4,
            context: context,
            builder: (context, scrollController, space) => Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: 10.sp,
              ),
              child: Container(
                decoration: const BoxDecoration(
                    color: kPrimaryColor,
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
                          Container(
                            width: 28.sp,
                            height: 5.sp,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(20)
                            ),
                          ),
                          SizedBox(
                            height: 6.sp,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.07,
                              ),

                              Text(
                                data[item].Roue_Name.toString(),
                                style: TextStyle(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontFamily: 'Comfortaa'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              data[item].length.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Comfortaa'),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top:
                                MediaQuery.of(context).size.height * 0.02,
                              ),
                              child: Row(
                                children: const [
                                  ColorDot(),
                                  ColorDot(
                                    isSelected: false,),
                                  ColorDot(
                                    isSelected: false,
                                  ),
                                  ColorDot(
                                    isSelected: false,
                                  ),
                                  ColorDot(
                                    isSelected: false,
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              'Lunghezza (km)',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Comfortaa'),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              data[item].duration.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Comfortaa'),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top:
                                MediaQuery.of(context).size.height * 0.02,
                              ),
                              child: Row(
                                children: const [
                                  ColorDot(),
                                  ColorDot(),
                                  ColorDot(
                                    isSelected: false,
                                  ),
                                  ColorDot(
                                    isSelected: false,
                                  ),
                                  ColorDot(
                                    isSelected: false,
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              'Tempo medio',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Comfortaa'),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              data[item].lap!.length.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Comfortaa'),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top:
                                MediaQuery.of(context).size.height * 0.02,
                              ),
                              child: Row(
                                children: [
                                  if (data[item].lap!.length == 1)
                                    Row(
                                      children: const [
                                        ColorDot(
                                          isSelected: true,
                                        ),
                                        ColorDot(
                                          isSelected: false,
                                        ),
                                        ColorDot(
                                          isSelected: false,
                                        ),
                                        ColorDot(
                                          isSelected: false,
                                        ),
                                        ColorDot(
                                          isSelected: false,
                                        ),
                                      ],
                                    ),
                                  if (data[item].lap!.length == 2)
                                    Row(
                                      children: const [
                                        ColorDot(
                                          isSelected: true,
                                        ),
                                        ColorDot(
                                          isSelected: true,
                                        ),
                                        ColorDot(
                                          isSelected: false,
                                        ),
                                        ColorDot(
                                          isSelected: false,
                                        ),
                                        ColorDot(
                                          isSelected: false,
                                        ),
                                      ],
                                    ),
                                  if (data[item].lap!.length == 3)
                                    Row(
                                      children: const [
                                        ColorDot(
                                          isSelected: true,
                                        ),
                                        ColorDot(
                                          isSelected: true,
                                        ),
                                        ColorDot(
                                          isSelected: true,
                                        ),
                                        ColorDot(
                                          isSelected: false,
                                        ),
                                        ColorDot(
                                          isSelected: false,
                                        ),
                                      ],
                                    ),
                                  if (data[item].lap!.length == 4)
                                    Row(
                                      children: const [
                                        ColorDot(
                                          isSelected: true,
                                        ),
                                        ColorDot(
                                          isSelected: true,
                                        ),
                                        ColorDot(
                                          isSelected: true,
                                        ),
                                        ColorDot(
                                          isSelected: true,
                                        ),
                                        ColorDot(
                                          isSelected: false,
                                        ),
                                      ],
                                    ),
                                  if (data[item].lap!.length == 5)
                                    Row(
                                      children: const [
                                        ColorDot(
                                          isSelected: true,
                                        ),
                                        ColorDot(
                                          isSelected: true,
                                        ),
                                        ColorDot(
                                          isSelected: true,
                                        ),
                                        ColorDot(
                                          isSelected: true,
                                        ),
                                        ColorDot(
                                          isSelected: true,
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                            Text(
                              'Numero tappe',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Comfortaa'),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    if(space == 0.4)Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                          MediaQuery.of(context).size.width * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 3.sp,
                          ),
                          Text(
                              'DESCRIZIONE',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Comfortaa',
                            ),
                          ),
                          SizedBox(
                            height: 5.sp,
                          ),
                          Text(
                            data[item].descr.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Comfortaa',
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 90.sp),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.38,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          color: const Color(0XFF5BA57B),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              navigateTo(
                                  context,
                                  GiocaScreen(
                                    data: data[item],
                                    index: item,
                                  ));
                            },
                            child: Text(
                              'SCEGLI',
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
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.02,)
                  ],
                ),
              ),
            ),
            );
          },
          infoWindow: InfoWindow(
            title: data[item].Roue_Name.toString(),
          ),
          icon:await BitmapDescriptor.fromAssetImage(
               const ImageConfiguration(size: Size(50, 50)), 'assets/images/marker.png'
          ),
        ));
      }
    }
    emit(AddMarkerToSet());
    return markers;
  }

  void addMarkerToMarkersAndUpdateUI(Marker marker) {
    markers.add(marker);
    emit(AddMarkerToSet());
  }

  ///SEND LAT&LON With 2 Sec
  LatLonModel? latLonModel;

  Future<void> sendLatLong({
    double? lat,
    double? lon,
  }) async {
    emit(LoadingSendLatLonState());
    Timer.periodic(
      const Duration(seconds: 2),
      (timer) => DioHelper.postData(methodUrl: SEND_LATLONG, data: {
        "RealTime_Geo_Lat": lat,
        "RealTime_Geo_Lng": lon,
      }).then((value) {
        latLonModel = LatLonModel.fromJson(value.data);
        //print(latLonModel!.message);
        emit(SuccessSendLatLonState());
      }).catchError((error) {
        print('is error here ');
        print(error.toString());
        emit(ErrorSendLatLonState(error.toString()));
      }),
    );
  }

  ///

  double distance(context,index,List<DataModel> data, ) {
    double distanceInMeters =
         Geolocator.distanceBetween(
             MapScreenCubit.get(context).position!.latitude,
             MapScreenCubit.get(context).position!.longitude,
           double.parse(data[index].routeLng.toString()),
           double.parse(data[index].routeLng.toString()),
         );
    print(distanceInMeters);
    double distanceInKiloMeters = distanceInMeters / 1000;
    if(distanceInMeters <= 1000){
      return double.parse(distanceInMeters.toStringAsFixed(2));
    } else if(distanceInMeters > 1000){
      double roundDistanceInKM = double.parse((distanceInKiloMeters).toStringAsFixed(2));
      return roundDistanceInKM;
    }

    emit(CalculateDistanceState());
    return distanceInMeters;
    // double distanceInMeters = 144851.67191816124;
    // double distanceInKiloMeters = distanceInMeters / 1000;
    // double roundDistanceInKM =
    // double.parse((distanceInKiloMeters).toStringAsFixed(2));
    //
    // print(distanceInMeters);
    // print(distanceInKiloMeters);
    // print(roundDistanceInKM);
  }
}
