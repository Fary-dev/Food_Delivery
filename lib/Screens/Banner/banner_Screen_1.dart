import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mjam/Screens/Banner/Banr.dart';

class BannerScreen1 extends StatelessWidget {
  final BannerGeneraly bannerGeneraly;
  const BannerScreen1({
    Key key,
    this.bannerGeneraly,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.back(),
      child: Scaffold(
          body: Column(
        children: [
          SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                bannerGeneraly.photo,
                fit: BoxFit.fitWidth,
              )),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              bannerGeneraly.title,
              style: Theme.of(context)
                  .primaryTextTheme
                  .button
                  .copyWith(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              bannerGeneraly.subtitle,
              style: Theme.of(context).primaryTextTheme.headline2,
            ),
          ),
        ],
      )),
    );
  }
}
