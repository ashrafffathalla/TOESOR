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