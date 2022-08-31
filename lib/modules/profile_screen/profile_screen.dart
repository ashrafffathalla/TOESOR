import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:toesor/modules/change_login_password/change_login_password_screen.dart';
import 'package:toesor/modules/mapScreen/map_screen.dart';
import 'package:toesor/modules/profile_screen/cubit/cubit.dart';
import 'package:toesor/modules/profile_screen/cubit/states.dart';
import 'package:toesor/shared/end_points.dart';
import 'package:toesor/shared/network/remote/dio_helper.dart';
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
  var formKey = GlobalKey<FormState>();
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
                                    backgroundImage:EditProfileCubit.get(context).image == null?
                                    const AssetImage('assets/images/profile_women.png')
                                        :FileImage(EditProfileCubit.get(context).image!)as ImageProvider,
                                  ),
                                  Positioned(
                                      bottom: 25.sp,
                                      right: 25.sp,
                                      child:InkWell(
                                        onTap: (){
                                          ///DO SOMETHING
                                         EditProfileCubit.get(context).getImage();
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
                                    return 'Scegli il tuo nikname';
                                  }
                                  return null;
                                },
                                label: 'nikname',

                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.07,
                            ),
                            GestureDetector(
                              child: defaultButton(
                                context,
                                function: () {
                                   if(formKey.currentState!.validate()){
                                     if(EditProfileCubit.get(context).finalImage != null){
                                       EditProfileCubit.get(context).uploadProfile(
                                         context: context,
                                           nickName:nameController.text.toString(),
                                           userPic: EditProfileCubit.get(context).finalImage,

                                       );
                                     }
                                   }
                                },

                                text: 'CONTINUA',
                                rounder: BorderRadius.circular(25),
                                background: const Color(0xff5BA57B),
                              ),
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
          ),
        );
      },
    );
  }

  void printFullText(String text) {
    final pattern = RegExp('.{1,800}');
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  File ? localImage;
  Future getImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
    final  fileName = basename(image.path);
    final File localImage =  image.path as File ;
      setState(() {
        this.image = imageTemporary;
        hasImage = true;
      });
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
  }
}