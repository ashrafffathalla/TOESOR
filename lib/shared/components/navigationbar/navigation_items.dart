import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
class DrawerItems extends StatelessWidget {
  const DrawerItems({Key? key,required this.name,required this.icon,required this.onPressed}) : super(key: key);
  final String name;
  final SvgPicture icon;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      highlightColor:const Color(0xffEEDEBA),
      onTap: onPressed,
      child: SizedBox(
        height: size.height*0.08,
        child: Padding(
          padding: EdgeInsets.only(left: size.width*0.04),
          child: Row(
            children: [
              icon,
              SizedBox(width: size.width*0.06,),
              Text(
                  name,
                style: TextStyle(
                  fontFamily: 'Comfortaa',
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
