import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toesor/models/edit_profile_model.dart';
import 'package:toesor/modules/profile_screen/cubit/states.dart';
import 'package:toesor/shared/end_points.dart';
import '../../../shared/network/remote/dio_helper.dart';

class EditProfileCubit extends Cubit<EditProfileStates>{
  EditProfileCubit() : super (InitialEditProfileStates());
  static EditProfileCubit get(context) =>BlocProvider.of(context);

  EditProfileModel ? editProfileModel;

  Future<void> editProfile({
     String? nickName,
     File? userPic,

  }) async {
    emit(LoadingEditProfileStates());
    DioHelper.postData(
        methodUrl: EDIT_PROFILE,
        data:  {
          "NickName": nickName,
          "UserPic": userPic,
        }
    ).then((value) {
      editProfileModel = EditProfileModel.fromJson(value.data);
      print('+++++++++++++++++++@@@');
      print(editProfileModel!.message);
      emit(SuccessEditProfileStates(editProfileModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ErrorEditProfileStates(error.toString()));
    });
  }

  bool hasImage = false;
  File? image;
  Future getImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
        this.image = imageTemporary;
        hasImage = true;
      emit(EditImageState());
    }
    on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
    emit(EditImageState());
  }
}