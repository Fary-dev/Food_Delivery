import 'package:flutter/material.dart';
import 'package:mjam/Screens/login_screen.dart';
import 'package:mjam/Screens/sign_up_screen.dart';

class FavoritScreen extends StatefulWidget {
  FavoritScreen({Key key}) : super(key: key);

  @override
  _FavoritScreenState createState() => _FavoritScreenState();
}

class _FavoritScreenState extends State<FavoritScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Mein Foodo",
            style: TextStyle(
                color: Colors.black, fontSize: 13, letterSpacing: 0.5),
          ),
        ),
        body: Container(
          child: Column(
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
                      color: Colors.black38),
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
                      color: Colors.black38),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                // ignore: deprecated_member_use
                child: FlatButton(
                  minWidth: 340,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(color: Colors.red[700]),
                  ),
                  child: Text(
                    'KUNDENKONTO ERSTELLEN',
                    style: TextStyle(fontSize: 12, color: Colors.red[700]),
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
                          color: Colors.black38,
                          height: 25,
                        ),
                      ),
                    ),
                    Text(
                      'oder',
                      style: TextStyle(fontSize: 11, color: Colors.black38),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10, right: 45),
                        child: Divider(
                          color: Colors.black38,
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
                // ignore: deprecated_member_use
                child: FlatButton(
                  color: Colors.red[700],
                  minWidth: 340,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(color: Colors.red[700]),
                  ),
                  child: Text(
                    'ANMELDEN',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
