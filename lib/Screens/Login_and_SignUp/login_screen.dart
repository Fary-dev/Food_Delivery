import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mjam/Contants/Color.dart';
import 'package:mjam/Screens/Login_and_SignUp/reset_password.dart';
import 'package:mjam/Widgets/BottomNavBarWidget.dart';

import 'auch_with_Google.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextStyle txtBtnStyle = TextStyle(color: Colors.black, fontSize: 16);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;

  void click() {
    setState(() {
      signInWithGoogle().whenComplete(() {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return BottomNavBarWidget();
            },
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //WidgetLogin(),
        Scaffold(
          appBar: AppBar(
            backgroundColor: greyLightColor,
            elevation: 0,
            title: Text(
              '',
              style: TextStyle(fontSize: 15),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: primaryColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
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
                    'Anmelden',
                    style: TextStyle(
                        fontSize: 13,
                        color: blackColor,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                //____________________Facebook_____Google__________
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //___________________Facebook_______________
                      Expanded(
                        flex: 25,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          color: whiteColor,
                          onPressed: () {
                            print('Facebook');
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                      image: AssetImage('assets/facebook.jpg'),
                                    )),
                                height: 25,
                                width: 25,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Facebook',
                                style: TextStyle(
                                    color: blackColor, letterSpacing: 0.5),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          width: 10,
                        ),
                      ),
                      //____________________Google________________
                      Expanded(
                        flex: 25,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          color: whiteColor,
                          onPressed: () {
                            setState(() {
                              click();
                            });
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 7),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: AssetImage('assets/google.png'),
                                )),
                                height: 30,
                                width: 30,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Google',
                                style: TextStyle(
                                    color: blackColor, letterSpacing: 0.5),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                //____________________________Oder_________________
                Container(
                  padding: EdgeInsets.only(top: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 2,
                          color: Colors.black26,
                          margin: EdgeInsets.only(left: 20, right: 15),
                          child: Divider(
                            color: blackColor,
                            height: 25,
                          ),
                        ),
                      ),
                      Text(
                        'oder',
                        style: TextStyle(fontSize: 13, color: blackColor),
                      ),
                      Expanded(
                        child: Container(
                          height: 2,
                          color: blackColor,
                          margin: EdgeInsets.only(left: 10, right: 20),
                          child: Divider(
                            color: blackColor,
                            height: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                //_____________________Mit E-Mail registrieren_____
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Mit E-Mail einloggen',
                    style: TextStyle(
                        fontSize: 13,
                        color: blackColor,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                //_____________________Name_E-Mail_Password________
                Container(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              color: greyColor,
                              borderRadius: BorderRadius.circular(0)),
                          child: TextFormField(
                            validator: validateEmail,
                            onSaved: (input) => _email = input,
                            controller: _emailController,
                            style: txtBtnStyle,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 15),
                                border: InputBorder.none,
                                hintText: 'E-Mail',
                                hintStyle:
                                    TextStyle(color: whiteColor, fontSize: 12)),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              color: greyColor,
                              borderRadius: BorderRadius.circular(0)),
                          child: TextFormField(
                            validator: validatePassword,
                            onSaved: (input) => _password = input,
                            controller: _passwordController,
                            obscureText: true,
                            style: txtBtnStyle,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 15),
                                border: InputBorder.none,
                                hintText: 'Password',
                                hintStyle:
                                    TextStyle(color: whiteColor, fontSize: 12)),
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
                  child: MaterialButton(
                    color: primaryColor,
                    onPressed: signin,
                    child: Text(
                      'KUNDENKONTO  ERSTELLE',
                      style: TextStyle(
                          color: whiteColor,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: TextButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResetPasswordScreen())),
                    child: Text(
                      'Password vergessen?',
                      style: TextStyle(color: primaryColor, fontSize: 11),
                    ),
                  ),
                )
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

  String validatePassword(String value) {
    Pattern pattern = r'^(?=.*\d)(?=.*[a-zA-Z])[a-zA-Z0-9!@#$%&*]{6,20}$';
    RegExp regex = new RegExp(pattern);
    print(value);
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value))
        return 'Enter valid password';
      else
        return null;
    }
  }

  Future<void> signin() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        print(_email);
        final User user = (await FirebaseAuth.instance
                .signInWithEmailAndPassword(email: _email, password: _password))
            .user;
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => BottomNavBarWidget()));

        print(user.email);
      } catch (e) {
        print(e.message);
      }
    }
  }
}
