import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toesor/modules/confirm_map_one_screen/confirm_map_one.dart';
import 'package:toesor/modules/confirm_map_one_screen/cubit/cubit.dart';
import 'package:toesor/modules/mapScreen/cubit/cubit.dart';
import 'package:toesor/modules/mapScreen/map_screen.dart';
import 'package:toesor/modules/time_screen/cubit/cubit.dart';
import 'package:toesor/modules/time_screen/cubit/states.dart';
import 'package:toesor/modules/vaucher_screen/vaucher_screen.dart';
import 'package:toesor/shared/components/components.dart';
import 'package:toesor/shared/constance/logout.dart';
import '../../shared/components/navigationbar/navigationbar.dart';
import '../../shared/style/colors.dart';
class TimeScreen extends StatefulWidget {
  int index;
  TimeScreen({Key? key,required this.index}) : super(key: key);

  @override
  State<TimeScreen> createState() => _TimeScreenState();
}

class _TimeScreenState extends State<TimeScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  var rispostaController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    TimeScreenCubit.get(context).startTimer();
    TimeScreenCubit.get(context).getQuizInTimeScreen(Route_ID: widget.index+1);
    //MapScreenCubit.get(context).data[widget.index].routeID!.toInt()
  }



  @override
  Widget build(BuildContext context) {

    //TimeScreenCubit.get(context).reset();
    print('**************************');
    print('index from timer screen ${widget.index}');
    print('********************');
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop:()async{
        showDialog(
          context: context,
          builder: (context)=>Dialog(
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
                        GestureDetector(
                          onTap: (){
                            //DELETE API
                            TimeScreenCubit.get(context).deleteDataOfTimeScreen(Route_ID:MapScreenCubit.get(context).data[widget.index].routeID!.toInt());
                            MapScreenCubit.get(context).markers.clear();
                            navigateAndFinish(context, MapScreen());
                          },
                          child: Container(
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
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
        return false;
      },
      child: BlocConsumer<TimeScreenCubit,TimeScreenStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return state is LoadingTimeScreenState ? const Center(child: CircularProgressIndicator(backgroundColor: Colors.black,color:kPrimaryColor,)): Scaffold(
            backgroundColor: kPrimaryColor,
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
                      GestureDetector(
                        onTap: (){
                          Dialog(
                            backgroundColor: kPopColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            child: Container(
                              height: size.height/2.1,
                              width: size.width*0.9,
                              child: SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
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
                                        GestureDetector(
                                          onTap: (){
                                            signOut(context);
                                          },
                                          child: Container(
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
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.logout,
                          size: 33.sp,
                          color: const Color(0xffEEDEBA),
                        ),
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
            body: TimeScreenCubit.get(context).lap.isNotEmpty ?Form(
              key: formKey,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                drawer: const NavigationDrawerScreen(),
                key: scaffoldKey,
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
                                  buildTime(context),
                                  Container(
                                    width: MediaQuery.of(context).size.width*0.3,
                                    height: MediaQuery.of(context).size.height*0.061,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(30)
                                    ),
                                    child:Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'tappa',
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            fontFamily: 'Comfortaa',
                                          ),
                                        ),
                                        Padding(
                                          padding:  EdgeInsets.only(
                                            left: size.width*0.1,
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                TimeScreenCubit.get(context).numeroTappa[0].totalTaps.toString(),
                                                style: TextStyle(
                                                  fontSize: 19.sp,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'Comfortaa',
                                                ),
                                              ),
                                              Text(
                                                '/',
                                                style: TextStyle(
                                                  fontSize: 19.sp,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'Comfortaa',
                                                ),
                                              ),
                                              Text(
                                                MapScreenCubit.get(context).data[widget.index].lap!.length.toString(),
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
                                  ),
                                ],
                              ),
                              ///start Container Images
                              SizedBox(
                                height: size.height*0.05,
                              ),
                              Container(
                                width: size.width*0.9,
                                height: size.height*0.43,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width*0.03
                                  ),
                                  child: SingleChildScrollView(
                                    physics:const BouncingScrollPhysics(),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: size.height*0.01,
                                        ),
                                        Text(
                                          TimeScreenCubit.get(context).lap[widget.index].quiz![widget.index].placeName.toString(),
                                          style: TextStyle(
                                              fontSize: 22.sp,
                                              fontFamily: 'Comfortaa',
                                              fontWeight: FontWeight.w500
                                          ),
                                        ),
                                        SizedBox(
                                          height: size.height*0.005,
                                        ),
                                        TimeScreenCubit.get(context).lap[widget.index].quiz![widget.index].media.toString().isNotEmpty?
                                        Image.network(
                                          TimeScreenCubit.get(context).lap[widget.index].quiz![widget.index].media.toString(),
                                          fit: BoxFit.cover,
                                        ):const Center(
                                          child: CircularProgressIndicator(
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: size.height*0.02,
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              TimeScreenCubit.get(context).lap[widget.index].quiz![widget.index].question.toString(),
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontFamily: 'Comfortaa',
                                                  fontWeight: FontWeight.w500
                                              ),
                                            ),
                                          ],
                                        ),
                                        //SizedBox(height: size.height*0.025,),
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
                                    color:Colors.white,
                                    borderRadius: BorderRadius.circular(30)
                                ),
                                child: TextFormField(
                                  controller: rispostaController,
                                  keyboardType: TextInputType.text,
                                  validator: (value){
                                    if (value!.isEmpty || rispostaController.text != TimeScreenCubit.get(context)
                                        .lap[widget.index].quiz![widget.index].answer.toString() ) {
                                      return 'Inserisci la Risposta Corretta';
                                    }
                                    return null;
                                  },
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
                                )
                              ),
                              SizedBox(
                                height: size.height*0.015,
                              ),
                              GestureDetector(
                                onTap: (){
                                  if(formKey.currentState!.validate()){
                                    if(rispostaController.text == TimeScreenCubit.get(context)
                                        .lap[widget.index].quiz![widget.index].answer.toString() &&
                                        TimeScreenCubit.get(context).lap[widget.index].nextTapID!=null
                                    )
                                    {
                                      TimeScreenCubit.get(context).saveTimeAndRouteIDAndTapId(
                                          route_id: TimeScreenCubit.get(context).lap[widget.index]
                                          .routeID!.toString(),
                                          Tap_id: TimeScreenCubit.get(context).lap[widget.index]
                                              .iDTappeCaccia!.toString(),
                                          Time:  '$hours'':''$minutes'':''$seconds',
                                      );
                                      navigateTo(context, ConfirmMapOne(index: widget.index));
                                      ConfirmaMapScreenCubit.get(context).polylineCoordinates = [];
                                      print('Risposta Corretta');
                                    }else {
                                      TimeScreenCubit.get(context).saveTimeAndRouteIDAndTapId(
                                        route_id: TimeScreenCubit.get(context).lap[widget.index]
                                            .routeID!.toString(),
                                        Tap_id: TimeScreenCubit.get(context).lap[widget.index]
                                            .iDTappeCaccia!.toString(),
                                        Time:  '$hours'':''$minutes'':''$seconds',
                                      );

                                      navigateAndFinish(context, VaucherScreen(index: widget.index));
                                    }


                                  }
                                },
                                child: Container(
                                  width: 170.sp,
                                  height: 35.sp,
                                  decoration: BoxDecoration(
                                    color: Colors.green[400],
                                    borderRadius: BorderRadius.circular(35.sp),
                                  ),
                                  child: Center(
                                    child:Text(
                                      'Conferma Risposta',
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: size.height*0.015,
                              ),
                              GestureDetector(
                                onTap: (){
                                  if(TimeScreenCubit.get(context).isButtonOneActive){
                                    showDialog(
                                    context: context,
                                    builder: (context)=>Dialog(
                                      backgroundColor: kPopColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40.0),
                                      ),
                                      child: Container(
                                        height: size.height/3.5,
                                        width: size.width*0.8,
                                        child: SingleChildScrollView(
                                          physics: BouncingScrollPhysics(),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:  EdgeInsets.symmetric(vertical: size.height*0.1),
                                                child: Text(
                                                  TimeScreenCubit.get(context).lap[widget.index].quiz![widget.index].quizTips![widget.index].tipTitle.toString(),
                                                  style: TextStyle(
                                                    fontSize: 20.sp,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Comfortaa',
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: size.height*0.03,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                    TimeScreenCubit.get(context).oneAiuto();
                                  }else{
                                    null;
                                  }
                                  TimeScreenCubit.get(context).changeButtonActive();
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
                                        color:TimeScreenCubit.get(context).isButtonOneActive?Colors.black
                                            :const Color(0xffDFCFAC),
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
                              GestureDetector(
                                onTap: (){
                                  if (TimeScreenCubit.get(context).isButtonTwoActive) {
                                    showDialog(
                                    context: context,
                                    builder: (context)=>Dialog(
                                      backgroundColor: kPopColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40.0),
                                      ),
                                      child: Container(
                                        height: size.height/3.5,
                                        width: size.width*0.8,
                                        child: SingleChildScrollView(
                                          physics: BouncingScrollPhysics(),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:  EdgeInsets.symmetric(vertical: size.height*0.1),
                                                child: Text(
                                                  TimeScreenCubit.get(context).lap[widget.index].quiz![widget.index].quizTips![widget.index+1].tipTitle.toString(),
                                                  style: TextStyle(
                                                    fontSize: 20.sp,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Comfortaa',
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: size.height*0.03,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                    TimeScreenCubit.get(context).TwoAiuto();
                                  }else{
                                    null;
                                  }
                                  TimeScreenCubit.get(context).changeButtonTwoActive();
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
                                      'Aiuto 2 + 20 minuti',
                                      style: TextStyle(
                                        color:TimeScreenCubit.get(context).isButtonTwoActive?Colors.black
                                            :const Color(0xffDFCFAC),
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
                              if (TimeScreenCubit.get(context).lap[widget.index].quiz![widget.index].quizTips![widget.index+2].tipTitle.toString().isNotEmpty) GestureDetector(
                                onTap: (){
                                  if(TimeScreenCubit.get(context).isButtonThreeActive) {
                                    showDialog(
                                    context: context,
                                    builder: (context)=>Dialog(
                                      backgroundColor: kPopColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40.0),
                                      ),
                                      child: Container(
                                        height: size.height/3.5,
                                        width: size.width*0.8,
                                        child: SingleChildScrollView(
                                          physics: BouncingScrollPhysics(),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:  EdgeInsets.symmetric(vertical: size.height*0.1),
                                                child: Text(
                                                  TimeScreenCubit.get(context).lap[widget.index].quiz![widget.index].quizTips![widget.index+2].tipTitle.toString(),
                                                  style: TextStyle(
                                                    fontSize: 20.sp,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Comfortaa',
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: size.height*0.03,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                    TimeScreenCubit.get(context).ThreeAiuto();
                                  }else{
                                    null;
                                  }
                                  TimeScreenCubit.get(context).changeButtonThreeActive();
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
                                      'Soluzione + 30 minuti',
                                      style: TextStyle(
                                        color:TimeScreenCubit.get(context).isButtonThreeActive?Colors.black
                                            :const Color(0xffDFCFAC),
                                        fontFamily: 'Comfortaa',
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ) else Container(
                                width: 10.sp,
                                height: 10.sp,
                                color: Colors.transparent,
                              ),
                              SizedBox(
                                height: size.height*0.03,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ) :const Center(child: CircularProgressIndicator(color: Colors.black,)),

          );
        },

      ),
    );
  }

  ///START TIME
  dynamic ? hours;

  dynamic ? minutes;

  dynamic ? seconds;

  buildTime(context) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    hours  = twoDigits(TimeScreenCubit.get(context).duration.inHours);
     minutes = twoDigits(TimeScreenCubit.get(context).duration.inMinutes.remainder(60));
    // final extraMinutes = twoDigits(duration.inMinutes.remainder(600));
    seconds = twoDigits(TimeScreenCubit.get(context).duration.inSeconds.remainder(60));
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
