import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:toesor/modules/confirm_map_one_screen/cubit/cubit.dart';
import 'package:toesor/modules/confirm_map_one_screen/cubit/states.dart';
import 'package:toesor/modules/time_screen/time_screen.dart';
import 'package:toesor/shared/constance/logout.dart';
import '../../shared/components/components.dart';
import '../../shared/components/navigationbar/navigationbar.dart';
import '../../shared/style/colors.dart';
import '../mapScreen/cubit/cubit.dart';

class ConfirmMapOne extends StatelessWidget {
  int index;
   ConfirmMapOne({Key? key,required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ConfirmaMapScreenCubit.get(context).getMyCurrentLocation();
    ConfirmaMapScreenCubit.get(context).goToMyCurrentLocation(context);
    ConfirmaMapScreenCubit.get(context).markers.clear();
    ConfirmaMapScreenCubit.get(context).polylineCoordinates = [];

    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<ConfirmaMapScreenCubit,ConfirmaMapScreenStates>(
      listener: (context,state){
        if (state is ChangePositionLocationConfirmaMapScreen) {
          ConfirmaMapScreenCubit.get(context).getTapMarkers(context,index);
         ConfirmaMapScreenCubit.get(context).getPolyPoints(context);
          // if (ConfirmaMapScreenCubit.get(context).position != null) {
          //   ConfirmaMapScreenCubit.get(context).myCurrentMarker(context);
          // }
        }
      },
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: kAppbarColor,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: size.width * 0.01),
                child: InkWell(
                  onTap: (){
                    signOut(context);
                  },
                  child: Icon(
                    Icons.logout,
                    size: 33.sp,
                    color: const Color(0xffEEDEBA),
                  ),
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
            body:Stack(
              alignment: Alignment.center,
              children: [

                ConfirmaMapScreenCubit
                    .get(context)
                    .position != null
                    ? GoogleMap(
                  scrollGesturesEnabled: true,
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  mapType: MapType.normal,
                  zoomGesturesEnabled: true,
                  zoomControlsEnabled: true,
                  polylines: {
                    Polyline(
                      polylineId:const PolylineId ("route"),
                      points: ConfirmaMapScreenCubit.get(context).polylineCoordinates,
                      color: kPrimaryColor,
                      width: 10,
                      patterns: [
                        PatternItem.dot,
                        PatternItem.gap(20)
                      ]
                    ),
                  },
                  markers: ConfirmaMapScreenCubit
                      .get(context)
                      .markers,
                  initialCameraPosition: ConfirmaMapScreenCubit
                      .get(context)
                      .position != null ?
                  CameraPosition(
                    bearing: 0.0,
                    target: LatLng(ConfirmaMapScreenCubit.get(context).position!.latitude,
                        ConfirmaMapScreenCubit.get(context).position!.longitude),
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
                Positioned(
                    bottom: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: kPopColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30),
                          )),
                      child: Column(
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
                                          child: InkWell(
                                            onTap: (){
                                              // navigateTo(context, VaucherScreen(
                                              //   index : index.toInt(),
                                              // ));
                                              showDialog(
                                                  context: context,
                                                  builder: (context){
                                                    return Dialog(
                                                      backgroundColor: kPopColor,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(20.0),
                                                      ),
                                                      child: Container(

                                                        width: size.width*0.9,
                                                        child: SingleChildScrollView(
                                                          physics:const BouncingScrollPhysics(),
                                                          child: Column(
                                                            children: [
                                                              Padding(
                                                                padding:  EdgeInsets.only(
                                                                  right: size.width*0.06,
                                                                  top: size.height*0.01,
                                                                  bottom: size.height*0.02,
                                                                ),
                                                                child: Image.asset('assets/images/shadow.png'),
                                                              ),
                                                              Text(
                                                                "Cliccando su CONFERMA\n partirà il timer valido\n per la classifica",
                                                                style: TextStyle(
                                                                  fontSize: 20.sp,
                                                                  fontWeight: FontWeight.w400,
                                                                  fontFamily: 'Comfortaa',
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: size.height*0.02,
                                                              ),
                                                              GestureDetector(
                                                                onTap: (){
                                                                  navigateAndFinish(context, TimeScreen(
                                                                    index :index.toInt(),
                                                                  ));
                                                                  print(index.toString());
                                                                },
                                                                  child: Container(
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
                                                                          fontSize: 20.sp,
                                                                          fontWeight: FontWeight.w400,
                                                                          fontFamily: 'Comfortaa',
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                              ),
                                                              SizedBox(
                                                                height: size.height*0.025,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                              );
                                            },
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
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.sp,
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}