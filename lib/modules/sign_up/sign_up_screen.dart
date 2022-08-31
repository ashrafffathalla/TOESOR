import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toesor/modules/login_screen/login_screen.dart';
import 'package:toesor/modules/sign_up/cubit/cubit.dart';
import 'package:toesor/modules/sign_up/cubit/states.dart';

import '../../shared/components/components.dart';
import '../../shared/components/custom_snackpar.dart';
import '../../shared/style/colors.dart';
import '../resete_password/enter_email/enter_email.dart';

class SignUpScreen extends StatelessWidget {

   SignUpScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context)=>SignUpCubit(),
      child: BlocConsumer<SignUpCubit,SignUpStates>(
        listener: (context, state) {
          if(state is SuccessSignUpState){
            ScaffoldMessenger.of(context)
                .showSnackBar(
              customSnackBar(
                message: 'Account registrato con successo',
                title: '',
                type: ContentType.success,
              ),
            );
            navigateAndFinish(context, LoginScreen());
          }if(state is ErrorSignUpState){
            ScaffoldMessenger.of(context)
                .showSnackBar(
              customSnackBar(
                message: 'Email già registrato',
                title: 'Errore',
                type: ContentType.failure,
              ),
            );
          }

        },
        builder: (context, state) {
          SignUpCubit cubit = SignUpCubit.get(context);
          return  Form(
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
                                    'SIGN UP',
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
                                    'Nome :',
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
                                  controller: firstNameController,
                                  type: TextInputType.text,
                                  validate: (value){
                                    if (value!.isEmpty) {
                                      return 'Nome';
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
                                    'Cognome :',
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
                                  controller: lastNameController,
                                  type: TextInputType.text,
                                  validate: (value){
                                    if (value!.isEmpty) {
                                      return 'Cognome';
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
                                      return 'E-mail';
                                    }else if( !(isEmail(value.toString())))  {
                                      return "L'email non è valida";
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
                                      return 'per favore inserisci LA TUA password';
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
                                condition: state is ! LoadingSignUpState,
                                builder: (context)=>defaultButton(
                                  context,
                                  background:const Color(0xff6A331D),
                                  function: (){
                                    FocusManager.instance.primaryFocus?.unfocus();
                                    if(formKey.currentState!.validate()){
                                      cubit.signUp(
                                        name: firstNameController.text.toString(),
                                        lastName: lastNameController.text.toString(),
                                        email: emailController.text.toString(),
                                        password: passwordController.text.toString(),
                                      );
                                    }
                                  },
                                  text: 'sign up',
                                  rounder: BorderRadius.circular(35),
                                ),
                                fallback: (context)=>const Center(
                                  child: CircularProgressIndicator(color: Colors.orangeAccent,),
                                ),
                              ),

                              SizedBox(height: size.height*0.01,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Hai un account?',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontFamily: 'Comfortaa',
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      navigateAndFinish(context, LoginScreen());
                                    },
                                    child: Text(
                                      'Accedi',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        color: kPrimaryColor,
                                        fontFamily: 'Comfortaa',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
      ),
    );
  }
}
