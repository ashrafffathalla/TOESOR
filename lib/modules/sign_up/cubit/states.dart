import 'package:toesor/models/sign_up_model.dart';

abstract class SignUpStates{}

class InitialSignUpState extends SignUpStates{}

class LoadingSignUpState extends SignUpStates{}
class SuccessSignUpState extends SignUpStates{
  SignUpModel signUpModel;
  SuccessSignUpState (this.signUpModel);
}
class ErrorSignUpState extends SignUpStates{
  final String? error;
  ErrorSignUpState(this.error);
}

