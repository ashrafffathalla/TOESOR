import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:toesor/models/edit_profile_model.dart';
import 'package:toesor/modules/profile_screen/cubit/states.dart';
import 'package:toesor/shared/end_points.dart';
import 'package:http_parser/http_parser.dart';
import '../../../shared/network/remote/dio_helper.dart';

class EditProfileCubit extends Cubit<EditProfileStates>{
  EditProfileCubit() : super (InitialEditProfileStates());
  static EditProfileCubit get(context) =>BlocProvider.of(context);

  EditProfileModel ? editProfileModel;

  // Future<void> uploadProfile({
  //    required String nickName,
  //    required File userPic,
  //
  // }) async {
  //   emit(LoadingEditProfileStates());
  //   DioHelper.postData(
  //       methodUrl: EDIT_PROFILE,
  //       data:  {
  //         "NickName": nickName,
  //         "UserPic": userPic,
  //       }
  //   ).then((value) {
  //     editProfileModel = EditProfileModel.fromJson(value.data);
  //     print('+++++++++++++++++++@@@');
  //     emit(SuccessEditProfileStates(editProfileModel!));
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(ErrorEditProfileStates(error.toString()));
  //   });
  // }


  ///*****************************************


  // String ? finalPath ;
  // String ? base;
  //
  // bool isFinalPathExist = false;
  // Future<String> createFileFromString() async {
  //   final encodedStr = base!.split(",")[1];
  //   Uint8List bytes = base64.decode(encodedStr);
  //   String dir = (await getApplicationDocumentsDirectory()).path;
  //   File file =
  //   File(
  //       "$dir/" + DateTime
  //           .now()
  //           .millisecondsSinceEpoch
  //           .toString() + ".png");
  //
  //   await file.writeAsBytes(bytes);
  //   finalPath =  file.path;
  //   isFinalPathExist =true;
  //   emit(IsFinalPathExistState());
  //   return file.path;
  // }

  Future<void> uploadProfile({
    String? nickName,
    var userPic,
    context
  }) async {
    emit(LoadingEditProfileStates());
    DioHelper.postDataImage(
      methodUrl: EDIT_PROFILE,
      data: {
        "NickName" : nickName,
        "UserPic" : userPic
      }
    ).then((value) {
     // editProfileModel = EditProfileModel.fromJson(value.data);
      print(value.data);
      emit(SuccessEditProfileStates());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorEditProfileStates(error.toString()));
    });
  }

  /////////////////////////////////






  bool hasImage = false;
  File? image;
  var  finalImage;
  var theLastChoice;
  Future getImage() async {
    try {
      XFile? image1 = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image1 == null) return;
      final imageTemporary = File(image1.path);
        image = imageTemporary;
        hasImage = true;
        print(image);

      File img = File(image1.path);
      final splitted = image1.path.split('.');
      final ext = splitted.last;
      final response = await img.readAsBytes();
      finalImage =  "image/$ext;base64,${base64Encode(response)}";
      // Uint8List bytes = base64.decode(finalImage);
      // String dir = (await getApplicationDocumentsDirectory()).path;
      // File file = File(
      //     "$dir/${DateTime.now().millisecondsSinceEpoch}.png");
      //  file.writeAsBytes(bytes);
      // theLastChoice = file.path;
      emit(EditImageState());

    }
    on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
    emit(EditImageState());
  }
}
/*
String filename = image.path.split('/').last;
        FormData formData = FormData.fromMap({
          "image" : await MultipartFile.fromFile(
              image.path,
            filename: filename,
            contentType:MediaType('image', 'png')),
          "type": "image/png"
        });
        Response response = await dio.post(
            EDIT_PROFILE,data: formData,
          options: Options(
            headers: {"Authorization": 'Bearer $sharedToken'},
          )
        );
* */