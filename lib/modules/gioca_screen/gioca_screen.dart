import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toesor/modules/classifica_screen/classifica_screen.dart';
import 'package:toesor/modules/confirm_map_one_screen/confirm_map_one.dart';
import 'package:toesor/modules/confirm_map_one_screen/cubit/cubit.dart';
import 'package:toesor/modules/mapScreen/cubit/cubit.dart';
import 'package:toesor/modules/mapScreen/cubit/states.dart';
import 'package:toesor/shared/constance/logout.dart';

import '../../models/get_all_routes_model.dart';
import '../../shared/components/colors_dots/colors_dots_screen.dart';
import '../../shared/components/components.dart';
import '../../shared/components/navigationbar/navigationbar.dart';
import '../../shared/style/colors.dart';

class GiocaScreen extends StatelessWidget {
  int index;
  DataModel data;
   GiocaScreen({Key? key,required this.data,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
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
            child: Row(
              children: [
                SvgPicture.asset(
                    'assets/icons/info.svg',
                  height: size.height*0.03,
                ),
                SizedBox(
                  width: size.width*0.05,
                ),
                InkWell(
                  onTap: (){
                    signOut(context);
                  },
                  child: Icon(
                    Icons.logout,
                    size: 33.sp,
                    color:const Color(0xffEEDEBA),
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
      body: BlocConsumer<MapScreenCubit,MapScreenStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          MapScreenCubit cubit = MapScreenCubit.get(context);
          return ConditionalBuilder(
            condition: cubit.data !=null,
            builder: (context)=>Scaffold(
              drawer: const NavigationDrawerScreen(),
              key: scaffoldKey,
              body: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/stack.png',
                                ),
                                fit: BoxFit.cover,
                              )),
                        )),
                    Positioned(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                          ),
                        )),
                    Positioned(
                      child: SingleChildScrollView(
                        physics:const BouncingScrollPhysics(),
                        child: Padding(
                          padding:EdgeInsets.symmetric(horizontal: size.width*0.1),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/boy.png',
                              ),
                              SizedBox(
                                height: size.height*0.03,
                              ),
                              Row(
                                children: [
                                  // Text(
                                  //   'Tarquinia -',
                                  //   style: TextStyle(
                                  //     fontSize: 16.sp,
                                  //     fontFamily: 'Comfortaa',
                                  //     fontWeight: FontWeight.w400,
                                  //   ),
                                  // ),
                                  Flexible(
                                    child: Text(
                                      data.Roue_Name.toString(),
                                      style: TextStyle(
                                        fontSize: 17.sp,
                                        fontFamily: 'Comfortaa',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height*0.03,
                              ),
                              buildRowWidget(
                                  size,
                                  data,
                              ),
                              SizedBox(
                                height: size.height*0.01,
                              ),
                              myDivider(context),
                              SizedBox(
                                height: size.height*0.018,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Miglior tempo : 34 min',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Comfortaa',
                                        ),
                                      ),
                                      Text(
                                        'ilBatmon il 17/04/22',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Comfortaa',
                                        ),
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: (){
                                      navigateTo(context, ClassificaScreen(
                                        index: index,
                                      ));
                                    },
                                    child: Container(
                                      width:size.width*0.3,
                                      height: size.height*0.045,
                                      decoration: BoxDecoration(
                                        color:const Color(0xffB68B6E),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'CLASSIFICA',
                                          style:  TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Comfortaa',
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height*0.01,
                              ),
                              myDivider(context),
                              SizedBox(
                                height: size.height*0.02,
                              ),
                              Image.asset('assets/images/accesspilty.png'),
                              SizedBox(
                                height: size.height*0.005,
                              ),
                              myDivider(context),
                              SizedBox(
                                height: size.height*0.01,
                              ),
                              defaultButton(
                                context,
                                function: (){
                                  ///TODO
                                  ConfirmaMapScreenCubit.get(context).polylineCoordinates.clear();
                                  navigateTo(context,  ConfirmMapOne(index: index,));
                                },
                                text: 'GIOCA',
                                rounder: BorderRadius.circular(25),
                                background:const Color(0xff6A331D),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: 0,
                      child: Center(
                        child: Container(
                          width: size.width * 0.9,
                          height: size.height * 0.17,
                          decoration: const BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                topLeft: Radius.circular(30),
                              )),
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width*0.03,
                                vertical: size.height*0.02,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "DESCRIZIONE \n \n ${data.descr}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Comfortaa',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          fallback:(context)=>const Center(
            child: CircularProgressIndicator(
              color: kPrimaryColor,
            ),
          ),
          );
        },

      ),
    );
  }
  Widget buildRowWidget(size,DataModel data ,)=>Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        children: [
          Text(
            data.length.toString(),
            style: TextStyle(
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

                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                fontFamily: 'Comfortaa'),
          ),
        ],
      ),
      Column(
        children: [
          Text(
            data.duration.toString(),
            style: TextStyle(

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

                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                fontFamily: 'Comfortaa'),
          ),
        ],
      ),
      Column(
        children: [
          Text(
            data.lap!.length.toString(),
            style: TextStyle(

                fontSize: 17.sp,
                fontWeight: FontWeight.bold,
                fontFamily: 'Comfortaa'),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.02,
            ),
            child: Row(
              children: [
                if (data.lap!.length == 1)
                  Row(
                    children: const [
                      ColorDot(
                        isSelected: true,
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
                      ColorDot(
                        isSelected: false,
                      ),
                    ],
                  ),
                if (data.lap!.length == 2)
                  Row(
                    children: const [
                      ColorDot(
                        isSelected: true,
                      ),
                      ColorDot(
                        isSelected: true,
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
                if (data.lap!.length == 3)
                  Row(
                    children: const [
                      ColorDot(
                        isSelected: true,
                      ),
                      ColorDot(
                        isSelected: true,
                      ),
                      ColorDot(
                        isSelected: true,
                      ),
                      ColorDot(
                        isSelected: false,
                      ),
                      ColorDot(
                        isSelected: false,
                      ),
                    ],
                  ),
                if (data.lap!.length == 4)
                  Row(
                    children: const [
                      ColorDot(
                        isSelected: true,
                      ),
                      ColorDot(
                        isSelected: true,
                      ),
                      ColorDot(
                        isSelected: true,
                      ),
                      ColorDot(
                        isSelected: true,
                      ),
                      ColorDot(
                        isSelected: false,
                      ),
                    ],
                  ),
                if (data.lap!.length == 5)
                  Row(
                    children: const [
                      ColorDot(
                        isSelected: true,
                      ),
                      ColorDot(
                        isSelected: true,
                      ),
                      ColorDot(
                        isSelected: true,
                      ),
                      ColorDot(
                        isSelected: true,
                      ),
                      ColorDot(
                        isSelected: true,
                      ),
                    ],
                  ),
              ],
            ),
          ),
          Text(
            'Numero tappe',
            style: TextStyle(

              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Comfortaa',
            ),
          ),
        ],
      ),
    ],
  );

}
