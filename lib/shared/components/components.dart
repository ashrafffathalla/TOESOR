import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../style/colors.dart';
import 'colors_dots/colors_dots_screen.dart';

///Start Standard Size Box
Widget sizeBoxStart(context) => SizedBox(
      height: MediaQuery.of(context).size.height * 0.07,
    );

///End Standard Size Box

/// Start default FormField
Widget defaultFormField(
  BuildContext context, {
  required TextEditingController controller,
  required TextInputType type,
  bool isPassword = false,
  required FormFieldValidator<String>? validate,
  required String label,
  final VoidCallback? onTab,
  final VoidCallback? suffixPressed,
  bool isClickable = true,
  final VoidCallback? onSubmit,
}) =>
    TextFormField(

      style: const TextStyle(color: Colors.black),
      controller: controller,
      cursorColor: Colors.black,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onTap: onTab,
      onFieldSubmitted: (String value) {

        //print(value);
      },
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          fontFamily: 'Comfortaa',
          fontWeight: FontWeight.w500,
          fontSize: 19.sp,
          color: Colors.black45,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.03,
          vertical: MediaQuery.of(context).size.height * 0.02,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
        ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                width: 2, color:kPrimaryColor
            ),
            borderRadius: BorderRadius.circular(30),
          ),
      ),
    );

/// End default FormField

///Start Default Button
Widget defaultButton(
  BuildContext context, {
  double width = double.infinity,
  Color background = Colors.brown,
  required VoidCallback function,
  required String text,
  required BorderRadius rounder,
}) =>
    Container(
      height: MediaQuery.of(context).size.height * 0.062,
      decoration: BoxDecoration(
        borderRadius: rounder,
        color: background,
      ),
      width: width,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Comfortaa',
            fontSize: 22.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );

///End Default Button
//Start Navigate Methods
void navigateTo(context, widget) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );
}

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ), (route) {
      return false;
    });

//End Navigate Methods
//Divider
Widget myDivider(BuildContext context) => Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.02,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: const Color(0xffEEDEBA),
      ),
    );
Widget myDividerTwo(BuildContext context) => Padding(
  padding: EdgeInsets.only(

  ),
  child: Container(
    width: double.infinity,
    height: 2.8.sp,
    color: const Color(0xffEEDEBA),
  ),
);
Widget brownDivider(BuildContext context) => Container(
  width: double.infinity,
  height: 1.8.sp,
  color: const Color(0xff6A331D),
);
//EndDivider
///APPBAR
///
Widget buidAppBar(scaffoldKey, context) => AppBar(
      elevation: 0,
      backgroundColor: kAppbarColor,
      title: Center(
        child: SvgPicture.asset(
          'assets/icons/titel_bar.svg',
        ),
      ),
      actions: [
        Padding(
          padding:
              EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.01),
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
    );
///buildSecondTab Screen in tab bar
Widget buildSecondTab(context)=>Container(
  color: Colors.white,
  child: Padding(
    padding: EdgeInsets.only(
      top:MediaQuery.of(context).size.height*0.02,
    ),
    child: Column(
      children: [
        Padding(
          padding:  EdgeInsets.only( left:MediaQuery.of(context).size.width*0.03,),
          child: Row(
            children: [
              Text(
                '200 mt - ',
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Comfortaa'
                ),
              ),
              Text(
                'Tarquinia ',
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Comfortaa'
                ),
              ),
              Text(
                '- Le torri ',
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Comfortaa'
                ),
              ),
            ],

          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height*0.02,
        ),
        Container(
          color:const Color(0xffD8C194),
          height: MediaQuery.of(context).size.height*0.07,
          child: Center(
            child: Padding(
              padding:  EdgeInsets.only( left:MediaQuery.of(context).size.width*0.03,),
              child: Row(
                children: [
                  Text(
                    '200 mt - ',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Comfortaa'
                    ),
                  ),
                  Text(
                    'Tarquinia ',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Comfortaa'
                    ),
                  ),
                  Text(
                    '- Le torri ',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Comfortaa'
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  ),
);
///Start Confirma bottton
Widget confirmaBtn(size)=>Container(
  width: size.width * 0.38,
  height: size.height * 0.05,
  decoration: BoxDecoration(
    color:const Color(0XFF5BA57B),
    borderRadius: BorderRadius.circular(30),
  ),
  child: Center(
    child: Text(
      'CONFERMA',
      style: TextStyle(
        color: Colors.white,
        fontSize: 20.sp,
        fontWeight: FontWeight.w400,
        fontFamily: 'Comfortaa',
      ),
    ),
  ),
);
///End Confirma BTN
///Start Valid Email
bool isEmail(String em) {

  String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp =  RegExp(p);

  return regExp.hasMatch(em);
}
///Start focus Widget
//Widget Focus()=>FocusManager.instance.primaryFocus?.unfocus();
/// Bottom Sheet
void bottomSheet(context,Widget widget){
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
      elevation: 0,
      context: context,
      builder: (context)=>widget,
  );
  /*
  Container(
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
      )
   */
  /*
  Container(
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
                                  data[item].Roue_Name.toString(),
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
                                  data[item].length.toString(),
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
                                  data[item].duration.toString(),
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
                                data[item].descr.toString(),
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
                ),
  * */
}