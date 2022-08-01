import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toesor/modules/login_screen/login_screen.dart';
import 'package:toesor/modules/resete_password/enter_email/cubit/cubit.dart';
import 'package:toesor/modules/resete_password/reset_password/cubit/cubit.dart';
import 'package:toesor/modules/resete_password/reset_password/states/states.dart';
import 'package:toesor/shared/style/colors.dart';
import '../../../shared/components/components.dart';
import '../../../shared/components/custom_snackpar.dart';

class ResetPasswordScreen extends StatelessWidget {
   ResetPasswordScreen({Key? key}) : super(key: key);
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context)=>ResetPasswordCubit(),
      child: BlocConsumer<ResetPasswordCubit,ResetPasswordStates>(
        listener: (context, state) {
          if(state is SuccessResetPasswordState){
            if(state.resetPasswordModel.code == 200){
              ScaffoldMessenger.of(context)
                  .showSnackBar(
                customSnackBar(
                  message: state.resetPasswordModel.message!,
                  title: 'Success!',
                  type: ContentType.success,
                ),
              );
              navigateAndFinish(context, LoginScreen());
              clearController();
            } else {
              ScaffoldMessenger.of(context)
                  .showSnackBar(
                customSnackBar(
                  message: '',
                  title: 'Error!',
                  type: ContentType.failure,
                ),
              );
            }

          }else if(state is ErrorResetPasswordState){
            ScaffoldMessenger.of(context)
                .showSnackBar(
              customSnackBar(
                message: '',
                title: 'Error!',
                type: ContentType.failure,
              ),
            );
          }
        },
        builder:(context,state){
          ResetPasswordCubit cubit = ResetPasswordCubit.get(context);
          return Form(
            key: formKey,
            child: Scaffold(
              body: Scaffold(
                backgroundColor: kPrimaryColor,
                body: Stack(
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
                        child:Padding(
                          padding: EdgeInsets.symmetric(horizontal: size.width*0.1),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Reset your Password ',
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 20.sp,
                                  fontFamily: 'Comfortaa',
                                  fontWeight: FontWeight.w600,

                                ),
                              ),
                              SizedBox(height: size.height*0.02,),
                              Row(
                                children: [
                                  Text(
                                    ' Password :',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontFamily: 'Comfortaa',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height*0.01,
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
                                  type: TextInputType.text,
                                  validate: (value){
                                    if (value!.isEmpty) {
                                      return 'Pleas enter your password';
                                    }
                                    return null;
                                  },
                                  label: '',

                                ),
                              ),
                              SizedBox(height: size.height*0.02,),
                              ///password
                              Row(
                                children: [
                                  Text(
                                    ' Confirm Password :',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontFamily: 'Comfortaa',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height*0.01,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color:const Color(0xffFAF5EA),
                                    borderRadius: BorderRadius.circular(35)
                                ),
                                child: defaultFormField(
                                  context,
                                  isPassword: true,
                                  controller: confirmPasswordController,
                                  type: TextInputType.text,
                                  validate: (value){
                                    if (value!.isEmpty) {
                                      return 'Pleas enter your Confirm Password';
                                    }
                                    return null;
                                  },
                                  label: '',

                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              SizedBox(
                                width: size.width*0.5,
                                child: defaultButton(
                                  context,
                                  function: (){
                                    if(formKey.currentState!.validate()){
                                      if(passwordController.text == confirmPasswordController.text){
                                        cubit.resetPassword(
                                         email:
                                         EnterEmailCubit.get(context).email.toString(),
                                         password: passwordController.text.toString(),
                                         token:
                                         EnterEmailCubit.get(context).code.toString(),
                                       );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          customSnackBar(
                                            message: 'The password is not matching',
                                            title: 'Error!',
                                            type: ContentType.warning,
                                          ),
                                        );
                                      }
                                    }
                                  },
                                  text: 'Submit',
                                  rounder: BorderRadius.circular(12),
                                ),
                              )
                            ],
                          ),
                        )
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
   bool isEmail(String em) {

     String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

     RegExp regExp =  RegExp(p);

     return regExp.hasMatch(em);
   }

  void clearController() {
    passwordController.clear();
    confirmPasswordController.clear();
  }
}
