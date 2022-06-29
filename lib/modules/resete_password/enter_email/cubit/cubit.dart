import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toesor/modules/resete_password/enter_email/cubit/states.dart';
import '../../../../models/enter_email_model.dart';
import '../../../../shared/end_points.dart';
import '../../../../shared/network/remote/dio_helper.dart';

class EnterEmailCubit extends Cubit<EnterEmailStates>
{
  EnterEmailCubit() : super (InitialEnterEmailState());
  static EnterEmailCubit get(context) =>BlocProvider.of(context);

  EnterEmailModel ? enterEmailModel;

  String ? email;
  String ? code;

  Future<void> enterEmail({
    required String email,
  }) async {
    emit(LoadingEnterEmailState());
    DioHelper.postData(
        methodUrl: ENTER_Email,
        data:  {
          "email": email,
        }
    ).then((value) {
      enterEmailModel = EnterEmailModel.fromJson(value.data);
      emit(SuccessEnterEmailState(enterEmailModel!));
    }).catchError((error) {
      emit(ErrorEnterEmailState(error));
    });
  }


}