import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toesor/shared/components/navigationbar/navigationbar.dart';
import 'package:toesor/shared/style/colors.dart';
class SidebarScreen extends StatelessWidget {
  const SidebarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      primary: true,
      backgroundColor:kPrimaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
            child: Icon(
              Icons.logout,
              size: 33.sp,
              color:const Color(0xffEEDEBA),
            ),
          ),
        ],
        leading: GestureDetector(
            onTap: () => scaffoldKey.currentState!.openDrawer(),
          child: Icon(
            Icons.menu,
            size: 33.sp,
            color:const Color(0xffEEDEBA),
          ),
        ),
      ),
      body: Scaffold(
        key: scaffoldKey,
        backgroundColor:kPrimaryColor,
        drawer:const NavigationDrawerScreen(),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/background.png',
                        ),
                        fit: BoxFit.cover,
                      )),
                ),
              ),
            ],

          ),
        ),
      ),
    );
  }
}
