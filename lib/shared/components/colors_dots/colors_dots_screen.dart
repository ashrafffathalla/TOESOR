import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    this.fillColor,
    this.isSelected=true,
  }) : super(key: key);
  final Color? fillColor;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(right: 3.sp,bottom: 5.sp),
      child: Container(
        width: 15.sp,
        height: 15.sp,
        decoration: BoxDecoration(
          color:isSelected ? Color(0xff5BA57B):Color(0xffEEDEBA),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}