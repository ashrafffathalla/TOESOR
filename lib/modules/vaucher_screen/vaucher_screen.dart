import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path/path.dart';
import 'package:toesor/models/sponsor_category_model.dart';
import 'package:toesor/modules/vaucher_number_screen/vaucher_mumber.dart';
import 'package:toesor/modules/vaucher_screen/cubit/cubit.dart';
import 'package:toesor/modules/vaucher_screen/cubit/states.dart';
import 'package:toesor/shared/components/components.dart';
import 'package:toesor/shared/constance/logout.dart';

import '../../models/single_route_model.dart';
import '../../shared/components/navigationbar/navigationbar.dart';
import '../../shared/style/colors.dart';


class VaucherScreen extends StatelessWidget {
  int index;
  VaucherScreen({Key? key,required this.index}) : super(key: key);
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AllSponsorCubit.get(context).getAllSponsor(Route_ID: index+1);

    print('**************************');
    print('index from voucher screen $index');
    print('********************');
    return BlocConsumer<AllSponsorCubit,GetAllSponsorStates>(
      listener: (context, state) {
        // if(state is SuccessGetAllSponsorState){
        //   AllSponsorCubit.get(context).getAllSponsorCategory();
        // }
      },
      builder: (context, state) {
        AllSponsorCubit cubit = AllSponsorCubit.get(context);
        return  Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: kAppbarColor,
            title: Center(
              child: SvgPicture.asset(
                'assets/icons/titel_bar.svg',
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: size.width * 0.01),
                child: InkWell(
                  onTap: (){
                    signOut(context);
                  },
                  child: Icon(
                    Icons.logout,
                    size: 33.sp,
                    color: const Color(0xffEEDEBA),
                  ),
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
          body:Scaffold(
            backgroundColor: Colors.white,
            key: scaffoldKey,
            drawer: const NavigationDrawerScreen(),
            body:  Stack(
              children: [
                Positioned(
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.asset(
                      'assets/images/stack.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        ///Start container have white color
                        Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.05),
                          child: Container(
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.05),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Center(
                                    child: Image.asset(
                                      'assets/images/bor_girl.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.03,
                                  ),
                                  Text(
                                    'HAI VINTO!',
                                    style: TextStyle(
                                      fontFamily: 'Comfortaa',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  myDivider(context),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'il tuo tempo è:',
                                        style: TextStyle(
                                          fontFamily: 'Comfortaa',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 22.sp,
                                        ),
                                      ),
                                      Text(
                                        '00:34:45',
                                        style: TextStyle(
                                          fontFamily: 'Comfortaa',
                                          color: const Color(0xff6A331D),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 22.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  myDivider(context),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'sei arrivato',
                                        style: TextStyle(
                                          fontFamily: 'Comfortaa',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 22.sp,
                                        ),
                                      ),
                                      Text(
                                        '7° su 97',
                                        style: TextStyle(
                                          fontFamily: 'Comfortaa',
                                          color: const Color(0xff6A331D),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 22.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  Container(
                                    width: size.width * 0.3,
                                    height: size.height * 0.045,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffB68B6E),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'CLASSIFICA',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Comfortaa',
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.03,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        ///Start container have  list  view horizontal
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0XFFD8C194),
                          ),
                          child: Column(
                            children: [
                              brownDivider(context),
                              SizedBox(height: size.height*0.02,),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: size.width*0.05),
                                child: Row(
                                  children: [
                                    Text(
                                      'VAUCHER',
                                      style: TextStyle(
                                        color:const Color(0xff6A331D),
                                        fontFamily: 'Comfortaa',
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: size.height*0.02,),
                              SizedBox(
                                height: 185.sp,
                                child: InkWell(
                                  onTap: (){
                                    print(cubit.sponsor.length.toString());
                                  },
                                  child: ListView.separated(
                                    physics:const BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) => buildVaucherList(
                                        size,
                                      cubit.sponsor,
                                      index,
                                      context
                                    ),
                                    separatorBuilder: (context, index) =>SizedBox(
                                      width: size.width*0.02,
                                    ),
                                    itemCount: cubit.sponsor.length,
                                  ),
                                ),
                              ),
                              brownDivider(context),
                              SizedBox(height: size.height*0.01,),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: size.width*0.05),
                                child: Row(
                                  children: [
                                    Text(
                                      'NELLE VICINANZE',
                                      style: TextStyle(
                                        color:const Color(0xff6A331D),
                                        fontFamily: 'Comfortaa',
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: size.height*0.02,),
                              InkWell(
                                onTap: (){
                                  print(cubit.data.length.toString());
                                },
                                child: SizedBox(
                                  height: 190.sp,
                                  child: ListView.separated(
                                    physics:const BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) => buildTextList(
                                        size,
                                      cubit.sponsorCategories,
                                      index,
                                    ),
                                    separatorBuilder: (context, index) =>SizedBox(
                                      width: size.width*0.02,
                                    ),
                                    itemCount: cubit.sponsorCategories.length,
                                  ),
                                ),
                              ),

                              SizedBox(height: size.height*0.02,),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },

    );
  }

  /// Start build Widget image with text horizontal list
  Widget buildVaucherList(size,List<Sponsor> sponsor,int index,context) => GestureDetector(
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
                height: size.height/3.5,
                width: size.width*0.9,
                child: SingleChildScrollView(
                  physics:const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      sizeBoxStart(context),
                      Padding(
                        padding:  EdgeInsets.symmetric(
                          horizontal:15.sp
                        ),
                        child: Text(
                          "Are you sure select this VAUCHER",
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
                              navigateAndFinish(context, VaucherNumberScreen(
                                index: index.toInt(),
                              ));
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
    child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: size.width * 0.47,
                  decoration: BoxDecoration(
                    color:const Color(0xff6A331D),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.05,
                            vertical: size.height * 0.01),
                        child: Text(
                          sponsor[index].name.toString(),
                          style: TextStyle(
                            fontFamily: 'Comfortaa',
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                      Container(
                          width: size.width * 0.47,
                        child: ClipRRect(
                          borderRadius:const BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                          child:Image.network(
                              sponsor[index].media.toString(),
                            width: size.width * 0.47,
                               fit: BoxFit.cover,
                          ),
                        )),
                      // Image.asset(
                      //   'assets/images/pizza.png',
                      //   width: size.width * 0.47,
                      //   fit: BoxFit.cover,
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
  );
  /// Start build Widget  with text horizontal list
  Widget buildTextList(size,List<SponsorCategories> sponsorCategory,int index) => Column(
    children: [
      Row(
        children: [
          SizedBox(width: size.width*0.02,),
          Container(
            width: size.width * 0.47,
            height: 167.sp,
            decoration: BoxDecoration(
              color: const Color(0xff6A331D),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.05,
                      vertical: size.height * 0.01),
                  child: Text(
                    sponsorCategory[index].categoryName.toString(),
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}
