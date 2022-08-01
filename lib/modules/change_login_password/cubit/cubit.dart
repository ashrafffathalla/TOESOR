import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toesor/models/edit_password_model.dart';
import 'package:toesor/modules/change_login_password/cubit/states.dart';
import 'package:toesor/shared/end_points.dart';

import '../../../shared/network/remote/dio_helper.dart';

class EditPasswordCubit extends Cubit<EditPasswordStates>
{
  EditPasswordCubit() : super (InitialEditPasswordState());
  static EditPasswordCubit get(context) =>BlocProvider.of(context);

  EditPasswordModel ? editPasswordModel;

  Future<void> editPassword({
    required String password,

  }) async {
    emit(LoadingEditPasswordState());
    DioHelper.postData(
        methodUrl: LOGIN_RESETPASSWORD,
        data:  {
          "password": password,
        }
    ).then((value) {
      editPasswordModel = EditPasswordModel.fromJson(value.data);
      print('+++++++++++++++++++@@@');
      print(editPasswordModel!.statusCode);
      emit(SuccessEditPasswordState(editPasswordModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ErrorEditPasswordState(error.toString()));
    });
  }


}