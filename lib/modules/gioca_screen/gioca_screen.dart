import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../shared/components/colors_dots/colors_dots_screen.dart';
import '../../shared/components/components.dart';
import '../../shared/components/navigationbar/navigationbar.dart';
import '../../shared/style/colors.dart';

class GiocaScreen extends StatelessWidget {
  const GiocaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const NavigationDrawerScreen(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor:kAppbarColor,
        title: Center(
          child: SvgPicture.asset(
            'assets/icons/titel_bar.svg',
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: size.width*0.01),
            child: Row(
              children: [
                SvgPicture.asset(
                    'assets/icons/info.svg',
                  height: size.height*0.03,
                ),
                SizedBox(
                  width: size.width*0.05,
                ),
                Icon(
                  Icons.logout,
                  size: 33.sp,
                  color:const Color(0xffEEDEBA),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/stack.png',
                        ),
                        fit: BoxFit.cover,
                      )),
                )),
            Positioned(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                )),
            Positioned(
              child: SingleChildScrollView(
                physics:const BouncingScrollPhysics(),
                child: Padding(
                  padding:EdgeInsets.symmetric(horizontal: size.width*0.1),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/boy.png',
                      ),
                      SizedBox(
                        height: size.height*0.03,
                      ),
                      Row(
                        children: [
                          Text(
                            'Tarquinia -',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            ' Cornento medievale',
                            style: TextStyle(
                              fontSize: 17.sp,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height*0.03,
                      ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Column(
                           children: [
                             Text(
                               '3,5',
                               style: TextStyle(

                                   fontSize: 17.sp,
                                   fontWeight: FontWeight.bold,
                                   fontFamily: 'Comfortaa'),
                             ),
                             Padding(
                               padding: EdgeInsets.only(
                                 top: size.height * 0.02,
                               ),
                               child: Row(
                                 children: const [
                                   ColorDot(),
                                   ColorDot(
                                     isSelected: false,
                                   ),
                                   ColorDot(
                                     isSelected: false,
                                   ),
                                   ColorDot(
                                     isSelected: false,
                                   ),
                                   ColorDot(
                                     isSelected: false,
                                   ),
                                 ],
                               ),
                             ),
                             Text(
                               'Lunghezza (km)',
                               style: TextStyle(

                                   fontSize: 12.sp,
                                   fontWeight: FontWeight.w400,
                                   fontFamily: 'Comfortaa'),
                             ),
                           ],
                         ),
                         Column(
                           children: [
                             Text(
                               '45 min',
                               style: TextStyle(

                                   fontSize: 17.sp,
                                   fontWeight: FontWeight.bold,
                                   fontFamily: 'Comfortaa'),
                             ),
                             Padding(
                               padding: EdgeInsets.only(
                                 top: size.height * 0.02,
                               ),
                               child: Row(
                                 children: const [
                                   ColorDot(),
                                   ColorDot(),
                                   ColorDot(
                                     isSelected: false,
                                   ),
                                   ColorDot(
                                     isSelected: false,
                                   ),
                                   ColorDot(
                                     isSelected: false,
                                   ),
                                 ],
                               ),
                             ),
                             Text(
                               'Tempo medio',
                               style: TextStyle(

                                   fontSize: 12.sp,
                                   fontWeight: FontWeight.w400,
                                   fontFamily: 'Comfortaa'),
                             ),
                           ],
                         ),
                         Column(
                           children: [
                             Text(
                               '3',
                               style: TextStyle(

                                   fontSize: 17.sp,
                                   fontWeight: FontWeight.bold,
                                   fontFamily: 'Comfortaa'),
                             ),
                             Padding(
                               padding: EdgeInsets.only(
                                 top: size.height * 0.02,
                               ),
                               child: Row(
                                 children: const [
                                   ColorDot(),
                                   ColorDot(
                                     isSelected: false,
                                   ),
                                   ColorDot(
                                     isSelected: false,
                                   ),
                                   ColorDot(
                                     isSelected: false,
                                   ),
                                   ColorDot(
                                     isSelected: false,
                                   ),
                                 ],
                               ),
                             ),
                             Text(
                               'Numero tappe',
                               style: TextStyle(

                                   fontSize: 12.sp,
                                   fontWeight: FontWeight.w400,
                                   fontFamily: 'Comfortaa',
                               ),
                             ),
                           ],
                         ),
                       ],
                     ),
                      SizedBox(
                        height: size.height*0.01,
                      ),
                      myDivider(context),
                      SizedBox(
                        height: size.height*0.018,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'Miglior tempo : 34 min',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Comfortaa',
                                ),
                              ),
                              Text(
                                  'ilBatmon il 17/04/22',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Comfortaa',
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width:size.width*0.3,
                            height: size.height*0.045,
                           decoration: BoxDecoration(
                             color:const Color(0xffB68B6E),
                             borderRadius: BorderRadius.circular(30),
                           ),
                            child: Center(
                              child: Text(
                                'CLASSIFICA',
                                style:  TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Comfortaa',
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height*0.01,
                      ),
                      myDivider(context),
                      SizedBox(
                        height: size.height*0.02,
                      ),
                      Image.asset('assets/images/accesspilty.png'),
                      SizedBox(
                        height: size.height*0.005,
                      ),
                      myDivider(context),
                      SizedBox(
                        height: size.height*0.01,
                      ),
                      defaultButton(
                        context,
                        function: (){
                          ///TODO
                        },
                        text: 'GIOCA',
                        rounder: BorderRadius.circular(25),
                        background:const Color(0xff6A331D),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: 0,
              child: Center(
                child: Container(
                  width: size.width * 0.9,
                  height: size.height * 0.17,
                  decoration: const BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      )),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width*0.03,
                        vertical: size.height*0.02,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "DESCRIZIONE \n luogo di un tempo ormai perso, dal cui punto, puoi scorgere un cielo terso, misteriosa è la sua storia che la città divide, ad una persona è intitolata che mai la vide Una donna di Chiesa assai forte e coraggiosa cha a fianco di Gregorio VII lottò impetuosa",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Comfortaa',
                            ),
                          ),
                        ],
                      ),
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
}
