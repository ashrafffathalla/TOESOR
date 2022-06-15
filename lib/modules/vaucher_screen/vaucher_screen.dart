import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toesor/shared/components/components.dart';

import '../../shared/components/navigationbar/navigationbar.dart';
import '../../shared/style/colors.dart';

class VaucherScreen extends StatefulWidget {
  const VaucherScreen({Key? key}) : super(key: key);

  @override
  State<VaucherScreen> createState() => _VaucherScreenState();
}

class _VaucherScreenState extends State<VaucherScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

        appBar: AppBar(
          elevation: 0,
          backgroundColor: kAppbarColor,
          title: Center(
            child: SvgPicture.asset(
              'assets/icons/titel_bar.svg',
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: size.width * 0.01),
              child: Icon(
                Icons.logout,
                size: 33.sp,
                color: const Color(0xffEEDEBA),
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
        body:Scaffold(
          backgroundColor: Colors.white,
          key: scaffoldKey,
          drawer: const NavigationDrawerScreen(),
          body:  Stack(
            children: [
              Positioned(
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.asset(
                    'assets/images/stack.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      ///Start container have white color
                      Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                        child: Container(
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.05),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                Center(
                                  child: Image.asset(
                                    'assets/images/bor_girl.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.03,
                                ),
                                Text(
                                  'HAI VINTO!',
                                  style: TextStyle(
                                    fontFamily: 'Comfortaa',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30.sp,
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.02,
                                ),
                                myDivider(context),
                                SizedBox(
                                  height: size.height * 0.02,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'il tuo tempo è:',
                                      style: TextStyle(
                                        fontFamily: 'Comfortaa',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 22.sp,
                                      ),
                                    ),
                                    Text(
                                      '00:34:45',
                                      style: TextStyle(
                                        fontFamily: 'Comfortaa',
                                        color: const Color(0xff6A331D),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 22.sp,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 0.02,
                                ),
                                myDivider(context),
                                SizedBox(
                                  height: size.height * 0.02,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'sei arrivato',
                                      style: TextStyle(
                                        fontFamily: 'Comfortaa',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 22.sp,
                                      ),
                                    ),
                                    Text(
                                      '7° su 97',
                                      style: TextStyle(
                                        fontFamily: 'Comfortaa',
                                        color: const Color(0xff6A331D),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 22.sp,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 0.02,
                                ),
                                Container(
                                  width: size.width * 0.3,
                                  height: size.height * 0.045,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffB68B6E),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'CLASSIFICA',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Comfortaa',
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.03,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      ///Start container have  list  view horizontal
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0XFFD8C194),
                        ),
                        child: Column(
                          children: [
                            brownDivider(context),
                            SizedBox(height: size.height*0.02,),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: size.width*0.05),
                              child: Row(
                                children: [
                                  Text(
                                    'VAUCHER',
                                    style: TextStyle(
                                      color:const Color(0xff6A331D),
                                      fontFamily: 'Comfortaa',
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: size.height*0.02,),
                            SizedBox(
                              height: 185,
                              child: ListView.separated(
                                physics:const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => buildVaucherList(size),
                                separatorBuilder: (context, index) =>SizedBox(
                                  width: size.width*0.02,
                                ),
                                itemCount: 5,
                              ),
                            ),
                            brownDivider(context),
                            SizedBox(height: size.height*0.01,),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: size.width*0.05),
                              child: Row(
                                children: [
                                  Text(
                                    'NELLE VICINANZE',
                                    style: TextStyle(
                                      color:const Color(0xff6A331D),
                                      fontFamily: 'Comfortaa',
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: size.height*0.02,),
                            SizedBox(
                              height: 190,
                              child: ListView.separated(
                                physics:const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => buildTextList(size),
                                separatorBuilder: (context, index) =>SizedBox(
                                  width: size.width*0.02,
                                ),
                                itemCount: 5,
                              ),
                            ),

                            SizedBox(height: size.height*0.02,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }

  /// Start build Widget image with text horizontal list
  Widget buildVaucherList(size) => Column(
        children: [
          Row(
            children: [
              Container(
                width: size.width * 0.47,
                decoration: BoxDecoration(
                  color:const Color(0xff6A331D),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.05,
                          vertical: size.height * 0.01),
                      child: Text(
                        'Cioccio panino',
                        style: TextStyle(
                          fontFamily: 'Comfortaa',
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                    Container(
                        width: size.width * 0.47,
                      child: ClipRRect(
                        borderRadius:const BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                        child:Image.asset(
                            'assets/images/pizza.png',
                          width: size.width * 0.47,
                             fit: BoxFit.cover,
                        ),
                      )),
                    // Image.asset(
                    //   'assets/images/pizza.png',
                    //   width: size.width * 0.47,
                    //   fit: BoxFit.cover,
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
  /// Start build Widget  with text horizontal list
  Widget buildTextList(size) => Column(
    children: [
      Row(
        children: [
          SizedBox(width: size.width*0.02,),
          Container(
            width: size.width * 0.47,
            height: 167,
            decoration: BoxDecoration(
              color: const Color(0xff6A331D),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.05,
                      vertical: size.height * 0.01),
                  child: Text(
                    'Enoteca',
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}
