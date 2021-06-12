import 'package:flutter/cupertino.dart';
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
              icon: Icon(CupertinoIcons.arrow_left)),
          elevation: 0,
        ),
        body: SafeArea(
          child: Container(
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Loding...',
                      style: Theme.of(context).primaryTextTheme.headline2,
                    ),
                  ),
                ],
              ),
            ),
            height: double.infinity,
            width: double.infinity,
          ),
        ));
  }
}
