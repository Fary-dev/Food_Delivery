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
          style: Theme.of(context).primaryTextTheme.button,
        ),
      ),
      body: signInOrNot == false
          ? Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  child: ColorFiltered(
                    child: Image.asset(
                      "assets/shop.png",
                      fit: BoxFit.cover,
                    ),
                    colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Text(
                  'Es ist leer hier',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: greyColor),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Du musst angemeldet sein, um diese '
                  'Information sehen zu können',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                      color: greyColor),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 100,
                ),
                MaterialButton(
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
                MaterialButton(
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
                SizedBox(
                  height: 50,
                ),
              ],
            )
          : Center(
              child: Text(
                'Wilkommen',
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .apply(fontSizeDelta: -20),
              ),
            ),
    );
  }
}
