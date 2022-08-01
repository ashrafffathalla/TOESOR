import 'package:toesor/models/edit_password_model.dart';

abstract class EditPasswordStates{}

class InitialEditPasswordState extends EditPasswordStates{}

class LoadingEditPasswordState extends EditPasswordStates{}

class SuccessEditPasswordState extends EditPasswordStates{
  EditPasswordModel editPasswordModel;
  SuccessEditPasswordState(this.editPasswordModel);
}

class ErrorEditPasswordState extends EditPasswordStates{
  final String?error;
  ErrorEditPasswordState(this.error);
}