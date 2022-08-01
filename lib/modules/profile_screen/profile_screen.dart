import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toesor/modules/change_login_password/change_login_password_screen.dart';
import 'package:toesor/shared/constance/logout.dart';
import 'package:toesor/shared/style/colors.dart';
import '../../shared/components/components.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? imageFile;
  final nameController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
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
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                )),
            Positioned(
              child:
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                  child: Column(
                    children: [
                      sizeBoxStart(context),
                      GestureDetector(
                        onTap: () {
                          //picImage();
                          showDialog(
                              context: context,
                              builder: (context){
                                return Dialog(
                                  backgroundColor: kPopColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Container(
                                    height: size.height/5,
                                    width: size.width*0.9,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Will Upload Images ",
                                          style: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Comfortaa',
                                          ),
                                        ),
                                    ]
                                    ),
                                  ),
                                );
                              }
                          );
                        },
                        child: Image.asset(
                          'assets/images/profile.png',
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Row(
                        children: [
                          Text(
                            'Scegli il tuo nikname',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color:const Color(0xffFAF5EA),
                            borderRadius: BorderRadius.circular(35)
                        ),
                        child: defaultFormField(
                          context,
                          controller: nameController,
                          type: TextInputType.name,
                          validate: (value){
                            if (value!.isEmpty) {
                              return 'Pleas enter your name';
                            }
                            return null;
                          },
                          label: 'nikname',

                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.07,
                      ),
                      defaultButton(
                        context,
                        function: () {
                          signOut(context);
                          ///TODO
                        },

                        text: 'CONTINUA',
                        rounder: BorderRadius.circular(25),
                        background: const Color(0xff5BA57B),
                      ),
                      SizedBox(
                        height: size.height*0.05,
                      ),
                      TextButton(
                        onPressed: (){
                          navigateTo(context, EditPasswordScreen());
                        },
                        child:Text(
                        'Edit Password',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16.sp
                        ),
                      )
                      ),
                    ],
                  ),
                ),
              ),)
          ],

        ),
      ),
    );
  }

  void picImage() async
  {
    var image = await ImagePicker.platform.pickImage(
        source: ImageSource.camera);
    setState(() {
      imageFile = image as File?;
    });
  }
}