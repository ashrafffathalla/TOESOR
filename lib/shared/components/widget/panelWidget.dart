import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../style/colors.dart';
import '../colors_dots/colors_dots_screen.dart';

class PanelWidget extends StatelessWidget {
  final ScrollController controller;

  const PanelWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView(
        controller: controller,
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.03),
        children: [
          buildDragHandel(context),
          buildContainer(context),
        ],
      );

  Widget buildContainer(context) => Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.27,
        decoration: const BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            )),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.015,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.07,
                    ),
                    Text(
                      'Corneto medievale',
                      style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Comfortaa'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        '3,5',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Comfortaa'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.02,
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
                            color: Colors.white,
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
                            color: Colors.white,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Comfortaa'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.02,
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
                            color: Colors.white,
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
                            color: Colors.white,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Comfortaa'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.02,
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
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Comfortaa'),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.02),
                child: Column(
                  children: [
                    Text(
                      "DESCRIZIONE \n luogo di un tempo ormai perso, dal cui punto, puoi scorgere un cielo terso, misteriosa è la sua storia che la città divide, ad una persona è intitolata che mai la vide Una donna di Chiesa assai forte e coraggiosa cha a fianco di Gregorio VII lottò impetuosa",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Comfortaa',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.38,
                height: MediaQuery.of(context).size.height * 0.05,
                decoration: BoxDecoration(
                  color: const Color(0XFF5BA57B),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    'SCEGLI',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Comfortaa',
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );

  Widget buildDragHandel(context) => Center(
    child: Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Container(
            width: 30.sp,
            height: 5.sp,
            decoration:  BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)),
          ),
    ),
  );
}
