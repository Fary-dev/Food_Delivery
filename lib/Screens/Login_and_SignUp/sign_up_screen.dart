import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mjam/Contants/Color.dart';
import 'package:mjam/Screens/BootomNavBar/BottomNavBarWidget.dart';
import 'package:mjam/Widgets/customTextField.dart';
import 'auch_with_Google.dart';
import 'auch_with_facebook.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final LoginFacebook loginFacebook = Get.put(LoginFacebook());
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final userData = GetStorage();
  bool showPassword = false;

  void click() {
    setState(() {
      signInWithGoogle().whenComplete(() => Get.to(BottomNavBarWidget()));
    });
  }

  @override
  void initState() {
    showPassword = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Kundenkonto erstellen',
            style: Theme.of(context).primaryTextTheme.button,
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              CupertinoIcons.arrow_left,
              color: Theme.of(context).primaryIconTheme.color,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                //__________________Foode_Kundenkonto_erstellen____
                Row(
                  children: [
                    Text(
                      'Foodo',
                      style: TextStyle(
                          fontSize: 15,
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5),
                    ),
                    Text(' Kundenkonto erstellen',
                        style: Theme.of(context).primaryTextTheme.headline2),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                //____________________Facebook_____Google__________
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //___________________Facebook_______________
                    Expanded(
                      flex: 25,
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        color: Theme.of(context).cardColor,
                        onPressed: () {
                          loginFacebook.signInFacebook().whenComplete(() =>
                              Get.defaultDialog(
                                  barrierDismissible: false,
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  title: '',
                                  content: Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 50,
                                        backgroundImage: NetworkImage(
                                            (userData.read('photo'))),
                                      ),
                                      SizedBox(height: 30),
                                      Center(
                                          child: Text(userData.read('userName'),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .button)),
                                      SizedBox(height: 30),
                                      ElevatedButton.icon(
                                        style: Theme.of(context)
                                            .elevatedButtonTheme
                                            .style,
                                        label: Text(
                                          'OK',
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .button,
                                        ),
                                        icon: Icon(
                                          CupertinoIcons.checkmark_alt,
                                          color: Color(0xFF10D401),
                                        ),
                                        onPressed: () =>
                                            Get.to(BottomNavBarWidget()),
                                      ),
                                    ],
                                  )));
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
                            Text('Facebook',
                                style:
                                    Theme.of(context).primaryTextTheme.button),
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
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        color: Theme.of(context).cardColor,
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  image: DecorationImage(
                                    image: AssetImage('assets/google.png'),
                                  )),
                              height: 30,
                              width: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Google',
                                style:
                                    Theme.of(context).primaryTextTheme.button),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                //____________________________Oder_________________
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 2,
                        color: Theme.of(context).hoverColor,
                        margin: EdgeInsets.only(right: 15),
                        child: Divider(
                          color: Colors.black26,
                          height: 25,
                        ),
                      ),
                    ),
                    Text(
                      'oder',
                      style: TextStyle(
                        fontSize: 13,
                        color: Theme.of(context).hoverColor,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 2,
                        color: Theme.of(context).hoverColor,
                        margin: EdgeInsets.only(left: 10),
                        child: Divider(
                          color: Colors.black26,
                          height: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                //_____________________Mit E-Mail registrieren_____
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Mit E-Mail registrieren',
                    style: Theme.of(context).primaryTextTheme.headline2,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                //_____________________Name_E-Mail_Password________
                Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      CustomTextField(
                        lable: 'Name',
                        controller: _nameController,
                        validator: validateName,
                        onSave: (String? value) {
                          _nameController.text = value!.trim();
                        },
                        prefixIcon: Icon(
                          CupertinoIcons.person,
                          color: Colors.grey[500],
                          size: 18,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s"))
                        ],
                      ),
                      SizedBox(height: 10),
                      CustomTextField(
                        textInputType: TextInputType.emailAddress,
                        lable: 'E-Mail',
                        obscureText: false,
                        controller: _emailController,
                        validator: validateEmail,
                        onSave: (String? value) {
                          _emailController.text = value!.trim();
                        },
                        prefixIcon: Icon(
                          CupertinoIcons.mail,
                          color: Colors.grey[500],
                          size: 18,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s"))
                        ],
                      ),

                      SizedBox(height: 10),
                      CustomTextField(
                        lable: 'Password',
                        obscureText: !showPassword ? true : false,
                        controller: _passController,
                        onSave: (String? value) {
                          _passController.text = value!.trim();
                        },
                        prefixIcon: !showPassword
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    showPassword = true;
                                  });
                                },
                                icon: Icon(
                                  CupertinoIcons.eye,
                                  size: 20,
                                  color: Colors.grey[500],
                                ),
                              )
                            : IconButton(
                                onPressed: () {
                                  setState(() {
                                    showPassword = false;
                                  });
                                },
                                icon: Icon(
                                  CupertinoIcons.eye_slash,
                                  color: Colors.grey[500],
                                ),
                              ),
                        validator: validatePassword,
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s"))
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                //______________________AGB________________________
                Column(children: [
                  Row(children: [
                    Text(
                      '*Mit der Registrierung akzeptiere ich die',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headline2!
                          .copyWith(fontSize: 11),
                    ),
                    Text(' AGB',
                        style: TextStyle(color: primaryColor, fontSize: 11)),
                    Text(
                      ' und',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headline2!
                          .copyWith(fontSize: 11),
                    )
                  ]),
                  SizedBox(
                    height: 4,
                  ),
                  Row(children: [
                    Text('Datenschutzbestimmungen',
                        style: TextStyle(color: primaryColor, fontSize: 11)),
                    Text(
                      ' von Foodo.',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headline2!
                          .copyWith(fontSize: 11),
                    ),
                  ]),
                ]),
                SizedBox(
                  height: 70,
                ),
                //__________________KUNDENKONTO_ERSTELLE___________
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  child: MaterialButton(
                    color: primaryColor,
                    onPressed: signUp,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Text('KUNDENKONTO  ERSTELLE',
                        style: Theme.of(context)
                            .primaryTextTheme
                            .button!
                            .copyWith(fontSize: 14, color: Color(0xFFFFFFFF))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? validateName(String? value) {
    return value!.length < 3 ? 'Name muss mehr als 2 Charakter sein' : null;
  }

  String? validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    return !regex.hasMatch(value!)
        ? 'Bitte gib eine gültige E-Mail-Adresse ein'
        : null;
  }

  String? validatePassword(String? value) {
    String pattern = r'^(?=.*\d)(?=.*[a-zA-Z])[a-zA-Z0-9!@#$%&*]{6,20}$';
    RegExp regex = new RegExp(pattern);
    return value!.isEmpty
        ? 'Bitte Ihre password hinzufügen'
        : !regex.hasMatch(value)
            ? 'Bitte gib eine gültige Password ein'
            : null;
  }

 void signUp() async {
    try {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();

        final User? user = (await FirebaseAuth.instance
                .createUserWithEmailAndPassword(
                    email: _emailController.text,
                    password: _passController.text))
            .user;
        userData.write('userName', _nameController.text);
        userData.write('method', 'signUp');
        userData.write('isLogged', true);
        user!.sendEmailVerification();
        Get.to(BottomNavBarWidget());
        // assert(user != null);
        // assert(await user.getIdToken() != null);
        var a = await user.getIdToken();
        print(a);
        // return user;
      }
    } catch (e) {
      e.printError();
      // return null;
    }
  }

}
