import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toesor/modules/change_login_password/cubit/cubit.dart';
import 'package:toesor/modules/change_login_password/cubit/states.dart';
import 'package:toesor/shared/components/components.dart';

import '../../shared/components/custom_snackpar.dart';
import '../../shared/style/colors.dart';

class EditPasswordScreen extends StatelessWidget {
  var editPasswordController = TextEditingController();
  var confirmEditPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  EditPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<EditPasswordCubit,EditPasswordStates>(
      listener: (context, state) {
        if(state is SuccessEditPasswordState){
          if(state.editPasswordModel.statusCode == 204){
            ScaffoldMessenger.of(context)
                .showSnackBar(
              customSnackBar(
                message:'Ti abbiamo inviato un codice per reimpostare la tua password',
                title: '',
                type: ContentType.success,
              ),
            );
            //navigateAndFinish(context, EnterCodeScreen());
            //EditPasswordCubit.get(context).email = emailController.text.toString();
            editPasswordController.clear();
            confirmEditPasswordController.clear();
          }else{
            ScaffoldMessenger.of(context)
                .showSnackBar(
              customSnackBar(
                message: 'Indirizzo Email non trovato',
                title: 'Errore',
                type: ContentType.failure,
              ),
            );
          }
        }
      },
      builder:(context,state){
        EditPasswordCubit cubit = EditPasswordCubit.get(context);
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
                          physics:const BouncingScrollPhysics(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
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
                              SizedBox(height: size.height*0.05,),
                              SizedBox(
                                height: size.height*0.04,
                              ),
                              Center(
                                child: Text(
                                  'Edit your Password',
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 16.sp,
                                    fontFamily: 'Comfortaa',
                                    fontWeight: FontWeight.w700,

                                  ),
                                ),
                              ),
                              SizedBox(height: size.height*0.03,),
                              Row(
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.symmetric(
                                        horizontal: size.width*0.02),                                    child: Text(
                                    ' Password :',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontFamily: 'Comfortaa',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height*0.03,
                              ),
                              Padding(
                                padding:  EdgeInsets.symmetric(
                                    horizontal: size.width*0.02
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color:const Color(0xffFAF5EA),
                                      borderRadius: BorderRadius.circular(30)
                                  ),
                                  child: defaultFormField(
                                    context,
                                    controller: editPasswordController,
                                    type: TextInputType.text,
                                    validate: (value){
                                      if (value!.isEmpty) {
                                        return 'Inserisci il tuo indirizzo password';
                                      }
                                      return null;
                                    },
                                    label: '',

                                  ),
                                ),
                              ),
                              SizedBox(
                                height: size.height*0.025,
                              ),
                              Padding(
                                padding:  EdgeInsets.symmetric(
                                    horizontal: size.width*0.02
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color:const Color(0xffFAF5EA),
                                      borderRadius: BorderRadius.circular(35)
                                  ),
                                  child: defaultFormField(
                                    context,
                                    controller: confirmEditPasswordController,
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
                              ),
                              SizedBox(height: size.height*0.02,),
                              ///password

                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              SizedBox(
                                width: size.width*0.5,
                                child: defaultButton(
                                  context,
                                  function: (){
                                    if(formKey.currentState!.validate()){
                                  if(editPasswordController.text == confirmEditPasswordController.text) {
                                    cubit.editPassword(
                                      password: editPasswordController.text.toString(),
                                    );
                                  }else{
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
                                  text: 'Change',
                                  rounder: BorderRadius.circular(35),
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
    );
  }
}
