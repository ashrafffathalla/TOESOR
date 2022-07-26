import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:toesor/models/facbook_model.dart';
import 'package:toesor/modules/fb_login/cubti/states.dart';
import 'package:toesor/shared/constance/constant.dart';
import 'package:toesor/shared/end_points.dart';
import 'package:toesor/shared/network/local/sharedprefrance.dart';
import '../../../shared/network/remote/dio_helper.dart';

class FacebookLoginCubit extends Cubit<FacebookStates> {
  FacebookLoginCubit() : super(InitialFacebookState());

  static FacebookLoginCubit get(context) => BlocProvider.of(context);

  bool isLoggedIn = false;
  Map userOpj = {};
  String ? firstName;
  String ? lastName;
  String ? email;
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

  void changeFirstName(String value) {
    firstName = value;
    emit(ChangeFirstNameState());
  }

  void changeLastName(String value) {
    lastName = value;
    emit(ChangeLastNameState());
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
        emit(SuccessFacebookState());
        changeFirstName(userOpj['name'].toString().split(' ')[0].toString());
        changeLastName(userOpj['name'].toString().split(' ')[1].toString());
      });
    }).then((value) {
      getAccessToken();
    }).catchError((error){
      emit(ErrorFacebookState(error.toString()));
    });
  }
  void changeToken(String token){
    endToken = token;
    print('end token is : $endToken');
    emit(ChangeEndTokenState());
  }

  Future<AccessToken?> getAccessToken() async {
    final AccessToken? accessToken = await FacebookAuth.instance.accessToken;
    changeToken(accessToken!.token.toString());
    return null;
  }
   getFacebookIMage(){
    userOpj["picture"]["data"]["url"].toString();
    print(userOpj["picture"]["data"]["url"].toString());
    emit(GetFacebookUserImageState());
  }
  FaceBookModel ? faceBookModel;

  Future<void> facebookLogin({
    required String token,
    required String name,
    required String email,
    required String firstName,
    required String lastName,
    required String picture,
  }) async {
    emit(LoadingFacebookAPIState());
      await DioHelper.getData(
          methodUrl: FB_LOGIN,
          query: {
      "name": name,
      "UserPic": picture,
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "access_token": token
    }).then((value) {
        faceBookModel = FaceBookModel.fromJson(value.data);
        print(faceBookModel!.success);
        print(faceBookModel!.token);
        print(firstName+" "+ lastName+'******************************');
        print(email+'******************************');
        sharedToken = faceBookModel!.token;
        CacheHelper.saveData(key: 'token', value: faceBookModel!.token);
      emit(SuccessFacebookAPIState(faceBookModel!));
    }).catchError((error) {
        print('**************');
        print(error.toString());
      emit(ErrorFacebookAPIState(error.toString()));
    });

  }


}
