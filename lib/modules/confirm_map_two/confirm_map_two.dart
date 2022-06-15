import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toesor/shared/components/components.dart';
import '../../shared/components/navigationbar/navigationbar.dart';
import '../../shared/style/colors.dart';

class ConfirmMapTwo extends StatelessWidget {
  const ConfirmMapTwo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        backgroundColor: kAppbarColor,
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
      body: Scaffold(
        drawer: const NavigationDrawerScreen(),
        key: scaffoldKey,
        body:Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              child:SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height,
                      child: Image.asset(
                        'assets/images/mapa.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Center(
                child: Container(
                  width: size.width * 0.9,
                  height: size.height * 0.22,
                  decoration: const BoxDecoration(
                      color:kPopColor ,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      )),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(
                          horizontal: size.width*0.05,
                          vertical: size.height*0.03
                      ),
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              "Conferma di essere \n arrivato a destinazione",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Comfortaa',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height*0.03,
                          ),
                          confirmaBtn(size),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
