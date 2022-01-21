import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mjam/Screens/Banner/Banr.dart';

class BannerScreen1 extends StatelessWidget {
<<<<<<< HEAD
<<<<<<< HEAD
  final BannerGeneraly bannerGeneraly;
  const BannerScreen1({
    Key key,
=======
  final BannerGeneraly? bannerGeneraly;
  const BannerScreen1({
    Key? key,
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
=======
  final BannerGeneraly? bannerGeneraly;
  const BannerScreen1({
    Key? key,
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
    this.bannerGeneraly,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
<<<<<<< HEAD
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
=======
    return Container(

      color: Theme.of(context).scaffoldBackgroundColor,
      child: InkWell(
        onTap: () => Get.back(),
        child: ListView(
          children: [
        SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              bannerGeneraly!.photo,
              fit: BoxFit.fitWidth,
            )),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            bannerGeneraly!.title,
            style: Theme.of(context)
                .primaryTextTheme
                .button!
                .copyWith(fontSize: 18),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            bannerGeneraly!.subtitle,
            style: Theme.of(context).primaryTextTheme.headline2,
          ),
=======
    return Container(

      color: Theme.of(context).scaffoldBackgroundColor,
      child: InkWell(
        onTap: () => Get.back(),
        child: ListView(
          children: [
        SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              bannerGeneraly!.photo,
              fit: BoxFit.fitWidth,
            )),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            bannerGeneraly!.title,
            style: Theme.of(context)
                .primaryTextTheme
                .button!
                .copyWith(fontSize: 18),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            bannerGeneraly!.subtitle,
            style: Theme.of(context).primaryTextTheme.headline2,
          ),
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
        ),
          ],
        ),
      ),
<<<<<<< HEAD
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
=======
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
    );
  }
}
