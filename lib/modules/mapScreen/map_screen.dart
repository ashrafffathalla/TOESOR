import 'dart:async';

import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:toesor/models/get_all_routes_model.dart';
import 'package:toesor/modules/gioca_screen/gioca_screen.dart';
import 'package:toesor/modules/mapScreen/cubit/cubit.dart';
import 'package:toesor/modules/mapScreen/cubit/states.dart';
import 'package:toesor/shared/constance/constant.dart';
import 'package:toesor/shared/network/local/sharedprefrance.dart';
import '../../shared/components/colors_dots/colors_dots_screen.dart';
import '../../shared/components/components.dart';
import '../../shared/components/navigationbar/navigationbar.dart';
import '../../shared/constance/logout.dart';
import '../../shared/style/colors.dart';


class MapScreen extends StatefulWidget {
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Timer? timer;
   Stream ? myStream;
  @override
  void initState() {
    super.initState();
    bool success = false;
    bool done = false;
    Future.delayed(const Duration(seconds: 2), () {
      done = true;
      MapScreenCubit.get(context).sendLatLong(
        lon: MapScreenCubit.get(context).position!.longitude.toDouble() ,
        lat: MapScreenCubit.get(context).position!.latitude.toDouble(),
      );
    });
     Stream.periodic(const Duration(seconds: 2)).takeWhile((_) => !done).forEach((_) async
    {
       success = true;
      if(CacheHelper.getData(key: 'token') == null) {
        done = success; // only if you want to finish the function earlier
      }

    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    MapScreenCubit.get(context).getMyCurrentLocation();
    MapScreenCubit.get(context).goToMyCurrentLocation(context);
    MapScreenCubit.get(context).getAllRotes();
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    Size size = MediaQuery
        .of(context)
        .size;
    if (MapScreenCubit.get(context).position != null) {
      print(' lat: ${MapScreenCubit.get(context).position!.latitude} , long: ${MapScreenCubit.get(context).position!.longitude}');
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kAppbarColor,
          actions: [
            BlocConsumer<MapScreenCubit, MapScreenStates>(
              listener: (context, state) {},
              builder: (context, state) {
                return Padding(
                  padding: EdgeInsets.only(right: size.width * 0.01),
                  child: IconButton(
                    onPressed: () {
                      signOut(context);
                    },
                    icon: Icon(
                      Icons.logout,
                      size: 33.sp,
                      color: const Color(0xffEEDEBA),
                    ),
                  ),
                );
              },
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
        body: BlocConsumer<MapScreenCubit, MapScreenStates>(
          listener: (context, state) {
            if (state is SuccessTabTwoMapScreenState) {
              if (state.data.isNotEmpty) {
                MapScreenCubit.get(context).getMarkers(context);
              }
            }
          },
          builder: (context, state) {
            return Scaffold(
              drawer: const NavigationDrawerScreen(),
              key: scaffoldKey,
              body: Column(
                children: [
                  Container(
                    height: size.height * 0.075,
                    decoration: const BoxDecoration(
                      color: Color(0xffEEDEBA),
                      borderRadius: BorderRadius.only(),
                    ),
                    child: TabBar(
                        indicatorColor: Colors.transparent,
                        unselectedLabelColor: const Color(0xffD8C9A8),
                        indicator: const BoxDecoration(
                          color: Color(0xff6A331D),
                          borderRadius: BorderRadius.only(
                            // topRight: Radius.circular(70),
                            // bottomRight: Radius.circular(10),
                          ),
                        ),
                        labelStyle: TextStyle(
                            fontSize: 29.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Comfortaa'),
                        tabs: [
                          Tab(
                            child: Container(
                              height: size.height,
                              width: size.width / 2,
                              child: Center(
                                child: Text(
                                  'MAPPA',
                                  style: TextStyle(
                                      fontSize: 29.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Comfortaa'),
                                ),
                              ),
                            ),

                          ),
                          Tab(
                            child: Container(
                              height: size.height,
                              width: size.width,
                              child: Center(
                                child: Text(
                                  'ELENCO',
                                  style: TextStyle(
                                      fontSize: 29.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Comfortaa'),
                                ),
                              ),
                            ),
                          ),
                        ]),
                  ),

                  /// Tabs
                  Expanded(
                    child: TabBarView(
                      physics: const BouncingScrollPhysics(),
                      children: [

                        ///First Tab
                        BlocConsumer<MapScreenCubit, MapScreenStates>(
                            listener: (context, state) {
                              if (state is ChangePositionLocationMapScreen) {
                                if (MapScreenCubit
                                    .get(context)
                                    .position != null) {
                                  MapScreenCubit.get(context).myCurrentMarker(
                                      context);
                                }
                              }
                            },
                            builder: (context, state) {
                              return Stack(children: [
                                MapScreenCubit
                                    .get(context)
                                    .position != null
                                    ? GoogleMap(
                                  scrollGesturesEnabled: true,
                                  myLocationButtonEnabled: true,
                                  myLocationEnabled: true,
                                  mapType: MapType.terrain,
                                  markers: MapScreenCubit
                                      .get(context)
                                      .markers,
                                  initialCameraPosition: MapScreenCubit
                                      .get(context)
                                      .position != null ?
                                  CameraPosition(
                                    bearing: 0.0,
                                    target: LatLng(MapScreenCubit
                                        .get(context)
                                        .position!
                                        .latitude, MapScreenCubit
                                        .get(context)
                                        .position!
                                        .longitude),
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
                              ]);
                            }
                        ),

                        ///second Tab
                        BlocConsumer<MapScreenCubit, MapScreenStates>(
                          listener: (context, state) {
                            if (state is LoadingTabTwoMapScreenState) {
                              const Center(
                                child: CircularProgressIndicator(
                                  color: kPrimaryColor,
                                ),
                              );
                            }
                          },
                          builder: (context, state) {
                            MapScreenCubit cubit = MapScreenCubit.get(context);
                            return ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) =>
                                  buildSecondTabMAP(
                                      context,
                                      cubit.data,
                                      index,
                                      index % 2 == 0 ? true : false

                                  ),
                              separatorBuilder: (context, index) =>
                              const SizedBox(
                                height: 0,
                              ),
                              itemCount: MapScreenCubit
                                  .get(context)
                                  .data
                                  .length,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),

            );
          },
        ),

      ),
    );
  }

  ///buildSecondTab Screen in tab bar
  Widget buildSecondTabMAP(context, List<DataModel> data, int index,
      bool isEven) =>
      GestureDetector(
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
                                data[index].Roue_Name.toString(),
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
                              data[index].length.toString(),
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
                              data[index].duration.toString(),
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
                              data[index].lap!.length.toString(),
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
                                  if (data[index].lap!.length == 1)
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
                                  if (data[index].lap!.length == 2)
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
                                  if (data[index].lap!.length == 3)
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
                                  if (data[index].lap!.length == 4)
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
                                  if (data[index].lap!.length == 5)
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
                            data[index].descr.toString(),
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
                                    data: data[index],
                                    index: index,
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
        child: Container(
          color: isEven ? Colors.white : const Color(0xffD8C194),
          child: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery
                  .of(context)
                  .size
                  .height * 0.02,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: MediaQuery
                      .of(context)
                      .size
                      .width * 0.03,),
                  child: Row(
                    children: [
                      BlocConsumer<MapScreenCubit, MapScreenStates>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          return Text(
                            '${
                            MapScreenCubit.get(context).distance(context, index, data,)
                            } Km  ',
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Comfortaa'
                            ),
                          );
                        },
                      ),
                      Flexible(
                        child: Text(
                          data[index].Roue_Name.toString(),
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Comfortaa'
                          ),
                        ),
                      ),

                    ],

                  ),
                ),
                SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.02,
                ),
              ],
            ),
          ),
        ),
      );
}
