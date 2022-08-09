import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toesor/modules/change_login_password/change_login_password_screen.dart';
import 'package:toesor/modules/profile_screen/cubit/cubit.dart';
import 'package:toesor/modules/profile_screen/cubit/states.dart';
import 'package:toesor/shared/style/colors.dart';
import '../../shared/components/components.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool hasImage = false;
  File? image;

  final nameController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return BlocConsumer<EditProfileCubit,EditProfileStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        return  Scaffold(
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
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.1
                      ),
                      child: Column(
                        children: [
                          sizeBoxStart(context),
                          GestureDetector(
                            onTap: () {
                              //picImage();
                            },
                            child:Stack(
                              children: [
                                CircleAvatar(
                                  radius: 130.sp,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage:image == null?
                                  const AssetImage('assets/images/profile_women.png')
                                      :FileImage(image!)as ImageProvider,
                                ),
                                Positioned(
                                    bottom: 25.sp,
                                    right: 25.sp,
                                    child:InkWell(
                                      onTap: (){
                                        ///DO SOMETHING
                                        getImage(ImageSource.gallery);
                                      },
                                      child: CircleAvatar(
                                        radius: 30.sp,
                                        backgroundColor:kPopColor ,
                                        child: Icon(
                                          Icons.camera_alt,
                                          color: kPrimaryColor,
                                          size: 40.sp,
                                        ),
                                      ),
                                    )
                                ),
                              ],
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
                              EditProfileCubit.get(context).editProfile(
                                nickName: nameController.text.toString(),
                                userPic: image,
                              );
                            },

                            text: 'CONTINUA',
                            rounder: BorderRadius.circular(25),
                            background: const Color(0xff5BA57B),
                          ),
                          SizedBox(
                            height: size.height*0.05,
                          ),
                          TextButton(
                              onPressed: ()
                                {
                                navigateTo(context, EditPasswordScreen());
                                },
                              child:Text(
                                'Modifica password',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16.sp,
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
      },
    );
  }


  Future getImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
        hasImage = true;
      });
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
  }
}