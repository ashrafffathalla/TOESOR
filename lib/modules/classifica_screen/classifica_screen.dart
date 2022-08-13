import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toesor/modules/classifica_screen/cubit/cubit.dart';
import 'package:toesor/modules/classifica_screen/cubit/states.dart';
import 'package:toesor/modules/mapScreen/cubit/cubit.dart';
import 'package:toesor/shared/components/components.dart';

import '../../models/clasifica_model.dart';
import '../../shared/components/navigationbar/navigationbar.dart';
import '../../shared/style/colors.dart';

class ClassificaScreen extends StatelessWidget {
  int index;
   ClassificaScreen({Key? key,required this.index,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    Size size = MediaQuery.of(context).size;
    ClasificaCubit.get(context).getClasifica(Route_ID: MapScreenCubit.get(context).data[index].routeID!.toInt());
    return BlocConsumer<ClasificaCubit, ClasificaStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Scaffold(

          appBar: AppBar(
            elevation: 0,
            backgroundColor: kAppbarColor,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: size.width * 0.01),
                child: Row(
                  children: [
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
          body: ClasificaCubit.get(context).clasifica.isNotEmpty?Scaffold(
            drawer: const NavigationDrawerScreen(),
            key: scaffoldKey,
            body: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: size.height*0.045,
                  color:const Color(0XFF6A331D),
                  child: Center(
                    child: Text(
                      'CLASSIFICA',
                      style: TextStyle(
                        fontSize: 25.sp,
                        color: Colors.white,
                        fontWeight:FontWeight.w400,
                        fontFamily: 'Comfortaa',
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: size.height*0.04,
                  color:const Color(0XFF905340),
                  child: Center(
                    child: Text(
                      MapScreenCubit.get(context).data[index].Roue_Name.toString(),
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.white,
                        fontWeight:FontWeight.w500,
                        fontFamily: 'Comfortaa',
                      ),
                    ),
                  ),
                ),
                ///ListView
                Expanded(
                  child: ListView.separated(
                    physics:const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => buildClassificaList(
                        context,size,index,ClasificaCubit.get(context).clasifica,
                    ),
                    separatorBuilder: (context, index) =>const SizedBox(),
                    itemCount: ClasificaCubit.get(context).clasifica.length,
                  ),
                )

              ],
            ),
          ):const Center(
            child: CircularProgressIndicator(
              color: kPrimaryColor,
            ),
          ),
        );
      },

    );
  }
  buildClassificaList(context,size,index,List<Classifica> clasifica)=> Column(
    children: [
      Container(
        width: size.width,
        height: size.width*0.2,
        child: Row(
          children: [
            Container(
              color:const Color(0xffedddbb),
              width: size.width*0.1,
              height: size.width*0.2,
              child:  Center(
                child: Text(
                  ClasificaCubit.get(context).clasifica[index].userId.toString(),
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Comfortaa'
                  ),
                ),
              ),
            ),
            Container(
              width: size.width*0.15,
              height: size.width*0.2,
              color:const Color(0xFFd8c195),
              child: Center(
                child: Text(
                clasifica[index].tempoClassifica.toString(),
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Comfortaa'
                  ),
                ),
              ),
            ),
            Container(
              //width: size.width,
              child: Row(
                children: [
                  SizedBox(width: size.width*0.02,),
                  Container(
                    width: size.width*0.15,
                    height: size.height*0.15,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(clasifica[index].userPic.toString()),
                        )
                    ),
                  ),
                  SizedBox(width: size.width*0.05,),
                  Text(
                    clasifica[index].userNickName.toString(),
                    style: TextStyle(
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Comfortaa'
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      myDividerTwo(context),
    ],
  );
}
