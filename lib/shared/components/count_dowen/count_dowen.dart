import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../components.dart';
class CountDown extends StatefulWidget {
  const CountDown({Key? key}) : super(key: key);

  @override
  State<CountDown> createState() => _TestState();
}
class _TestState extends State<CountDown> {
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
  void reset(){
    if(isCountDown){
      setState(()=> duration = countDowenDuration);
    }else{
      setState(() {
        duration=Duration();
      });
    }
  }
  void addTime(){
    final addSeconds = isCountDown ? -1 : 1;
    setState(() {
      final second = duration.inSeconds + addSeconds;
      if(second < 1){
        timer?.cancel();
      }else{
        duration=Duration(seconds: second);
      }
      duration =Duration(seconds: second);
    });
  }
  void startTimer(){
    timer= Timer.periodic(Duration(seconds: 1),(_)=>addTime());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Column(
          children: [
            sizeBoxStart(context),
            buildTime(),
          ],
        ),
      ),
    );
  }
  buildTime() {
    String twoDigits(int n )=>n.toString().padLeft(2,'0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Container(
      width: 229.23,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildTimeCard(time: hours,header: 'hours'),
          SizedBox(
            child: Text(
              ':',
              style: TextStyle(
                  fontSize: 36.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Comfortaa'
              ),
            ),),
          buildTimeCard(time: minutes,header: 'Minutes'),
          SizedBox(child: Text(
            ':',
            style: TextStyle(
                fontSize: 36.sp,
                fontWeight: FontWeight.w400,
                fontFamily: 'Comfortaa'
            ),
          ),),
          buildTimeCard(time: seconds,header: 'seconds'),
        ],
      ),
    );
  }
  Widget buildTimeCard({
    required String time,
    required String header,
  })=>Container(
    color: Colors.red,
    child:Text(
      time,
      style: TextStyle(
          fontSize: 36.sp,
          fontWeight: FontWeight.w400,
          fontFamily: 'Comfortaa'
      ),

    ),
  );
}

