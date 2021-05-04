import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mjam/Widgets/BottomNavBarWidget.dart';

import 'login_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextStyle txtBtnStyle = TextStyle(color: Colors.black, fontSize: 16);
  TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  String _email;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //WidgetLogin(),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey[200],
            elevation: 0,
            title: Text(
              '',
              style: TextStyle(fontSize: 15),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.red[700],
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          backgroundColor: Colors.grey[200],
          body: SafeArea(
            child: ListView(
              children: [
                SizedBox(
                  height: 10,
                ),
                //__________________Foode_Kundenkonto_erstellen____
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Password vergassen?',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Gib Deine EMailAdresse unten ein und wir senden dir eine E-Mail mit weiteren Infos Zürucksetzung Deines Kontos.',
                    style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5),
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                //________________________________________E-Mail_______
                Container(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(0)),
                          child: TextFormField(
                            // ignore: missing_return
                            validator: validateEmail,
                            onSaved: (input) => _email = input,
                            controller: _emailController,
                            style: txtBtnStyle,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 15),
                                border: InputBorder.none,
                                hintText: 'E-Mail',
                                hintStyle: TextStyle(
                                    color: Colors.white, fontSize: 12)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                //__________________KUNDENKONTO_ERSTELLE___________
                Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    color: Colors.redAccent[400],
                    onPressed: resetPassword,
                    child: Text(
                      'SCHICKE MIR MEIN PASSWORT',
                      style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  Future<void> resetPassword() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        await auth.sendPasswordResetEmail(email: _email);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      } catch (e) {
        print(e.message);
      }
    }
  }
}
