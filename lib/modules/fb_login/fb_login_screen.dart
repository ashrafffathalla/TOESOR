import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FaceBookLoginScreen  extends StatefulWidget {
  const FaceBookLoginScreen({Key? key}) : super(key: key);

  @override
  State<FaceBookLoginScreen> createState() => _FaceBookLoginScreenState();
}

class _FaceBookLoginScreenState extends State<FaceBookLoginScreen> {
  bool isLoggedIn = false;
  Map userOpj = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoggedIn?Column(
        children: [
          Image.network(userOpj["picture"]["data"]["url"]),
          Text(userOpj["name"]),
          Text(userOpj["email"]),
          TextButton(onPressed: (){}, child: ElevatedButton(
            onPressed: ()async{
              await FacebookAuth.i.logOut().then((value){
                setState((){
                  isLoggedIn = false;
                  userOpj = {};
                });
              });
            },
            child: Text('Log Out'),
          ),)
        ],
      ):Center(
        child: ElevatedButton(
            onPressed: ()async
            {
              await FacebookAuth.instance.login(
                permissions: ['email', 'public_profile']
              ).then((value){
                 FacebookAuth.instance.getUserData().then((value){
                  setState((){
                    isLoggedIn = true;
                    userOpj = value;
                  });
                });
              });

            },
            child: Text('Login With Face book'),
        ),
      ),
    );
  }
}
//keytool -exportcert -alias androiddebugkey -keystore ~/.android/debug.keystore | C:\Users\ashra\Downloads\openssl-1.0.2j-fips-x86_64\OpenSSL\bin\openssl.exe" sha1 -binary | "C:\Users\ashra\Downloads\openssl-1.0.2j-fips-x86_64\OpenSSL\bin\openssl.exe" base64

