import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toesor/modules/Corneto_medievale_screen/Corneto_medievale_screen.dart';
import 'package:toesor/modules/Corneto_medievale_two/Corneto_medievale_Two.dart';
import 'package:toesor/modules/classifica_screen/classifica_screen.dart';
import 'package:toesor/modules/confirm_map_one_screen/confirm_map_one.dart';
import 'package:toesor/modules/confirm_map_three/confirm_map_three.dart';
import 'package:toesor/modules/confirm_map_two/confirm_map_two.dart';
import 'package:toesor/modules/gioca_screen/gioca_screen.dart';
import 'package:toesor/modules/login_screen/login_screen.dart';
import 'package:toesor/modules/mapScreen/map_screen.dart';
import 'package:toesor/modules/map_dialogbox/map_dialogbox.dart';
import 'package:toesor/modules/profile_screen/profile_screen.dart';
import 'package:toesor/modules/sidebar_screen/sidebar_screen.dart';
import 'package:toesor/modules/time_screen/time_screen.dart';
import 'package:toesor/modules/vaucher_screen/vaucher_screen.dart';
import 'package:toesor/shared/components/components.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Column(
          children: [
            sizeBoxStart(context),
            const Center(child: Text(
                'Test Screen',
              style: TextStyle(
                fontSize: 20,
              ),
            )) ,
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: (){
                navigateTo(context, LoginScreen());
              },
              child: ClipPath(
                clipper: SideCutClipper(),
                child: Container(
                  color: Colors.red,
                  height: 50,
                  width: 200,
                  child:const Center(
                    child: Text(
                      'Screen',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: (){
                navigateTo(context,const ProfileScreen());
              },
              child: Container(
                color: Colors.red,
                height: 50,
                width: 200,
                child:const Center(
                  child: Text(
                    'Screen ',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: (){
                navigateTo(context,const SidebarScreen());
              },
              child: Container(
                color: Colors.red,
                height: 50,
                width: 200,
                child:const Center(
                  child: Text(
                    'Screen ',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: (){
                navigateTo(context,const CornetoMedievaleScreenTwo());
              },
              child: Container(
                color: Colors.red,
                height: 50,
                width: 200,
                child:const Center(
                  child: Text(
                    'Screen ',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: (){
                navigateTo(context,const MapScreen());
              },
              child: Container(
                color: Colors.red,
                height: 50,
                width: 200,
                child:const Center(
                  child: Text(
                    'Screen ',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: (){
                navigateTo(context, CornetoMedievaleScreen());
              },
              child: CustomPaint(
                child: Container(
                  color: Colors.red,
                  height: 50,
                  width: 200,
                  child:const Center(
                    child: Text(
                      'Screen ',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: (){
                navigateTo(context,const MapWithDialogAlertScreen());
              },
              child: CustomPaint(
                child: Container(
                  color: Colors.red,
                  height: 50,
                  width: 200,
                  child:const Center(
                    child: Text(
                      'Map With Dialog alert ',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: (){
                navigateTo(context,const ConfirmMapThree());
              },
              child: CustomPaint(
                child: Container(
                  color: Colors.red,
                  height: 50,
                  width: 200,
                  child:const Center(
                    child: Text(
                      'Map ',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: (){
                navigateTo(context,const ConfirmMapOne());
              },
              child: CustomPaint(
                child: Container(
                  color: Colors.red,
                  height: 50,
                  width: 200,
                  child:const Center(
                    child: Text(
                      'Map ',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: (){
                navigateTo(context,const ConfirmMapTwo());
              },
              child: CustomPaint(
                child: Container(
                  color: Colors.red,
                  height: 50,
                  width: 200,
                  child:const Center(
                    child: Text(
                      'Map',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: (){
                navigateTo(context,const GiocaScreen());
              },
              child: CustomPaint(
                child: Container(
                  color: Colors.red,
                  height: 50,
                  width: 200,
                  child:const Center(
                    child: Text(
                      'screen',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: (){
                navigateTo(context,const VaucherScreen());
              },
              child: Container(
                color: Colors.red,
                height: 50,
                width: 200,
                child:const Center(
                  child: Text(
                    'screen',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: (){
                navigateTo(context,const ClassificaScreen());
              },
              child: Container(
                color: Colors.red,
                height: 50,
                width: 200,
                child:const Center(
                  child: Text(
                    'screen',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: (){
                navigateTo(context,const TimeScreen());
              },
              child: Container(
                color: Colors.red,
                height: 50,
                width: 200,
                child:const Center(
                  child: Text(
                    'screen',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
 Widget buildTimeCard({
  required String time,
   required String header,
})=>Container(
   color: Colors.red,
  child:Text(
     time,
    style: TextStyle(
        fontSize: 36.sp,
        fontWeight: FontWeight.w400,
        fontFamily: 'Comfortaa'
    ),

   ),
);
}


