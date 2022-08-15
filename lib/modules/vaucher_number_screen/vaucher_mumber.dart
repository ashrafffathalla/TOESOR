import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toesor/shared/style/colors.dart';

import '../vaucher_screen/cubit/cubit.dart';
import '../vaucher_screen/cubit/states.dart';

class VaucherNumberScreen extends StatelessWidget {
   VaucherNumberScreen({Key? key,required this.index}) : super(key: key);
   int  index;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<AllSponsorCubit,GetAllSponsorStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return  Scaffold(
          backgroundColor: kPrimaryColor,
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
              Center(
                child: Container(
                  width: size.width*0.9,
                  height: size.height*0.4,
                  decoration: BoxDecoration(
                      color: kPopColor,
                    borderRadius: BorderRadius.circular(30.sp)
                  ),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(
                      horizontal: size.width*0.065
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                            'Il tuo vaucher è :',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w600,
                            )
                        ),
                        SizedBox(height: size.height*0.01,),
                        Text(
                            '${AllSponsorCubit.get(context).sponsor[index].coupon}',
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontFamily: 'Comfortaa',
                            )
                        ),
                        SizedBox(height: size.height*0.03,),
                        Text(
                          'Descrizione:',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w600,
                            )
                        ),
                        SizedBox(height: size.height*0.01,),
                        Text(
                          '${AllSponsorCubit.get(context).sponsor[index].descr}',
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontFamily: 'Comfortaa',
                            )
                        ),
                        SizedBox(height: size.height*0.03,),
                        Text(
                          'Indirizzo:',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w600,
                            ),
                        ),
                        SizedBox(height: size.height*0.01,),
                        Text(
                          AllSponsorCubit.get(context).sponsor[index].indirizzo.toString(),
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontFamily: 'Comfortaa',
                            )
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },

    );
  }
}
