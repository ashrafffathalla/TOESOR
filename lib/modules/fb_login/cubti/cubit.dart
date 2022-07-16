import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:toesor/modules/fb_login/cubti/states.dart';
import 'package:toesor/shared/end_points.dart';
import '../../../shared/network/remote/dio_helper.dart';

class FacebookLoginCubit extends Cubit<FacebookStates> {
  FacebookLoginCubit() : super(InitialFacebookState());

  static FacebookLoginCubit get(context) => BlocProvider.of(context);

  bool isLoggedIn = false;
  Map userOpj = {};
  AccessToken? token;

  String ? endToken;

  void changeLogin(bool value) {
    isLoggedIn = value;
    emit(IsLoginFacebookState());
  }

  void changeUserObject(Map<String, dynamic> object) {
    userOpj = object;
    emit(ChangeUserObjectState());
  }

  Future<void> logOut() async {
    await FacebookAuth.i.logOut().then((value) {
      changeLogin(false);
      changeUserObject({});
    });
  }

  Future<void> login() async {
    emit(LoadingFacebookState());
    FacebookAuth.instance
        .login(permissions: ["public_profile", "email"]).then((value) {
      FacebookAuth.instance.getUserData().then((value) {
        changeLogin(true);
        changeUserObject(value);
        getAccessToken();

        emit(SuccessFacebookState());
        //navigateTo(context, MapScreen());
      }).catchError((error) {
        print(error.toString());
        emit(ErrorFacebookState(error.toString()));
      });
    });
  }
  void changeToken(String token){
    endToken = token;
    print('end token is : ${endToken}');
    emit(ChangeEndTokenState());
  }

  Future<AccessToken?> getAccessToken() async {
    final AccessToken? accessToken = await FacebookAuth.instance.accessToken;
    changeToken(accessToken!.token.toString());

    return null;
  }

  Future<void> facebookLogin({
    required String token,
    required String name,
    required String email,
    required String firstName,
    required String lastName,
    required String picture,
  }) async {
    emit(LoadingFacebookAPIState());
    if(state is ! LoadingFacebookAPIState)
    DioHelper.getData(methodUrl: FB_LOGIN, query: {
      "name": name,
      "UserPic": picture,
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "access_token": token
    }).then((value) {
      print('**************');
      emit(SuccessFacebookAPIState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorFacebookAPIState(error));
    });
  }


}
