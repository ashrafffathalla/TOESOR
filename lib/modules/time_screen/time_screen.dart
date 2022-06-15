import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../shared/components/components.dart';
import '../../shared/components/navigationbar/navigationbar.dart';
import '../../shared/style/colors.dart';

class TimeScreen extends StatefulWidget {
  const TimeScreen({Key? key}) : super(key: key);

  @override
  State<TimeScreen> createState() => _TestState();
}

class _TestState extends State<TimeScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  static const countDowenDuration = Duration(minutes: 10);
  Duration duration = const Duration();
  Timer? timer;
  bool isCountDown = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
    reset();
  }

  void reset() {
    if (isCountDown) {
      setState(() => duration = countDowenDuration);
    } else {
      setState(() {
        duration = Duration();
      });
    }
  }

  void addTime() {
    final addSeconds = isCountDown ? -1 : 1;
    setState(() {
      final second = duration.inSeconds + addSeconds;
      if (second < 1) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: second);
      }
      duration = Duration(seconds: second);
    });
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      drawer: const NavigationDrawerScreen(),
      key: scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kAppbarColor,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: size.width * 0.01),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/info.svg',
                  height: size.height * 0.03,
                ),
                SizedBox(
                  width: size.width * 0.05,
                ),
                Icon(
                  Icons.headset,
                  size: 33.sp,
                  color: const Color(0xffEEDEBA),
                ),
                SizedBox(
                  width: size.width * 0.05,
                ),
                Icon(
                  Icons.logout,
                  size: 33.sp,
                  color: const Color(0xffEEDEBA),
                ),
              ],
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
        children: [
          Positioned(
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                'assets/images/background.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width*0.0),
                child: SingleChildScrollView(
                  physics:const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height*0.03,
                      ),
                      ///ROW TIMe
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildTime(),
                          Container(
                            width: MediaQuery.of(context).size.width*0.3,
                            height: MediaQuery.of(context).size.height*0.061,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)
                            ),
                            child:Column(
                              children: [
                                Text(
                                    'tappa',
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontFamily: 'Comfortaa',
                                  ),
                                ),
                                Text(
                                    '1/4',
                                  style: TextStyle(
                                    fontSize: 19.sp,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Comfortaa',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      ///start Container Images
                      SizedBox(
                        height: size.height*0.05,
                      ),
                      Container(
                        width: size.width*0.9,
                        height: size.height*0.4,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width*0.03
                          ),
                          child: SingleChildScrollView(
                            physics:BouncingScrollPhysics(),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: size.height*0.01,
                                ),
                                Text(
                                    'LUOGO INDOVINELLO',
                                  style: TextStyle(
                                    fontSize: 22.sp,
                                    fontFamily: 'Comfortaa',
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                                SizedBox(
                                  height: size.height*0.02,
                                ),
                                Image.asset(
                                    'assets/images/roma.png',
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                  height: size.height*0.02,
                                ),
                                Text(
                                  'trova il tritone',
                                  style: TextStyle(
                                      fontSize: 19.sp,
                                      fontFamily: 'Comfortaa',
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      ///END Container Images
                      ///Start Bottoms
                      SizedBox(
                        height: size.height*0.05,
                      ),
                      Container(
                        width: size.width*0.9,
                        height: size.height*0.06,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: size.width*0.05,

                            ),
                            hintText: 'Risposta...',
                            helperStyle: TextStyle(
                              fontSize: 21.sp,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w500,

                            )
                          ),

                        ),
                      ),
                      SizedBox(
                        height: size.height*0.03,
                      ),
                      GestureDetector(
                        onTap: (){
                          showDialog(
                              context: context,
                              builder: (context){
                                return Dialog(
                                  backgroundColor: kPopColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                  child: Container(
                                    height: size.height/2.1,
                                    width: size.width*0.9,
                                    child: SingleChildScrollView(
                                      physics:const BouncingScrollPhysics(),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding:  EdgeInsets.only(
                                              right: size.width*0.03,
                                              top: size.height*0.01,
                                              bottom: size.height*0.02,
                                            ),
                                            child: Image.asset('assets/images/dialog.png'),
                                          ),
                                          Text(
                                            "se esci prima di terminare\n il prcorso, perderai tutti\ni tuoi progressi  ",
                                            style: TextStyle(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Comfortaa',
                                            ),
                                          ),
                                          SizedBox(
                                            height: size.height*0.03,
                                          ),
                                          /// Resta AND ESCI
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              GestureDetector(
                                                child: Container(
                                                  width: size.width*0.3,
                                                  height: size.height*0.044,
                                                  decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius: BorderRadius.circular(30),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      'RESTA',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily: 'Comfortaa',
                                                        fontSize: 21.sp,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                onTap: (){
                                                  Navigator.pop(context);
                                                },
                                              ),
                                              Container(
                                                width: size.width*0.3,
                                                height: size.height*0.044,
                                                decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius: BorderRadius.circular(30),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'ESCI',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: 'Comfortaa',
                                                      fontSize: 21.sp,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: kPopColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          width: size.width*0.9,
                          height: size.height*0.06,
                          child:Center(
                            child: Text(
                              'Aiuto 1 + 10 minuti',
                                style: TextStyle(
                                  fontFamily: 'Comfortaa',
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height*0.03,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: kPopColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        width: size.width*0.9,
                        height: size.height*0.06,
                        child:Center(
                          child: Text(
                            'Aiuto 2 + 20 minuti',
                              style: TextStyle(
                                color: Color(0xffDFCFAC),
                                fontFamily: 'Comfortaa',
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height*0.03,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: kPopColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        width: size.width*0.9,
                        height: size.height*0.06,
                        child:Center(
                          child: Text(
                            'Soluzione + 30 minuti',
                              style: TextStyle(
                                color: Color(0xffDFCFAC),
                                fontFamily: 'Comfortaa',
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
          ),
        ],
      ),
    );
  }

  ///START TIME
  buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Container(
      width: MediaQuery.of(context).size.width*0.6,
      height: MediaQuery.of(context).size.height*0.061,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.watch_later_outlined,
            size: 40.sp,
          ),
          SizedBox(width: MediaQuery.of(context).size.width*0.02,),
          buildTimeCard(time: hours, header: 'hours'),
          SizedBox(
            child: Text(
              ':',
              style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Comfortaa'),
            ),
          ),
          buildTimeCard(time: minutes, header: 'Minutes'),
          SizedBox(
            child: Text(
              ':',
              style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Comfortaa'),
            ),
          ),
          buildTimeCard(time: seconds, header: 'seconds'),
        ],
      ),
    );
  }

  Widget buildTimeCard({
    required String time,
    required String header,
  }) =>
      Container(
        child: Text(
          time,
          style: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Comfortaa'),
        ),
      );
}
