import 'package:toesor/models/edit_password_model.dart';

import '../../../models/edit_profile_model.dart';

abstract class EditProfileStates{}

class InitialEditProfileStates extends EditProfileStates{}

class LoadingEditProfileStates extends EditProfileStates{}


class SuccessEditProfileStates extends EditProfileStates{
 // EditProfileModel editProfileModel;
 //SuccessEditProfileStates(this.editProfileModel);
}

class ErrorEditProfileStates extends EditProfileStates{
  final String?error;
  ErrorEditProfileStates(this.error);
}
class EditImageState extends EditProfileStates{}
class ConvertStringToFile extends EditProfileStates{}
class EditUploadImageState extends EditProfileStates{}