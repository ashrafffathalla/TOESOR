import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toesor/modules/fb_login/fb_login_screen.dart';
import 'package:toesor/modules/login_screen/login_screen.dart';
import 'package:toesor/modules/profile_screen/profile_screen.dart';
import 'package:toesor/shared/constance/constant.dart';
import 'package:toesor/shared/network/local/sharedprefrance.dart';
import 'package:toesor/shared/network/remote/dio_helper.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'shared/obsarvable_bloc.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ),
  );

  Widget ? startWidget;
  sharedToken = CacheHelper.getData(key: 'token');
  if (sharedToken != null) {
    startWidget =  const ProfileScreen();
  } else {
    startWidget = LoginScreen();
  }
  BlocOverrides.runZoned(
        () {
      runApp( MyApp(start: startWidget!,));
    },
    blocObserver: SimpleBlocObserver(),
  );

}
class MyApp extends StatelessWidget {
  Widget start;
   MyApp({Key? key, required this.start}) : super(key: key);
  // final token = CacheHelper.getData(key: sharedToken!);
   @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,widget)
      {
        return  MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(),
          home:FaceBookLoginScreen(),
        );
      }
    );
  }
}

