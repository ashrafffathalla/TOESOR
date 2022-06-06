import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../style/colors.dart';

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
        print(value);
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
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
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
          text.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Comfortaa',
            fontSize: 23.sp,
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
  height: 2.8.sp,
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
      top:MediaQuery.of(context).size.height*0.05,


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