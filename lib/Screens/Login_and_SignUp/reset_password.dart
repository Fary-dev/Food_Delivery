import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mjam/Contants/Color.dart';
import 'package:mjam/Widgets/customTextField.dart';

import 'login_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextStyle txtBtnStyle = TextStyle(color: Colors.black, fontSize: 16);
  final _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;


  @override
  void initState() {
    _emailController.addListener(() {setState(() {});});
    super.initState();
  }
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Kennwort zrücksetzen', style: Theme.of(context).primaryTextTheme.button,),
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              CupertinoIcons.arrow_left,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              //__________________Foode_Kundenkonto_erstellen____
              Text(
                'Password vergassen?',
                style: Theme.of(context).primaryTextTheme.headline2,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Gib Deine EMailAdresse unten ein und wir senden dir eine E-Mail mit weiteren Infos Zürucksetzung Deines Kontos.',
                style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5),
              ),
              SizedBox(
                height: 40,
              ),
              //________________________________________E-Mail_______
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: CustomTextField(
                  lable: 'E-Mail',
                  controller: _emailController,
                  obscureText: false,
                  inputFormatters:[
                    FilteringTextInputFormatter.deny(RegExp(r"[]")),
                  ],
                  textInputType:TextInputType.emailAddress,
                  onSave: (input) =>setState((){ _emailController.text = input!;}),
                  suffixIcon:_emailController.text.isNotEmpty?IconButton(onPressed: (){ _emailController.clear();}, icon: Icon(CupertinoIcons.clear,size: 18,)):Container() ,
                  prefixIcon:Icon(
                    CupertinoIcons.mail,
                    color: Colors.grey[500],
                    size: 18,
                  ),
                validator:validateEmail ,
                ),
                /*TextFormField(
                  inputFormatters: [FilteringTextInputFormatter.deny(
                       RegExp(r"\s\b|\b\s")
                  )],
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headline3!
                      .apply(fontSizeDelta: 2),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'E-Mail',
                    suffixIcon: Icon(
                      CupertinoIcons.mail,
                      color: Colors.grey[500],
                      size: 18,
                    ),
                  ),
                  validator: validateEmail,
                  onSaved: (input) => _email = input!.trim(),
                  controller: _emailController,
                ),*/
              ),
              SizedBox(
                height: 40,
              ),
              //__________________KUNDENKONTO_ERSTELLE___________
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 40,
                child: MaterialButton(
                  color: primaryColor,
                  onPressed: resetPassword,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Text(
                    'SCHICKE MIR MEIN PASSWORT',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .button!
                        .copyWith(fontSize: 14, color: Color(0xFFFFFFFF)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


   String? validateEmail(String? value) {
    final pattern=(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!))
      return 'Enter Valid Email';
    else
      return null;
  }

  Future<void> resetPassword() async {
    final formState = _formKey.currentState;
    print(formState!.validate());
    if (formState.validate()) {
      formState.save();
      try {
        await auth.sendPasswordResetEmail(email: _emailController.text);
        Get.offAll(()=> LoginScreen());
      } catch (e) {
        e.printError();
      }
    }
  }
}

