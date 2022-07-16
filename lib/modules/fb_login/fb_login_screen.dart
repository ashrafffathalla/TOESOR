import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toesor/modules/fb_login/cubti/cubit.dart';
import 'cubti/states.dart';

class FaceBookLoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FacebookLoginCubit,FacebookStates>(
      listener: (context,state){},
      builder: (context,state){
        FacebookLoginCubit cubit = FacebookLoginCubit.get(context);
        return Scaffold(
          body: cubit.isLoggedIn && cubit.userOpj.isNotEmpty
              ? Column(
            children: [
              Image.network(cubit.userOpj["picture"]["data"]["url"]),
              Text(cubit.userOpj["name"].toString()),
              Text(cubit.userOpj["name"].toString().split(" ")[0]),
              Text(cubit.userOpj["name"].toString().split(" ")[1]),
              Text(cubit.userOpj["id"].toString()),
              Text(cubit.userOpj["email"].toString()),
              TextButton(
                onPressed: () {
                  cubit.logOut();
                },
                child: const Text('Log Out'),
              ),
            ],
          )
              : Center(
            child: ElevatedButton(
              onPressed: () async {
                cubit.login();
              },
              child: Text('Continua su Facebook'),
            ),
          ),
        );
      },
    );
  }
}

//keytool -exportcert -alias androiddebugkey -keystore ~/.android/debug.keystore | C:\Users\ashra\Downloads\openssl-1.0.2j-fips-x86_64\OpenSSL\bin\openssl.exe" sha1 -binary | "C:\Users\ashra\Downloads\openssl-1.0.2j-fips-x86_64\OpenSSL\bin\openssl.exe" base64
//iykOMMFeFtCkerI1Mc28z + s7UfI =
