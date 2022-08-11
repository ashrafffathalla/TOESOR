import '../../../models/post_time_model.dart';
import '../../../models/time_screen_model.dart';

abstract class TimeScreenStates {}

class InitialTimeScreenState extends TimeScreenStates {}

class LoadingTimeScreenState extends TimeScreenStates {}

class SuccessTimeScreenState extends TimeScreenStates {
  final List<Lap> lap;

  SuccessTimeScreenState(this.lap);
}

class ErrorTimeScreenState extends TimeScreenStates {
  final String? error;

  ErrorTimeScreenState(this.error);
}

class CountState extends TimeScreenStates {}

class AddTimeState extends TimeScreenStates {}

class StartTimeState extends TimeScreenStates {}

class ChangeisButtonActive extends TimeScreenStates {}

class ChangeisButtonTwoActive extends TimeScreenStates {}

class ChangeisButtonThreeActive extends TimeScreenStates {}

class AddOneAiutoState extends TimeScreenStates {}

class AddTwoAiutoState extends TimeScreenStates {}

class AddThreeAiutoState extends TimeScreenStates {}

//START POST TIME AND ROUTE_ID AND TAP_ID STATES
class LoadingPostTimeState extends TimeScreenStates{}
class SuccessPostTimeState extends TimeScreenStates{
  final PostTimeModel postTimeModel;
  SuccessPostTimeState(this.postTimeModel);
}
class ErrorPostTimeState extends TimeScreenStates{
  final String? error;
  ErrorPostTimeState(this.error);

}
//End POST TIME AND ROUTE_ID AND TAP_ID States
