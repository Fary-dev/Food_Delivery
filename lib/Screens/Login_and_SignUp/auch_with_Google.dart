import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
final userData=GetStorage();

String googleUserName;
String googleUserEmail;
String googleUserImageUrl;
bool signInOrNot = false;
User googleUser;

Future<String> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final UserCredential authResult =
      await _auth.signInWithCredential(credential);
  final User user = authResult.user;

  // Checking if email and name is null
  assert(user.email != null);
  assert(user.displayName != null);
  assert(user.photoURL != null);

  googleUserName = user.displayName;
  googleUserEmail = user.email;
  googleUserImageUrl = user.photoURL;
  signInOrNot = true;

  // Only taking the first part of the name, i.e., First Name
  if (googleUserName.contains(" ")) {
    googleUserName = googleUserName.substring(0, googleUserName.indexOf(" "));
  }

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final User currentUser = _auth.currentUser;
  assert(user.uid == currentUser.uid);
  googleUser = user;
  userData.write('isLogged', true);
  userData.write('userName', user.displayName);

  log('data:  $user');
  return 'signInWithGoogle succeeded: $user';
}

Future<void> signOutGoogle() async {
  await googleSignIn.signOut();
  signInOrNot = false;
  userData.write('isLogged', false);
  userData.remove('userName');
}
