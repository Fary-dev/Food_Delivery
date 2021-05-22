import 'package:flutter/material.dart';

class BannerScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: SafeArea(
          child: Container(
            child: Center(
              child: Text('Loading!!'),
            ),
            height: double.infinity,
            width: double.infinity,
          ),
        ));
  }
}
