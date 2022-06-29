import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toesor/models/enter_code_model.dart';
import 'package:toesor/modules/resete_password/enter_code/cubit/states.dart';

import '../../../../shared/end_points.dart';
import '../../../../shared/network/remote/dio_helper.dart';

class EnterCodeCubit extends Cubit<EnterCodeStates>
{
  EnterCodeCubit() : super (InitialEnterCodeState());
  static EnterCodeCubit get(context) =>BlocProvider.of(context);

  EnterCodeModel ? enterCodeModel;

  Future<void> enterCode({
    required String email,
    required String password,
    required String token,
  }) async {
    emit(LoadingEnterCodeState());
    DioHelper.getData(methodUrl: ENTER_CODE).then((value) {
      enterCodeModel = EnterCodeModel.fromJson(value.data);
      emit(SuccessEnterCodeState(enterCodeModel!));
    }).catchError((error) {
      emit(ErrorEnterCodeState(error));
    });
  }


}