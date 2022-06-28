import '../../../../models/reset_password.dart';

abstract class ResetPasswordStates{}

class InitialResetPasswordState extends ResetPasswordStates{}

class LoadingResetPasswordState extends ResetPasswordStates{}

class SuccessResetPasswordState extends ResetPasswordStates{
  ResetPasswordModel resetPasswordModel;
  SuccessResetPasswordState(this.resetPasswordModel);
}

class ErrorResetPasswordState extends ResetPasswordStates{
  final String?error;
  ErrorResetPasswordState(this.error);
}