import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:toesor/shared/network/remote/location_helper.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {

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
    return  Scaffold(
      body: Stack(
        children:  [
          position != null ?GoogleMap(
            markers: markers,
              initialCameraPosition: _myCurrentLocationCameraPosition
          ) : Center(child: CircularProgressIndicator(),
          ),
        ]
      ),
    );
  }
/*
https://medium.com/@pierre.sabot/how-to-fetch-user-location-in-background-with-flutter-e3494021bdf5
2-https://github.com/Psabot/background_location
3--https://github.com/fluttercommunity/flutter_workmanager/blob/main/IOS_SETUP.md?fbclid=IwAR2BJeTUTyHRx8rzo-IDQ4jytKMiKlpa-QUccSzGi7mhulvi57CyZEfuM-w#enabling-background-fetch
4-https://pub.dev/packages/background_locator/example
*/

}