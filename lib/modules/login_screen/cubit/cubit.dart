import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toesor/models/login_model.dart';
import 'package:toesor/modules/login_screen/cubit/states.dart';
import 'package:toesor/shared/end_points.dart';
import 'package:toesor/shared/network/remote/dio_helper.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit() : super (InitialLoginState());

  static LoginCubit get(context)=> BlocProvider.of(context);

LoginModel? loginModel;
  Future<void> loginUser({
  required String email,
  required String password,
})async{
    emit(LoadingLoginState());
    DioHelper.postData(
        methodUrl: LOGIN,
        data: {
          "email": email,
          "password": password,
        }
    ).then((value) {
      loginModel = LoginModel.fromJson(value.data);
     // print('Sucersss');
       emit(SuccessLoginState(loginModel!));
    }).catchError((error) {
      emit(ErrorLoginState(error));
     // print(error.toString());
    });
}

}