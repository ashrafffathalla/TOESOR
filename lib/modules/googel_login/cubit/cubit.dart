import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:toesor/modules/googel_login/cubit/states.dart';
import 'package:toesor/shared/network/remote/dio_helper.dart';
import '../../../models/google_login_model.dart';
import '../../../shared/constance/constant.dart';
import '../../../shared/end_points.dart';
import '../../../shared/network/local/sharedprefrance.dart';

class GoogleCubit extends Cubit<GoogleStates> {
  GoogleCubit() : super(InitialGoogleState());

  static GoogleCubit get(context) => BlocProvider.of(context);

  bool isLoggedIn = false;
  GoogleSignInAccount ? userOpj;
  String? firstName;
  String? lastName;
  String? token;
  String? endToken;


  ///Start Change Login
  void changeLogin(bool value) {
    isLoggedIn = value;
    emit(IsLoginGoogleState());
  }

  ///End Change Login

  /// changeUserObject
  void changeUserObject(GoogleSignInAccount object) {
    userOpj = object;
    emit(ChangeUserObjectState());
  }

  ///End changeUserObject
  void changeGoogleFirstName(String value) {
    firstName = value;
    emit(ChangeGoogleFirstNameState());
  }

  void changeGoogleLastName(String value) {
    lastName = value;
    emit(ChangeGoogleLastNameState());
  }
  /// LOGIN GOOGLE

  GoogleSignIn googleSignIn = GoogleSignIn();

  Future<void> googleLogin() async {
    emit(LoadingGoogleState());
    googleSignIn.signIn().then((value) {
      changeLogin(true);
       getGoogleAccessToken();
      changeUserObject(value!);

      emit(SuccessGoogleState());
      changeGoogleFirstName(userOpj!.displayName.toString().split(' ')[0].toString());
      changeGoogleLastName(userOpj!.displayName.toString().split(' ')[1].toString());
    }).then((value) {

    }).catchError((error) {
      print(error.toString());
      emit(ErrorGoogleState(error.toString()));
    });
  }

  ///END GOOGLE SIGN IN

  ///Access Token
  void changeToken(String token) {
    endToken = token;
   // print('end token is : $endToken');
    emit(ChangeEndTokenGoogleState());
  }

  Future<GoogleSignInAccount?> getGoogleAccessToken() async {
    await googleSignIn.signIn().then((value) {
      final token = value!.authentication.then((googleKey) {
        //print(googleKey.accessToken);
        changeToken(googleKey.accessToken.toString());


      });

      return null;
    });
  }

  /// Google Login Send Data To API
  GoogleModel? googleModel;

  Future<void> googleLoginAPI({
    required String name,
    required String picture,
    required String firstName,
    required String lastName,
    required String email,
    required String token,

})async{
    emit(LoadingGoogleAPIState());
    await DioHelper.getData(
        methodUrl: GOOGLE_LOGIN,
      query: {
        "name": name,
        "UserPic": picture,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "access_token": token
      }).then((value){
        googleModel = GoogleModel.fromJson(value.data);
        print(googleModel!.success);
        print('********************* google model token here ***************');
        print(googleModel!.token);
        print(firstName+" "+ lastName+'******************************');
        sharedToken = googleModel!.token;
        CacheHelper.saveData(key: 'token', value: googleModel!.token);
    }).catchError((error){
      print(error.toString());
      emit(ErrorGoogleAPIState(error.toString()));
    });
  }
}
