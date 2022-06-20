import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toesor/modules/login_screen/login_screen.dart';
import 'package:toesor/shared/network/remote/dio_helper.dart';

import 'shared/obsarvable_bloc.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ),
  );
  BlocOverrides.runZoned(
        () {
      runApp(const MyApp());
    },
    blocObserver: SimpleBlocObserver(),
  );

}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,widget){
        return  MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(),
          home:  LoginScreen(),
        );
      }
    );
  }
}

