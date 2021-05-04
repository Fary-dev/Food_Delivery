import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mjam/Screens/Login_and_SignIn/login_screen.dart';

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
  String _email, _password;

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
                  child: Row(
                    children: [
                      Text(
                        'Foodo',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.red[700],
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
                    'Mit E-Mail registrieren',
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
                Form(
                  key: _formKey,
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(12)),
                          child: TextFormField(
                            controller: _nameController,
                            style: txtBtnStyle,
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
                              borderRadius: BorderRadius.circular(12)),
                          child: TextFormField(
                            controller: _emailController,
                            style: txtBtnStyle,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value.isEmpty || !value.contains('@')) {
                                return 'Invalid email';
                              }
                              return null;
                            },
                            onSaved: (value) {
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
                              borderRadius: BorderRadius.circular(12)),
                          child: TextFormField(
                            controller: _passController,
                            obscureText: true,
                            style: txtBtnStyle,
                            validator: (value) {
                              if (value.isEmpty || value.length < 8) {
                                return 'Inwalid password';
                              }
                              return null;
                            },
                            onSaved: (value) {
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
                    color: Colors.white,
                    onPressed: signUp,
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
              ],
            ),
          ),
        )
      ],
    );
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
