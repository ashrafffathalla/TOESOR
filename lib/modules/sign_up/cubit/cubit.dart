import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toesor/models/sign_up_model.dart';
import 'package:toesor/modules/sign_up/cubit/states.dart';
import 'package:toesor/shared/end_points.dart';

import '../../../shared/network/remote/dio_helper.dart';

class SignUpCubit extends Cubit<SignUpStates>{
  SignUpCubit() : super(InitialSignUpState());

  SignUpModel ? signUpModel;
 static SignUpCubit get(context) => BlocProvider.of(context);
  Future<void> signUp({
    required String name,
    required String lastName,
    required String email,
    required String password,

  }) async {
    emit(LoadingSignUpState());
    DioHelper.postData(
        methodUrl: SIGN_UP,
        data: {
          "name": name,
          "lastname": lastName,
          "role": '2',
          "email": email,
          "password": password,
          "status" : "TRUE",
        }).then((value) {
      signUpModel = SignUpModel.fromJson(value.data);
      print(signUpModel!.user!.name.toString());
      emit(SuccessSignUpState(signUpModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ErrorSignUpState(error));
    });
  }

}