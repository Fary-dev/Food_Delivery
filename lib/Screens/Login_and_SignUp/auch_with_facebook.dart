import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:async';

class LoginFacebook extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FacebookLogin facebookLogin = FacebookLogin();
  final userData = GetStorage();

  Future signInFacebook() async {
    try {
      final FacebookLoginResult res = await facebookLogin.logIn(
        permissions: [
          FacebookPermission.publicProfile,
          FacebookPermission.email,
        ],
      );

      switch (res.status) {
        case FacebookLoginStatus.success:
          final fBToken = res.accessToken;
          final AuthCredential credential =
              FacebookAuthProvider.credential(fBToken!.token);
          final User? user =
              (await _auth.signInWithCredential(credential)).user;

          userData.write('userName', user!.displayName);
          userData.write('method', 'facebook');
          userData.write('isLogged', true);
          userData.write('email', user.email);
          userData.write('photo', user.photoURL);

          break;
        case FacebookLoginStatus.cancel:
          break;
        case FacebookLoginStatus.error:
          print(res.error);
          break;
      }
      // return true;
    } catch (error) {
      print('Error code: ${error.toString()}');
      // return false;
    }
  }

  Future<void> signOutFacebook() async {
    final facebookLogin = FacebookLogin();
    await facebookLogin.logOut();
    userData.write('isLogged', false);
    userData.remove('userName');
    userData.remove('method');
  }
}
