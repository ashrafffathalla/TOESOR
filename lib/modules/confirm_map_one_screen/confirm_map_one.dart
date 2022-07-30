import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:toesor/modules/mapScreen/cubit/cubit.dart';
import 'package:toesor/modules/mapScreen/cubit/states.dart';
import '../../shared/components/navigationbar/navigationbar.dart';
import '../../shared/style/colors.dart';

class ConfirmMapOne extends StatelessWidget {
  const ConfirmMapOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MapScreenCubit.get(context).getMyCurrentLocation();
    MapScreenCubit.get(context).goToMyCurrentLocation(context);
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kAppbarColor,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: size.width * 0.01),
            child: Icon(
              Icons.logout,
              size: 33.sp,
              color: const Color(0xffEEDEBA),
            ),
          ),
        ],
        leading: GestureDetector(
          onTap: () => scaffoldKey.currentState!.openDrawer(),
          child: Icon(
            Icons.menu,
            size: 33.sp,
            color: const Color(0xffEEDEBA),
          ),
        ),
      ),
      body: Scaffold(
        drawer: const NavigationDrawerScreen(),
        key: scaffoldKey,
        body: BlocConsumer<MapScreenCubit,MapScreenStates>(
          listener: (context, state) {
            if (state is ChangePositionLocationMapScreen) {
              if (MapScreenCubit
                  .get(context)
                  .position != null) {
                MapScreenCubit.get(context).myCurrentMarker(context);

              }

              MapScreenCubit.get(context).getTapMarkers(context);
            }
          },
          builder: (context, state) {
            return Stack(
              alignment: Alignment.center,
              children: [
                MapScreenCubit
                    .get(context)
                    .position != null
                    ? GoogleMap(
                  scrollGesturesEnabled: true,
                  myLocationButtonEnabled: true,
                  //trafficEnabled: true,
                  myLocationEnabled: true,
                  mapType: MapType.normal,
                  zoomGesturesEnabled: true,
                  zoomControlsEnabled: true,
                  polylines: {
                    Polyline(
                        polylineId:PolylineId ("route"),
                      points: MapScreenCubit.get(context).polylineCoordinates,
                      color: kPrimaryColor,
                      width: 6,
                    )
                  },
                  markers: MapScreenCubit
                      .get(context)
                      .markers,
                  initialCameraPosition: MapScreenCubit
                      .get(context)
                      .position != null ?
                  CameraPosition(
                    bearing: 0.0,
                    target: LatLng(MapScreenCubit.get(context).position!.latitude,
                        MapScreenCubit.get(context).position!.longitude),
                    tilt: 0.0,
                    zoom: 18.0,
                  ) : const CameraPosition(
                    bearing: 0.0,
                    target: LatLng(30.5234851, 30.532179),
                    tilt: 0.0,
                    zoom: 17.0,
                  ),
                )
                    : const Center(
                  child: CircularProgressIndicator(
                    color: kPrimaryColor,

                  ),
                ),
              ],
            );
          },

        ),
      ),
    );
  }
}
/*
 Positioned(
                  bottom: 0,
                  child: Center(
                    child: Container(
                      width: size.width * 0.9,
                      height: size.height * 0.22,
                      decoration: const BoxDecoration(
                          color:kPopColor ,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30),
                          )),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(
                              horizontal: size.width*0.05,
                              vertical: size.height*0.03
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
                                height: size.height*0.03,
                              ),
                              Container(
                                width: size.width * 0.38,
                                height: size.height * 0.05,
                                decoration: BoxDecoration(
                                  color:const Color(0XFF5BA57B),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
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
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
 */