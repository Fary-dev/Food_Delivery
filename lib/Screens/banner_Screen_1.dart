import 'package:flutter/material.dart';

class BannerScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[200],
          elevation: 0,
        ),
        body: SafeArea(
          child: Container(
            child: Center(
              child: Text('Loading!!'),
            ),
            height: double.infinity,
            width: double.infinity,
            color: Colors.grey[200],
          ),
        ));
  }
}
