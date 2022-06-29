import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toesor/models/reset_password.dart';
import 'package:toesor/modules/resete_password/reset_password/states/states.dart';
import 'package:toesor/shared/end_points.dart';
import '../../../../shared/network/remote/dio_helper.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordStates> {
  ResetPasswordCubit() : super(InitialResetPasswordState());

  static ResetPasswordCubit get(context) => BlocProvider.of(context);

  ResetPasswordModel? resetPasswordModel;

  Future<void> resetPassword({
    required String email,
    required String password,
    required String token,
  }) async {
    emit(LoadingResetPasswordState());
    DioHelper.postData(methodUrl: RESET_PASSWORD, data: {
      "email": email,
      "password": password,
      "token": token, /// هلا رح يشتغل لانه ال email وال token  فاضين اللي مستخدمينهم لانه رحنا على هاي الشاشة دايركت ما مشيناا ستيبس
      /// عملت pass اي عشان نرجعه تاني مش بتاعي ههههههه
      /// 55
      /// بس المفروض يضرب  ويعطينا انه ال token  غلط
    }).then((value) {
      resetPasswordModel = ResetPasswordModel.fromJson(value.data);
      print('done');
      emit(SuccessResetPasswordState(resetPasswordModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ErrorResetPasswordState(error));
    });
  }
}
