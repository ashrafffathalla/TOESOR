
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toesor/modules/fb_login/cubti/states.dart';
import 'package:toesor/modules/googel_login/cubit/cubit.dart';
import 'package:toesor/modules/googel_login/cubit/states.dart';
import 'package:toesor/modules/googel_login/googel_login_screen.dart';
import 'package:toesor/modules/login_screen/cubit/cubit.dart';
import 'package:toesor/modules/login_screen/cubit/states.dart';
import 'package:toesor/modules/mapScreen/map_screen.dart';
import 'package:toesor/modules/profile_screen/profile_screen.dart';
import 'package:toesor/modules/sign_up/sign_up_screen.dart';
import 'package:toesor/shared/components/components.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:toesor/shared/constance/constant.dart';
import 'package:toesor/shared/network/local/sharedprefrance.dart';
import '../../shared/components/custom_snackpar.dart';
import '../../shared/style/colors.dart';
import '../fb_login/cubti/cubit.dart';
import '../resete_password/enter_email/enter_email.dart';
import '../resete_password/reset_password/reset_password.dart';

class LoginScreen extends StatelessWidget {
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<LoginCubit,LoginStates>(
      listener: (context, state) {
        if (state is SuccessLoginState){
          CacheHelper.saveData(
              key: 'name',
              value: state.loginModel.user!.NickName
          );
          CacheHelper.saveData(
              key: 'typeOfLogin',
              value: true
          );
          CacheHelper.saveData(
              key: 'pic',
              value: state.loginModel.user!.UserPic,
          );
         if(state.loginModel.code=='422'){
           print(state.loginModel.code.toString());
          ScaffoldMessenger.of(context)
              .showSnackBar(
            customSnackBar(
              message: 'Password Errata',
              title: 'Errore',
              type: ContentType.failure,
              //geniusdeveloper2000@gmail.com
              //MAster2020@@
            ),

          );
        }
         else if(state.loginModel.code=='432'){
           print(state.loginModel.code.toString());
           ScaffoldMessenger.of(context)
               .showSnackBar(
             customSnackBar(
               message: 'Account non trovato',
               title: 'Errore',
               type: ContentType.failure,
             ),

           );
         }

          if(state.loginModel.user?.status =='TRUE'){
            CacheHelper.saveData(
              key: 'token',
              value: state.loginModel.token.toString(),
            );
            sharedToken = state.loginModel.token.toString();
            //print(sharedToken.toString());
            ScaffoldMessenger.of(context)
                .showSnackBar(
              customSnackBar(
                message: '',
                title: 'Successo',
                type: ContentType.success,
              ),

            );
            navigateAndFinish(context, MapScreen());
            clearController();

          }else if(state.loginModel.user?.status =='FALSE'){
            ScaffoldMessenger.of(context)
                .showSnackBar(
              customSnackBar(
                message: 'Il tuo account è stato bloccato',
                title: 'Errore',
                type: ContentType.failure,
              ),

            );
          }
        }
        if( state is ErrorLoginState){
          ScaffoldMessenger.of(context)
              .showSnackBar(
            customSnackBar(
              message: 'Account non trovato',
              title: 'Errore',
              type: ContentType.failure,
            ),
          );
        }
      },
      builder: (context,state){
        LoginCubit cubit = LoginCubit.get(context);
        return Form(
          key: formKey,
          child: Scaffold(
            backgroundColor: kPrimaryColor,
            body: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/background.png',
                              ),
                              fit: BoxFit.cover,
                            )),
                      )),
                  Positioned(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                        ),
                      )),
                  Positioned(
                    child: Padding(
                      padding:EdgeInsets.symmetric(horizontal: size.width*0.15),
                      child: SingleChildScrollView(
                        physics:const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            sizeBoxStart(context),
                            Center(
                              child: SizedBox(
                                width: size.width * 0.6,
                                child: Image.asset(
                                  'assets/images/login_logo.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height*0.04,
                            ),
                            Row(
                              children: [
                                Text(
                                  'LOGIN',
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontFamily: 'Comfortaa',
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: size.height*0.05,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Email :',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontFamily: 'Comfortaa',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.height*0.03,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color:const Color(0xffFAF5EA),
                                  borderRadius: BorderRadius.circular(35)
                              ),
                              child: defaultFormField(
                                context,
                                controller: emailController,
                                type: TextInputType.emailAddress,
                                validate: (value){
                                  if (value!.isEmpty) {
                                    return 'Inserisci il tuo indirizzo Email';
                                  }else if( !(isEmail(value.toString())))  {
                                    return 'Indirizzo Email non è valido';
                                  }
                                  return null;
                                },
                                label: '',

                              ),
                            ),
                            SizedBox(height: size.height*0.03,),
                            Row(
                              children: [
                                Text(
                                  'Password :',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontFamily: 'Comfortaa',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.height*0.02,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color:const Color(0xffFAF5EA),
                                  borderRadius: BorderRadius.circular(35)
                              ),
                              child: defaultFormField(
                                context,
                                isPassword: true,
                                controller: passwordController,
                                type: TextInputType.visiblePassword,
                                validate: (value){
                                  if (value!.isEmpty) {
                                    return 'Inserisci La tua password';
                                  }
                                  return null;
                                },
                                label: '',
                              ),
                            ),
                            SizedBox(
                              height: size.height*0.04,
                            ),
                            ConditionalBuilder(
                              condition: state is ! LoadingLoginState,
                              builder: (context)=>defaultButton(
                                context,
                                background:const Color(0xff6A331D),
                                function: (){
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  if(formKey.currentState!.validate()){
                                    cubit.loginUser(
                                      email: emailController.text.toString(),
                                      password: passwordController.text.toString(),
                                    );
                                  }
                                },
                                text: 'Login',
                                rounder: BorderRadius.circular(35),
                              ),
                              fallback: (context)=>const Center(child: CircularProgressIndicator(color: Colors.orangeAccent,)),
                            ),
                            SizedBox(height: size.width*0.04,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    navigateTo(context, EnterEmailScreen());
                                  },
                                  child: Text(
                                    'Recupera password',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontFamily: 'Comfortaa',
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){

                                    navigateTo(context, SignUpScreen());
                                  },
                                  child: Text(
                                    'Registrati',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: 'Comfortaa',
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SvgPicture.asset('assets/icons/o.svg'),
                            BlocConsumer<FacebookLoginCubit,FacebookStates>(
                              listener: (context,state){
                                FacebookLoginCubit facebookCubit = FacebookLoginCubit.get(context);
                                if(state is SuccessFacebookState){
                                  facebookCubit.facebookLogin(
                                      token: facebookCubit.endToken.toString(),
                                      name: facebookCubit.userOpj["name"].toString(),
                                      email: facebookCubit.userOpj["email"].toString(),
                                      firstName: facebookCubit.firstName.toString(),
                                      lastName: facebookCubit.lastName.toString(),
                                      picture: facebookCubit.userOpj["picture"]["data"]["url"]).then((value) {
                                    CacheHelper.saveData(
                                        key: 'pic',
                                        value: facebookCubit.userOpj["picture"]["data"]["url"]
                                    );
                                    CacheHelper.saveData(
                                        key: 'typeOfLogin',
                                        value: false
                                    );
                                    CacheHelper.saveData(
                                        key: 'name',
                                        value: facebookCubit.userOpj["name"]
                                    );
                                        navigateAndFinish(context, MapScreen());
                                  });
                                }
                              },
                              builder: (context,state){
                                FacebookLoginCubit facebookCubit = FacebookLoginCubit.get(context);
                                return GestureDetector(
                                  onTap: (){
                                    facebookCubit.login();
                                  },
                                  child: Image.asset('assets/images/facebook.png'),
                                );
                              },
                            ),
                            SizedBox(height: size.height*0.02,),
                            BlocConsumer<GoogleCubit,GoogleStates>(
                              listener: (context, state) {
                                if(state is ChangeEndTokenGoogleState){
                                  GoogleCubit.get(context).googleLoginAPI(
                                      token: GoogleCubit.get(context).endToken.toString(),
                                      name: GoogleCubit.get(context).userOpj!.displayName.toString(),
                                      email: GoogleCubit.get(context).userOpj!.email.toString(),
                                      firstName: GoogleCubit.get(context).firstName.toString(),
                                      lastName: GoogleCubit.get(context).lastName.toString(),
                                      picture: GoogleCubit.get(context).userOpj!.photoUrl.toString()).then((value) {
                                        CacheHelper.saveData(
                                            key: 'pic',
                                            value: GoogleCubit.get(context).userOpj!.photoUrl.toString()
                                        );
                                        CacheHelper.saveData(
                                            key: 'name',
                                            value: GoogleCubit.get(context).userOpj!.displayName.toString()
                                        );
                                        CacheHelper.saveData(
                                            key: 'typeOfLogin',
                                            value: false
                                        );
                                    navigateAndFinish(context, MapScreen());
                                  });
                                }
                              },
                              builder: (context, state) {
                                return GestureDetector(
                                  onTap: (){
                                    ///DO something
                                  GoogleCubit.get(context).googleLogin();
                                  },
                                  child: Image.asset('assets/images/googel.png',),
                                );
                              },
                            ),
                            SizedBox(height: size.height*0.01,),

                            SizedBox(height: size.height*0.02,),
                            Center(
                              child: Image.asset(
                                'assets/images/footer.png',
                                fit: BoxFit.cover,
                              ),
                            ),

                            SizedBox(height: size.height*0.05,),

                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  void clearController(){
    emailController.clear();
    passwordController.clear();
  }
}
