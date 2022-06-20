
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toesor/modules/login_screen/cubit/cubit.dart';
import 'package:toesor/modules/login_screen/cubit/states.dart';
import 'package:toesor/shared/components/components.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import '../../shared/components/custom_snackpar.dart';
import '../../shared/style/colors.dart';

class LoginScreen extends StatelessWidget {
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider<LoginCubit>(
      create:  (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context, state) {
          if (state is SuccessLoginState){
            if(state.loginModel.user!.status =='TRUE'){
              ScaffoldMessenger.of(context)
                  .showSnackBar(
                customSnackBar(
                  message: 'Welcome Back',
                  title: 'Success!',
                  type: ContentType.success,
                ),
              );
            }else {
              ScaffoldMessenger.of(context)
                  .showSnackBar(
                customSnackBar(
                  message:
                  'Email or Password is Wrong!',
                  title: 'Error Login Failed!',
                  type: ContentType.failure,
                ),
              );
            }
          }else if(state is ErrorLoginState){
            ScaffoldMessenger.of(context)
                .showSnackBar(
              customSnackBar(
                message:
                'Email or Password is Wrong!',
                title: 'Error Login Failed!',
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
                                      return 'Pleas enter your email address';
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
                                      return 'Pleas enter your Password';
                                    }
                                    return null;
                                  },
                                  label: '',
                                ),
                              ),
                              SizedBox(
                                height: size.height*0.04,
                              ),
                              defaultButton(
                                context,
                                background:const Color(0xff6A331D),
                                function: (){
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
                              SvgPicture.asset('assets/icons/o.svg'),
                              GestureDetector(
                                onTap: (){
                                  ///DO something
                                },
                                child: Image.asset('assets/images/facebook.png'),
                              ),
                              SizedBox(height: size.height*0.02,),
                              GestureDetector(
                                onTap: (){
                                  ///DO something
                                },
                                child: Image.asset(
                                  'assets/images/googel.png',

                                ),
                              ),
                              SizedBox(height: size.height*0.05,),
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
      ),
    );
  }
}
