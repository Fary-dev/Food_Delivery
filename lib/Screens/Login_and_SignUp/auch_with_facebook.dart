import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:mjam/Screens/Login_and_SignUp/auch_with_Google.dart';

class LoginFacebook extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FacebookLogin facebookLogin = FacebookLogin();
  final userData = GetStorage();
  // String usermail = "";
  // User user;

  // Future<List<String>> signInFacebook() async {
  //   try {
  //     final _instance = FacebookAuth.instance;
  //     final result = await _instance.login(permissions: ["email"]);
  //     if (result.status == LoginStatus.success) {
  //       final OAuthCredential credential = FacebookAuthProvider.credential(result.accessToken.token);
  //       final a = await _auth.signInWithCredential(credential); //the error is in this line
  //       await _instance.getUserData().then((userData) async {
  //         await _auth.currentUser.updateEmail(userData["email"]);
  //         usermail = userData["email"];
  //         print(usermail);
  //       });
  //       await user.getIdToken();
  //       return ["ok"];
  //     } else if (result.status == LoginStatus.cancelled) {
  //       return ["Erro!", "Login cancelado"];
  //     } else
  //       return ["Erro!", "Falha no login"];
  //   } catch (e) {
  //     return ["Erro!", e.toString()];
  //   }
  // }

  Future signInFacebook() async {
    try {
      final FacebookLoginResult res =
          await facebookLogin.logIn(/*['email', 'publicProfile']*/
              permissions: [
                FacebookPermission.publicProfile,
                FacebookPermission.email,
              ],
              );

      switch (res.status) {
        case FacebookLoginStatus.success:
          final fBToken = res.accessToken;
          final AuthCredential credential =
              FacebookAuthProvider.credential(fBToken.token);
          // final profile = await facebookLogin.getUserProfile();

          final result = await _auth.signInWithCredential(credential);
          userData.write('userName', result.user.displayName);
          userData.write('isLogged', true);
          userData.write('email', result.user.email);
          userData.write('photo', result.user.photoURL);
          print(result.user.displayName.toString());

          break;
        case FacebookLoginStatus.cancel:
          break;
        case FacebookLoginStatus.error:
          print(res.error);
          break;
      }

      return true;
    } catch (error) {
      print('Error code: ${error.toString()}');
      return false;
    }
  }

  Future<void> signOutFacebook() async {
    final facebookLogin = FacebookLogin();
    await facebookLogin.logOut();
    userData.write('isLogged', false);
    userData.remove('userName');
  }
}
