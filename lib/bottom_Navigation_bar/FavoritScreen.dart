import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mjam/Contants/Color.dart';
import 'package:mjam/Screens/Login_and_SignUp/auch_with_Google.dart';
import 'package:mjam/Screens/Login_and_SignUp/login_screen.dart';
import 'package:mjam/Screens/Login_and_SignUp/sign_up_screen.dart';

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
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        brightness: Theme.of(context).appBarTheme.brightness,
        elevation: 0,
        title: Text(
          "Mein Foodo",
          style: Theme.of(context).primaryTextTheme.headline6,
        ),
      ),
      body: signInOrNot == false
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 100, bottom: 65),
                  child: Container(
                      height: 60,
                      width: 60,
                      child: ColorFiltered(
                      child: Image.asset(
                        "assets/shop.png",
                        fit: BoxFit.cover,
                      ),
                      colorFilter:
                          ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                    ),
                  ),
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
                      side: BorderSide(color: primaryColor, width: 2.0),
                    ),
                    child: Text(
                      'KUNDENKONTO ERSTELLEN',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .button
                          .apply(color: primaryColor),
                    ),
                    onPressed: () {
                      Get.to(() => SignUpScreen());
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
                      style: Theme.of(context)
                          .primaryTextTheme
                          .button
                          .apply(color: whiteColor),
                    ),
                    onPressed: () {
                      Get.to(() => LoginScreen());
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
