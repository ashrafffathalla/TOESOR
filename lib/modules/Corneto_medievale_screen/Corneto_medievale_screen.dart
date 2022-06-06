import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../shared/components/colors_dots/colors_dots_screen.dart';
import '../../shared/components/components.dart';
import '../../shared/components/navigationbar/navigationbar.dart';
import '../../shared/style/colors.dart';

class CornetoMedievaleScreen extends StatelessWidget {
  const CornetoMedievaleScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: const NavigationDrawerScreen(),
        key: scaffoldKey,
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
        body: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              child: Column(
                children: [
                  Container(
                    height: size.height * 0.075,
                    decoration: const BoxDecoration(
                      color: Color(0xffEEDEBA),
                      borderRadius: BorderRadius.only(),
                    ),
                    child: TabBar(
                        indicatorColor: Colors.transparent,
                        unselectedLabelColor: const Color(0xffD8C9A8),
                        indicator: const BoxDecoration(
                          color: Color(0xff6A331D),
                          borderRadius: BorderRadius.only(
                            // topRight: Radius.circular(70),
                            // bottomRight: Radius.circular(10),
                          ),
                        ),
                        labelStyle: TextStyle(
                            fontSize: 29.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Comfortaa'),
                        tabs: [
                          Tab(
                            child: Container(
                              height: size.height,
                              width: size.width / 2,
                              child: Center(
                                child: Text(
                                  'MAPPA',
                                  style: TextStyle(
                                      fontSize: 29.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Comfortaa'),
                                ),
                              ),
                            ),
                          ),
                          Tab(
                            child: Container(
                              height: size.height,
                              width: size.width,
                              child: Center(
                                child: Text(
                                  'ELENCO',
                                  style: TextStyle(
                                    fontSize: 29.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Comfortaa',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]),
                  ),

                  /// Tabs
                  Expanded(
                    child: SizedBox(
                      height: size.height,
                      child: TabBarView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          ///First Tab
                          Image.asset(
                            'assets/images/map.png',
                            fit: BoxFit.cover,
                          ),

                          ///second Tab
                          ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) =>
                                buildSecondTab(context),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 0,
                            ),
                            itemCount: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Center(
                child: Container(
                  width: size.width * 0.9,
                  height: size.height * 0.27,
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
                            top: size.height * 0.02,
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width * 0.07,
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
                          height: size.height * 0.015,
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
                          height: size.height * 0.03,
                        ),
                        Container(
                          width: size.width * 0.38,
                          height: size.height * 0.05,
                          decoration: BoxDecoration(
                            color:const Color(0XFF5BA57B),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
