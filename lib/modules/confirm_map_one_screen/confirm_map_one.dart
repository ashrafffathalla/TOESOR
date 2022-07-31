import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:toesor/modules/confirm_map_one_screen/cubit/cubit.dart';
import 'package:toesor/modules/confirm_map_one_screen/cubit/states.dart';
import '../../shared/components/navigationbar/navigationbar.dart';
import '../../shared/style/colors.dart';

class ConfirmMapOne extends StatelessWidget {
  int index;
   ConfirmMapOne({Key? key,required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ConfirmaMapScreenCubit.get(context).getMyCurrentLocation();
    ConfirmaMapScreenCubit.get(context).goToMyCurrentLocation(context);


    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<ConfirmaMapScreenCubit,ConfirmaMapScreenStates>(
      listener: (context,state){
        if (state is ChangePositionLocationConfirmaMapScreen) {
          ConfirmaMapScreenCubit.get(context).getTapMarkers(context,index);
          // ConfirmaMapScreenCubit.get(context).getPolyPoints(
          //   context,
          // );

          if (ConfirmaMapScreenCubit.get(context).position != null) {
            ConfirmaMapScreenCubit.get(context).myCurrentMarker(context);
          }
        }

      },
      builder: (context,state){
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              ConfirmaMapScreenCubit.get(context).getPolyPoints(
                context,
              );
            }
          ),
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
                  //onCameraMove: ,
                  polylines: {
                    Polyline(
                      polylineId:const PolylineId ("route"),
                      points: ConfirmaMapScreenCubit.get(context).polylineCoordinates,
                      color: kPrimaryColor,
                      width: 4,
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
              ],
            ),
          ),
        );
      },
    );
  }
}