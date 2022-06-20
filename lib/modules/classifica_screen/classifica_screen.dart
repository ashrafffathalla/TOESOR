import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toesor/shared/components/components.dart';

import '../../shared/components/navigationbar/navigationbar.dart';
import '../../shared/style/colors.dart';

class ClassificaScreen extends StatelessWidget {
  const ClassificaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const NavigationDrawerScreen(),
      key: scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kAppbarColor,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: size.width * 0.01),
            child: Row(
              children: [
                Icon(
                  Icons.logout,
                  size: 33.sp,
                  color: const Color(0xffEEDEBA),
                ),
              ],
            ),
          ),
        ],
        leading: GestureDetector(
          onTap: () => scaffoldKey.currentState!.openDrawer(),
          child: Icon(
            Icons.menu,
            size: 33.sp,
            color: const Color(0xffEEDEBA),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: size.height*0.045,
            color:const Color(0XFF6A331D),
            child: Center(
              child: Text(
                'CLASSIFICA',
                style: TextStyle(
                  fontSize: 25.sp,
                  color: Colors.white,
                  fontWeight:FontWeight.w400,
                  fontFamily: 'Comfortaa',
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: size.height*0.04,
            color:const Color(0XFF905340),
            child: Center(
              child: Text(
                'Tarquinia - Corneto medievale',
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.white,
                  fontWeight:FontWeight.w500,
                  fontFamily: 'Comfortaa',
                ),
              ),
            ),
          ),
          ///ListView
         Expanded(
           child: ListView.separated(
             physics:const BouncingScrollPhysics(),
             shrinkWrap: true,
             scrollDirection: Axis.vertical,
               itemBuilder: (context, index) => buildClassificaList(context,size),
               separatorBuilder: (context, index) =>const SizedBox(),
               itemCount: 10,
           ),
         )

        ],
      ),
    );
  }
  buildClassificaList(context,size)=> Column(
    children: [
      Container(
        width: size.width,
        height: size.width*0.2,
        child: Row(
          children: [
            Container(
              child: Center(
                child: Text(
                  '1',
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Comfortaa'
                  ),
                ),
              ),
              color:const Color(0xffedddbb),
              width: size.width*0.1,
              height: size.width*0.2,
            ),
            Container(
              width: size.width*0.15,
              height: size.width*0.2,
              child: Center(
                child: Text(
                  '00:34:56',
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Comfortaa'
                  ),
                ),
              ),
              color:const Color(0xFFd8c195),
            ),
            Container(
              //width: size.width,
              child: Row(
                children: [
                  SizedBox(width: size.width*0.02,),
                  SizedBox(
                    child: Image.asset(
                      'assets/images/person.png',
                    ),
                    width: size.width*0.15,
                    height: size.height*0.15,
                  ),
                  SizedBox(width: size.width*0.05,),
                  Text(
                    'Maria',
                    style: TextStyle(
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Comfortaa'
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      myDividerTwo(context),
    ],
  );
}
