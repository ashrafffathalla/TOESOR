import 'package:toesor/models/facbook_model.dart';

abstract class FacebookStates{}

class InitialFacebookState extends FacebookStates{}

class LoadingFacebookState extends FacebookStates{}
class SuccessFacebookState extends FacebookStates{}
class ErrorFacebookState extends FacebookStates{
  final String? error;
  ErrorFacebookState(this.error);
}

class LoadingFacebookAPIState extends FacebookStates{}
class SuccessFacebookAPIState extends FacebookStates{
  FaceBookModel faceBookModel;
  SuccessFacebookAPIState(this.faceBookModel);
}
class ErrorFacebookAPIState extends FacebookStates{
  final String? error;
  ErrorFacebookAPIState(this.error);
}
class IsLoginFacebookState extends FacebookStates{}

class ChangeUserObjectState extends FacebookStates{}

class ChangeEndTokenState extends FacebookStates{}

class ChangeFirstNameState extends FacebookStates{}
class ChangeLastNameState extends FacebookStates{}

