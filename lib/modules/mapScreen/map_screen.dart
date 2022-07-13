import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../shared/components/components.dart';
import '../../shared/components/navigationbar/navigationbar.dart';
import '../../shared/style/colors.dart';
class MapScreen extends StatefulWidget {
  const MapScreen({Key? key,}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen>{
  // Completer<GoogleMapController> _controller = Completer();
  //
  // static final CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );
  //
  // static final CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(37.43296265331129, -122.08832357078792),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor:kAppbarColor,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: size.width*0.01),
              child: Icon(
                Icons.logout,
                size: 33.sp,
                color:const Color(0xffEEDEBA),
              ),
            ),
          ],
          leading: GestureDetector(
            onTap: () => scaffoldKey.currentState!.openDrawer(),
            child: Icon(
              Icons.menu,
              size: 33.sp,
              color:const Color(0xffEEDEBA),
            ),
          ),
        ),
        body: Scaffold(
          drawer:const NavigationDrawerScreen(),
          key: scaffoldKey,
          body: Column(
            children:
            [
              Container(
                height: size.height*0.075,
                decoration:const BoxDecoration(
                  color: Color(0xffEEDEBA),
                  borderRadius: BorderRadius.only(
                  ),
                ),
                child:TabBar(
                    indicatorColor: Colors.transparent,
                    unselectedLabelColor:const Color(0xffD8C9A8),
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
                        fontFamily: 'Comfortaa'
                    ),
                    tabs:[
                      Tab(
                        child: Container(
                          height: size.height,
                          width: size.width/2,
                          child: Center(
                            child: Text(
                              'MAPPA',
                              style: TextStyle(
                                  fontSize: 29.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Comfortaa'
                              ),
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
                                  fontFamily: 'Comfortaa'
                              ),
                            ),
                          ),

                        ),
                      ),
                    ]
                ),
              ),
              /// Tabs
              Expanded(
                child: TabBarView(
                  physics:const BouncingScrollPhysics(),
                  children: [
                    ///First Tab
                    // Stack(
                    //   children: [
                    //     GoogleMap(
                    //       mapType: MapType.hybrid,
                    //       initialCameraPosition: _kGooglePlex,
                    //       onMapCreated: (GoogleMapController controller) {
                    //         _controller.complete(controller);
                    //       },
                    //     ),
                    //   ],
                    // ),
                    ///second Tab
                    ListView.separated(
                      physics:const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => buildSecondTab(context),
                      separatorBuilder: (context, index) =>const SizedBox(height: 0,),
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
