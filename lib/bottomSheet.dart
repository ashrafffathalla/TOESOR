import 'package:flutter/material.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: () {
            showFlexibleBottomSheet(
              isExpand: true,
              bottomSheetColor: Colors.transparent,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
              ),
              minHeight: 0,
              initHeight: 0.15,
              maxHeight: 0.3,
              context: context,
              builder: (context, scrollController, space) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: ListView(
                    controller: scrollController,
                    children: [
                      Center(
                        child: Container(
                          width: 25.sp,
                          height: 6,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(20)
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Text('**'),
                          Text('**'),
                          Text('**'),
                        ],

                      ),

                      if(space == 0.3)  Text('lorim description'),
                      TextButton(onPressed: (){}, child: Text(space.toString())),
                    ],
                  ),
                ),
              ),
            );
          },
          child:
          Text(
            'show bottom',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
