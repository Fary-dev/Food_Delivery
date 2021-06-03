import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mjam/Contants/Color.dart';
import 'package:mjam/Screens/Login_and_SignIn/auch_with_Google.dart';
import 'package:mjam/Screens/Login_and_SignIn/login_screen.dart';
import 'package:mjam/Screens/Login_and_SignIn/sign_up_screen.dart';
import 'package:mjam/Widgets/BottomNavBarWidget.dart';

// ignore: must_be_immutable
class Profil extends StatefulWidget {
  Profil({Key key}) : super(key: key);
  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  logOut() async {
    await _auth.signOut().then((_) {});
    // ignore: deprecated_member_use
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(' has successfully signed out.'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 3,
        child: SafeArea(
          child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                actions: signInOrNot == true
                    ? [
                        TextButton(
                          onPressed: () {
                            logOut();
                            signOutGoogle();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        BottomNavBarWidget()));
                          },
                          child: Text(
                            'Abmelden',
                            style: TextStyle(color: primaryColor, fontSize: 12),
                          ),
                        )
                      ]
                    : null,
                centerTitle: true,
                backgroundColor: whiteColor,
                elevation: 0,
                title: Text(
                  googleUserName == null ? 'Profil' : googleUserName,
                  style: TextStyle(
                      color: blackColor, fontSize: 13, letterSpacing: 0.5),
                ),
                bottom: TabBar(
                  labelStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.4),
                  unselectedLabelColor: blackColor,
                  labelColor: primaryColor,
                  indicatorColor: primaryColor,
                  indicatorWeight: 3,
                  tabs: [
                    Tab(
                      text: 'PROFIL',
                    ),
                    Tab(
                      text: 'HILFE',
                    ),
                    Tab(
                      text: 'NEUES',
                    )
                  ],
                ),
              ),
              body: TabBarView(children: [
                signInOrNot == false || googleUserName == null
                    ? Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //_________________assets/prof.png_____________
                            Container(
                              padding: EdgeInsets.only(top: 150, bottom: 15),
                              child: Container(
                                  height: 100,
                                  width: 100,
                                  child: Image.asset(
                                    'assets/prof.png',
                                    fit: BoxFit.fitHeight,
                                  )),
                            ),
                            //____________Es ist leer hier_________________
                            Container(
                              padding: EdgeInsets.only(bottom: 20),
                              child: Text(
                                'Es ist leer hier',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w900,
                                    color: greyColor),
                              ),
                            ),
                            //_________Du musst angemeldet sein_____________
                            Container(
                              padding: EdgeInsets.only(bottom: 30),
                              width: 200,
                              child: Text(
                                'Du musst angemeldet sein, um diese '
                                'Information sehen zu können',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w900,
                                    color: greyColor),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            //______________KUNDENKONTO ERSTELLEN__________
                            Container(
                              child: MaterialButton(
                                minWidth: 340,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: BorderSide(color: primaryColor),
                                ),
                                child: Text(
                                  'KUNDENKONTO ERSTELLEN',
                                  style: TextStyle(
                                      fontSize: 12, color: primaryColor),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SignUpScreen()));
                                },
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            //_______________________Oder___________________
                            Container(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(left: 45, right: 15),
                                      child: Divider(
                                        color: greyColor,
                                        height: 25,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'oder',
                                    style: TextStyle(
                                        fontSize: 11, color: greyColor),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(left: 10, right: 45),
                                      child: Divider(
                                        color: greyColor,
                                        height: 25,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            //______________________ANMELDEN________________
                            Container(
                              child: MaterialButton(
                                color: primaryColor,
                                minWidth: 340,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: BorderSide(color: primaryColor),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()));
                                },
                                child: Text(
                                  'ANMELDEN',
                                  style: TextStyle(
                                      fontSize: 12, color: whiteColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Center(
                        child: Text(
                          'Wilkommen',
                          style: TextStyle(fontSize: 18, color: primaryColor),
                        ),
                      ),
                Container(
                  color: Colors.grey[100],
                  child: Column(
                    children: [
                      buildContainer('Hilfe Center', () {}),
                      buildContainer('Allergene', () {}),
                      buildContainer('Impressum', () {}),
                      buildContainer('AGB', () {}),
                      buildContainer('Datenschutz', () {}),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      'Derzeit sind keine Updates verfügbar. Bitte später noch einmal versuchen.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, letterSpacing: 0.5),
                    ),
                  ),
                ),
              ])),
        ),
      ),
    );
  }

  Container buildContainer(String text, Function function) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width,
      child: MaterialButton(
        elevation: 0,
        height: 50,
        color: whiteColor,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            style: TextStyle(fontSize: 13, color: blackColor),
          ),
        ),
        onPressed: function,
      ),
    );
  }
}
