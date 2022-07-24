import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toesor/modules/fb_login/cubti/cubit.dart';
import 'package:toesor/modules/fb_login/cubti/states.dart';
import 'package:toesor/modules/googel_login/cubit/cubit.dart';
import 'package:toesor/modules/googel_login/cubit/states.dart';
import 'package:toesor/modules/profile_screen/profile_screen.dart';
import 'package:toesor/shared/components/components.dart';
import 'package:toesor/shared/components/navigationbar/navigation_items.dart';
import 'package:toesor/shared/style/colors.dart';

class NavigationDrawerScreen extends StatelessWidget {
  const NavigationDrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Container(
      width: size.width*0.85,
      child: Drawer(
        child: Material(
          color:Colors.white,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  color: const Color(0xffEEDEBA),
                  child: Padding(
                    padding:  EdgeInsets.only(
                      left:MediaQuery.of(context).size.width*0.03,
                      top: MediaQuery.of(context).size.height*0.01,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            BlocConsumer<FacebookLoginCubit,FacebookStates>(
                              listener:(context, state) {},
                              builder: (context, state) {
                                FacebookLoginCubit cubit = FacebookLoginCubit.get(context);
                                return cubit.userOpj.isNotEmpty?
                                  CircleAvatar(
                                  backgroundColor: Colors.brown,
                                  radius: 40.sp,
                                  child: ClipRRect(
                                    child:Image.network(cubit.userOpj["picture"]["data"]["url"],
                                  ),
                                )): GoogleCubit.get(context).userOpj != null ?  CircleAvatar(
                                    backgroundColor: Colors.brown,
                                    radius: 40.sp,
                                    child: ClipRRect(
                                      child:Image.network(GoogleCubit.get(context).userOpj!.photoUrl.toString(),
                                      ),
                                    )):const Center(
                                  child: CircularProgressIndicator(
                                    color: kPrimaryColor,
                                  ),
                                );
                              },

                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width*0.03,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'percorsi giocati: ',
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontFamily: 'Comfortaa',
                                        fontWeight: FontWeight.w400,
                                      ),

                                    ),
                                    Text(
                                      '27',
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontFamily: 'Comfortaa',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height*0.015,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'miglior piazzamento: ',
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontFamily: 'Comfortaa',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      '2',
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontFamily: 'Comfortaa',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GoogleCubit.get(context).userOpj !=null?
                            Text(
                              GoogleCubit.get(context).userOpj!.displayName.toString(),
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.w400,
                              ),
                            ):FacebookLoginCubit.get(context).userOpj.isNotEmpty? Text(
                              FacebookLoginCubit.get(context).userOpj["name"].toString(),
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.w400,
                              ),
                            ):const Center(child: CircularProgressIndicator(color: kPrimaryColor,)),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.04,),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: size.height*0.03,),
                DrawerItems(
                    name: 'PROFILO',
                    icon: SvgPicture.asset('assets/icons/progile_circle.svg'),
                    onPressed: ()=>onItemPressed(context, index:0)
                ),
                myDivider(context),
                SizedBox(height: size.height*0.03,),
                DrawerItems(
                    name: 'GIOCA',
                    icon: SvgPicture.asset('assets/icons/location.svg'),
                    onPressed: ()=>onItemPressed(context, index:1)
                ),
                myDivider(context),
                SizedBox(height: size.height*0.03,),
                DrawerItems(
                    name: 'TUA CLASSIFICA',
                    icon: SvgPicture.asset('assets/icons/kas.svg'),
                    onPressed: ()=>onItemPressed(context, index:2)
                ),
                myDivider(context),
                SizedBox(height: size.height*0.03,),
                DrawerItems(
                    name: 'IMPOSTAZIONI',
                    icon: SvgPicture.asset('assets/icons/setting.svg'),
                    onPressed: ()=>onItemPressed(context, index:2)
                ),
                myDivider(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context , {required int index})
  {
    Navigator.pop(context);
    switch(index){
      case 0 :
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const ProfileScreen()));
        break;
      default:
        Navigator.pop(context);
        break;

    }
  }
  /*
  Widget headerWidget(context){
    return Container(
      color: const Color(0xffEEDEBA),
      child: Padding(
        padding:  EdgeInsets.only(
            left:MediaQuery.of(context).size.width*0.03,
          top: MediaQuery.of(context).size.height*0.01,
        ),
        child: Column(
          children: [
            Row(
              children: [
                 CircleAvatar(
                   backgroundColor: Colors.brown,
                  radius: 40.sp,
                  child: ClipRRect(
                    child: Image.asset('assets/images/circle-women.png'),
                  ),
                ),
                 SizedBox(
                  width: MediaQuery.of(context).size.width*0.03,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                       Text(
                           'percorsi giocati: ',
                         style: TextStyle(
                           fontSize: 15.sp,
                           fontFamily: 'Comfortaa',
                           fontWeight: FontWeight.w400,
                         ),

                       ),
                       Text(
                           '27',
                         style: TextStyle(
                           fontSize: 15.sp,
                           fontFamily: 'Comfortaa',
                           fontWeight: FontWeight.w400,
                         ),
                       ),
                     ],
                   ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.015,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                            'miglior piazzamento: ',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          '2',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.03,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'ilaria85',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w400,
                  ),

                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.04,),

          ],
        ),
      ),
    );
  }*/
}
