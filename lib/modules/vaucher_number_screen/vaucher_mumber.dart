import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../vaucher_screen/cubit/cubit.dart';
import '../vaucher_screen/cubit/states.dart';

class VaucherNumberScreen extends StatelessWidget {
   VaucherNumberScreen({Key? key,required this.index}) : super(key: key);
   int  index;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AllSponsorCubit,GetAllSponsorStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return  Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    'YOUR VAUCHER IS:'
                ),
                Text(
                    AllSponsorCubit.get(context).sponsor[index].coupon.toString()
                ),
              ],
            ),
          ),
        );
      },

    );
  }
}
