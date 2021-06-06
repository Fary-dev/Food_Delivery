import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mjam/Screens/Login_and_SignUp/login_screen.dart';
import 'package:mjam/Widgets/BottomNavBarWidget.dart';

import 'auch_with_Google.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextStyle txtBtnStyle = TextStyle(color: Colors.black, fontSize: 16);
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // ignore: unused_field
  String _email, _password, _name;

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
                color: Colors.redAccent[400],
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
                  child: Row(
                    children: [
                      Text(
                        'Foodo',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.redAccent[400],
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      ),
                      Text(
                        ' Kundenkonto erstellen',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      ),
                    ],
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
                          color: Colors.white,
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
                                    color: Colors.black, letterSpacing: 0.5),
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
                          color: Colors.white,
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
                                    color: Colors.black, letterSpacing: 0.5),
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
                            color: Colors.black26,
                            height: 25,
                          ),
                        ),
                      ),
                      Text(
                        'oder',
                        style: TextStyle(fontSize: 13, color: Colors.black26),
                      ),
                      Expanded(
                        child: Container(
                          height: 2,
                          color: Colors.black26,
                          margin: EdgeInsets.only(left: 10, right: 20),
                          child: Divider(
                            color: Colors.black26,
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
                    'Mit E-Mail registrieren',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                //_____________________Name_E-Mail_Password________
                Form(
                  key: _formKey,
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(0)),
                          child: TextFormField(
                            controller: _nameController,
                            style: txtBtnStyle,
                            validator: validateName,
                            onSaved: (String value) {
                              _name = value;
                            },
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 15),
                                border: InputBorder.none,
                                hintText: 'Name',
                                hintStyle: TextStyle(
                                    color: Colors.white, fontSize: 12)),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(0)),
                          child: TextFormField(
                            controller: _emailController,
                            style: txtBtnStyle,
                            keyboardType: TextInputType.emailAddress,
                            validator: validateEmail,
                            onSaved: (String value) {
                              _email = value;
                            },
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 15),
                                border: InputBorder.none,
                                hintText: 'E-Mail',
                                hintStyle: TextStyle(
                                    color: Colors.white, fontSize: 12)),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(0)),
                          child: TextFormField(
                            controller: _passController,
                            obscureText: true,
                            style: txtBtnStyle,
                            validator: validatePassword,
                            onSaved: (String value) {
                              _password = value;
                            },
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 15),
                                border: InputBorder.none,
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                    color: Colors.white, fontSize: 12)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                //______________________AGB________________________
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(children: [
                    Row(children: [
                      Text(
                        '*Mit der Registrierung akzeptiere ich die',
                        style: TextStyle(color: Colors.black45, fontSize: 10),
                      ),
                      Text(' AGB',
                          style: TextStyle(
                              color: Colors.redAccent[400], fontSize: 11)),
                      Text(' und',
                          style: TextStyle(color: Colors.black45, fontSize: 10))
                    ]),
                    SizedBox(
                      height: 4,
                    ),
                    Row(children: [
                      Text('Datenschutzbestimmungen',
                          style: TextStyle(
                              color: Colors.redAccent[400], fontSize: 11)),
                      Text(' von Foodo.',
                          style:
                              TextStyle(color: Colors.black45, fontSize: 10)),
                    ]),
                  ]),
                ),
                SizedBox(
                  height: 30,
                ),
                //__________________KUNDENKONTO_ERSTELLE___________
                Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    color: Colors.redAccent[400],
                    onPressed: signUp,
                    child: Text(
                      'KUNDENKONTO  ERSTELLE',
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

  String validateName(String value) {
    if (value.length < 3)
      return 'Name must be more than 2 charater';
    else
      return null;
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

  void signUp() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        print(_email);
        final User user = (await FirebaseAuth.instance
                .createUserWithEmailAndPassword(
                    email: _email, password: _password))
            .user;
        user.sendEmailVerification();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      } catch (e) {
        print(e.message);
      }
    }
  }
}