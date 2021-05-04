import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mjam/Widgets/BottomNavBarWidget.dart';

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
                    'Anmelden',
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
                            print('Google');
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
                SizedBox(
                  height: 15,
                ),
                //____________________Mit Apple anmelden___________
                Container(
                  height: 45,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    color: Colors.white,
                    onPressed: () {
                      print('Mit Apple anmelden');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 7),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage('assets/apple.png'),
                          )),
                          height: 15,
                          width: 15,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Mit Apple anmelden',
                          style: TextStyle(
                              color: Colors.black,
                              letterSpacing: 0.5,
                              fontSize: 16),
                        ),
                      ],
                    ),
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
                    'Mit E-Mail einloggen',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
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
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(12)),
                          child: TextFormField(
                            // ignore: missing_return
                            validator: (input) {
                              if (input.length < 8) {
                                return 'Please insert your email';
                              }
                            },
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
                        SizedBox(height: 10),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(12)),
                          child: TextFormField(
                            // ignore: missing_return
                            validator: validateEmail,
                            onSaved: (input) => _password = input,
                            controller: _passwordController,
                            obscureText: true,
                            style: txtBtnStyle,
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
                  height: 40,
                ),
                //__________________KUNDENKONTO_ERSTELLE___________
                Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    color: Colors.white,
                    onPressed: signin,
                    child: Text(
                      'KUNDENKONTO  ERSTELLE',
                      style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    'Password vergessen?',
                    style: TextStyle(color: Colors.red[700], fontSize: 15),
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
