import 'package:flutter/material.dart';
import 'package:mjam/Contants/Color.dart';
import 'package:mjam/Screens/Login_and_SignIn/auch_with_Google.dart';
import 'package:mjam/Screens/Login_and_SignIn/login_screen.dart';
import 'package:mjam/Screens/Login_and_SignIn/sign_up_screen.dart';

class FavoritScreen extends StatefulWidget {
  FavoritScreen({Key key}) : super(key: key);

  @override
  _FavoritScreenState createState() => _FavoritScreenState();
}

class _FavoritScreenState extends State<FavoritScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: whiteColor,
        elevation: 0,
        title: Text(
          "Mein Foodo",
          style: TextStyle(color: blackColor, fontSize: 13, letterSpacing: 0.5),
        ),
      ),
      body: signInOrNot == false
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 150, bottom: 15),
                  child: Container(
                      height: 100,
                      width: 130,
                      child: Image.asset(
                        'assets/Favorit.png',
                        fit: BoxFit.fitHeight,
                      )),
                ),
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
                Container(
                  child: MaterialButton(
                    minWidth: 340,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(color: primaryColor),
                    ),
                    child: Text(
                      'KUNDENKONTO ERSTELLEN',
                      style: TextStyle(fontSize: 12, color: primaryColor),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 45, right: 15),
                          child: Divider(
                            color: greyColor,
                            height: 25,
                          ),
                        ),
                      ),
                      Text(
                        'oder',
                        style: TextStyle(fontSize: 11, color: greyColor),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 10, right: 45),
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
                Container(
                  child: MaterialButton(
                    color: primaryColor,
                    minWidth: 340,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(color: primaryColor),
                    ),
                    child: Text(
                      'ANMELDEN',
                      style: TextStyle(fontSize: 12, color: whiteColor),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                  ),
                ),
              ],
            )
          : Center(
              child: Text(
                'Wilkommen',
                style: TextStyle(fontSize: 18, color: primaryColor),
              ),
            ),
    );
  }
}
