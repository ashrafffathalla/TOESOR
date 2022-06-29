import '../../../../models/enter_code_model.dart';
import '../../../../models/reset_password.dart';

abstract class EnterCodeStates{}

class InitialEnterCodeState extends EnterCodeStates{}

class LoadingEnterCodeState extends EnterCodeStates{}

class SuccessEnterCodeState extends EnterCodeStates{
  EnterCodeModel enterCodeModel;
  SuccessEnterCodeState(this.enterCodeModel);
}

class ErrorEnterCodeState extends EnterCodeStates{
  final String?error;
  ErrorEnterCodeState(this.error);
}