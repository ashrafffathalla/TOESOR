import 'package:toesor/models/send_lat_lon_model.dart';

import '../../../models/get_all_routes_model.dart';

abstract class MapScreenStates{}

class InitialMapScreenState extends MapScreenStates{}

class LoadingTabTwoMapScreenState extends MapScreenStates{}

class SuccessTabTwoMapScreenState extends MapScreenStates{
 List<DataModel> data;
SuccessTabTwoMapScreenState(this.data);
}

class ErrorTabTwoMapScreenState extends MapScreenStates{
   final String?error;
  ErrorTabTwoMapScreenState(this.error);
}

class ChangePositionLocationMapScreen extends MapScreenStates{}

class GoToMyCurrentLocationState extends MapScreenStates{}

class AddMarkerToSet extends MapScreenStates{}
class AddTapMarkerToSet extends MapScreenStates{}
class AddCurrentMarkerSet extends MapScreenStates{}
class CalculateDistanceState extends MapScreenStates{}
//Send Lat LNG States
class LoadingSendLatLonState extends MapScreenStates{}
class SuccessSendLatLonState extends MapScreenStates{}
class ErrorSendLatLonState extends MapScreenStates{
  final String? error;
  ErrorSendLatLonState(this.error);
}
class ChangeCanILogout extends MapScreenStates{}

class SetCustomMarker extends MapScreenStates{}

class PolylineState extends MapScreenStates{}
