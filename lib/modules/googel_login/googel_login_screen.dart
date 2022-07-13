import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:toesor/modules/login_screen/login_screen.dart';
import 'package:toesor/shared/components/components.dart';
class GoogleLoginScreen extends StatefulWidget {
  const GoogleLoginScreen({Key? key}) : super(key: key);

  @override
  State<GoogleLoginScreen> createState() => _GoogleLoginScreenState();

}
class _GoogleLoginScreenState extends State<GoogleLoginScreen> {
  bool isLoggedIn = false;
  GoogleSignInAccount ? userObj ;
  GoogleSignIn googleSignIn = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        child: isLoggedIn
            ? Column(
          children: [
            Image.network(userObj!.photoUrl.toString()),
            Text(userObj!.email),
            Text(userObj!.id),
            Text(userObj!.displayName.toString()),
            TextButton(
                onPressed: (){
                  googleSignIn.signOut().then((value){
                    setState((){
                      isLoggedIn = false;
                    });
                  }).catchError((e){
                    print(e.toString());
                  });
                },
                child:const Text('LogOut'),),
          ],
        ):Center(
          child: ElevatedButton(
              onPressed: ()async
              {
                googleSignIn.signIn().then((value){
                  setState((){
                    isLoggedIn = true;
                    userObj = value;
                  });
                }).catchError((error){
                  print(error.toString());
                });
              },
              child:const Text('Login With Google'),

          ),
        ),
      ),
    );
  }
}
