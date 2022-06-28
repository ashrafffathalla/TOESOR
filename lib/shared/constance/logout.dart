import 'package:toesor/modules/login_screen/login_screen.dart';
import 'package:toesor/shared/constance/constant.dart';

import '../components/components.dart';
import '../network/local/sharedprefrance.dart';

void signOut(context){
  CacheHelper.removerData(key: 'token').then((value)
  {
    if(value!){
      sharedToken = null;
      navigateAndFinish(context, LoginScreen ());
    }
  });
}