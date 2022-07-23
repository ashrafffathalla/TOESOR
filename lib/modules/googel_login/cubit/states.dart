
import 'package:toesor/models/google_login_model.dart';

abstract class GoogleStates{}

class InitialGoogleState extends GoogleStates{}

class LoadingGoogleState extends GoogleStates{}
class SuccessGoogleState extends GoogleStates{}
class ErrorGoogleState extends GoogleStates{
  final String? error;
  ErrorGoogleState(this.error);
}
class ChangeUserObjectState extends GoogleStates{}

class IsLoginGoogleState extends GoogleStates{}
class ChangeEndTokenGoogleState extends GoogleStates{}
//LOGIN API
class LoadingGoogleAPIState extends GoogleStates{}
class SuccessGoogleAPIState extends GoogleStates{
  GoogleModel googleModel;
  SuccessGoogleAPIState(this.googleModel);
}
class ErrorGoogleAPIState extends GoogleStates{
  final String? error;
  ErrorGoogleAPIState(this.error);
}
class ChangeGoogleFirstNameState extends GoogleStates{}
class ChangeGoogleLastNameState extends GoogleStates{}