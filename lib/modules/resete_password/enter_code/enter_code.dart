import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toesor/modules/login_screen/login_screen.dart';
import 'package:toesor/modules/resete_password/enter_code/cubit/cubit.dart';
import 'package:toesor/modules/resete_password/enter_code/cubit/states.dart';
import 'package:toesor/modules/resete_password/enter_email/cubit/cubit.dart';
import 'package:toesor/shared/constance/pin_code.dart';
import 'package:toesor/shared/style/colors.dart';
import '../../../shared/components/components.dart';
import '../../../shared/components/custom_snackpar.dart';

class EnterCodeScreen extends StatelessWidget {
  EnterCodeScreen({Key? key}) : super(key: key);
  var codeController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context)=>EnterCodeCubit(),
      child: BlocConsumer<EnterCodeCubit,EnterCodeStates>(
        listener: (context, state) {
          if(state is SuccessEnterCodeState){
            if(state.enterCodeModel.code == 200){
            ScaffoldMessenger.of(context)
                .showSnackBar(
              customSnackBar(
                message:' Green icon',
                title: ' Green icon!',
                type: ContentType.success,
              ),
            );
            navigateAndFinish(context, LoginScreen());
            EnterEmailCubit.get(context).code = codeController.text.toString();
            codeController.clear();
            }else{
              ScaffoldMessenger.of(context)
                  .showSnackBar(
                customSnackBar(
                  message: 'Codice non è valido',
                  title: 'Errore',
                  type: ContentType.failure,
                ),
              );
            }
          }
        },
        builder:(context,state){
          EnterCodeCubit cubit = EnterCodeCubit.get(context);
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
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                sizeBoxStart(context),
                                sizeBoxStart(context),
                                sizeBoxStart(context),
                                Text(
                                  'inserisci il codice ',
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 20.sp,
                                    fontFamily: 'Comfortaa',
                                    fontWeight: FontWeight.w600,

                                  ),
                                ),
                                SizedBox(height: size.height*0.03,),
                                Padding(
                                  padding:  EdgeInsets.symmetric(
                                    horizontal: size.width*0.1
                                  ),
                                  child: Row(
                                    children:  [
                                      PinCode()
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: size.height*0.01,
                                ),

                                SizedBox(height: size.height*0.02,),
                                SizedBox(
                                  height: size.height * 0.03,
                                ),
                                SizedBox(
                                  width: size.width*0.5,
                                  child: defaultButton(
                                    context,
                                    function: (){
                                      if(formKey.currentState!.validate()){
                                        cubit.enterCode(
                                            token: codeController.text.toString(),
                                        );
                                      }
                                    },
                                    text: 'inviare',
                                    rounder: BorderRadius.circular(35.sp),
                                  ),
                                ),
                                SizedBox(height: size.height*0.18,),
                                Center(
                                  child: Image.asset(
                                    'assets/images/footer.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
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


}
