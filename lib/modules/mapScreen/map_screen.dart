import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../shared/components/components.dart';
import '../../shared/components/navigationbar/navigationbar.dart';
import '../../shared/network/remote/location_helper.dart';
import '../../shared/style/colors.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  initState() {
    getMyCurrentLocation();

    super.initState();

  }
  Future<void> getMyCurrentLocation() async {
    position = await LocationHelper.getCurrentLocation().whenComplete(() {
      setState(()
      {

      });
    });
  }
  static Position? position;
  Set<Marker> markers ={};
  final Completer<GoogleMapController> _mapController = Completer();
  static final CameraPosition _myCurrentLocationCameraPosition = CameraPosition(
    bearing: 0.0,
    target: LatLng(position!.latitude, position!.longitude),
    tilt: 0.0,
    zoom: 17.0,
  );
  Future<void> _goToMyCurrentLocation() async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
        CameraUpdate.newCameraPosition(_myCurrentLocationCameraPosition));
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    Size size = MediaQuery.of(context).size;
    if(position != null) print(' lat: ${position!.latitude} , long: ${position!.longitude}');
    if(position != null) {

      markers.add(Marker(
        position: LatLng(position!.latitude,position!.longitude),
        markerId: const MarkerId('1'),
        onTap: (){},
        infoWindow: const InfoWindow(
            title: "Your Current Location"
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ));
    }
    void addMarkerToMarkersAndUpdateUI(Marker marker){
      setState((){
        markers.add(marker);
      });
    }
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
                    Stack(
                        children: [
                      position != null
                          ? GoogleMap(
                              markers: markers,
                              initialCameraPosition:
                                  _myCurrentLocationCameraPosition)
                          : Center(
                              child: CircularProgressIndicator(),
                            ),
                    ]),

                    ///second Tab
                    ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => buildSecondTab(context),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 0,
                      ),
                      itemCount: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
