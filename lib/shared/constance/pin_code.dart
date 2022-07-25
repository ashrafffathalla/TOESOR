import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:toesor/modules/resete_password/enter_code/cubit/cubit.dart';

import '../style/colors.dart';

class PinCode extends StatelessWidget {
   PinCode({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: PinCodeTextField(
        enableActiveFill: true,
        keyboardType: TextInputType.number,
        appContext: context,
        length: 5,
        onChanged: (value) {

        },
        hintStyle:const TextStyle(
          color: Colors.white,
        ),
        showCursor: false,
        pinTheme: PinTheme(
          borderRadius: BorderRadius.circular(0),
          fieldWidth: size.width*0.085,
          fieldHeight: size.height*0.06,
          selectedColor:kPrimaryColor.withOpacity(0.2),
          shape: PinCodeFieldShape.box,
          activeColor:kPrimaryColor,
          inactiveColor: Colors.brown[300],
          activeFillColor: Colors.white,
          inactiveFillColor: Colors.white,
          selectedFillColor: Colors.white,
        ),
      ),
    );
  }
}