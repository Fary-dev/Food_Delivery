import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BannerScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back)),
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
