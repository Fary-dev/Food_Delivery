import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mjam/Contants/Color.dart';
import 'package:mjam/Widgets/Rating.dart';
import 'package:mjam/models_and_data/Class/models_and_data.dart';

// ignore: must_be_immutable
class InfoResturant extends StatefulWidget {
  final Resturant resturant;

  InfoResturant(this.resturant);

  @override
  State<InfoResturant> createState() => _InfoResturantState();
}

class _InfoResturantState extends State<InfoResturant> {
  bool likeBottumPress = false;

  TabController tabController;

  String changeText;

  bool showBottomSheet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).bottomAppBarTheme.color,
      body: NestedScrollView(
        physics: NeverScrollableScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 350.0,
              elevation: 20,
              pinned: true,
              backgroundColor: Theme.of(context).bottomAppBarTheme.color,
              actions: [
                Container(
                  margin: EdgeInsets.only(left: 15),
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFFFFFF),
                  ),
                  child: IconButton(
                      icon: Icon(
                        CupertinoIcons.arrow_left,
                        color: primaryColor,
                      ),
                      onPressed: () {
                        Get.back();
                      }),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(right: 15),
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFFFFFF),
                  ),
                  child: IconButton(
                    icon: Icon(
                      likeBottumPress
                          ? CupertinoIcons.heart_fill
                          : CupertinoIcons.heart,
                      color: primaryColor,
                    ),
                    onPressed: () {
                      setState(
                        () {
                          likeBottumPress = !likeBottumPress;
                        },
                      );
                    },
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Container(
                  height: 350.0,
                  width: double.infinity,
                  child: Image.asset(
                    widget.resturant.photoInfoPage.toString(),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          ];
        },
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.resturant.nameResturant,
                  textAlign: TextAlign.left,
                  textScaleFactor: 1.5,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headline2
                      .copyWith(fontSize: 16),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    rating(20.0, 105.0, 20.0,
                        Theme.of(context).bottomAppBarTheme.color),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      widget.resturant.ratingResturant.toString(),
                      textAlign: TextAlign.left,
                      style: Theme.of(context).primaryTextTheme.headline3,
                    ),
                  ],
                ),
                SizedBox(
                  height: 7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.timer,
                      // Icons.timer_outlined,
                      size: 20,
                    ),
                    Text(
                      " ca.${widget.resturant.deliveryDuration}min",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).primaryTextTheme.headline3,
                    ),
                    SizedBox(width: 10),
                    Icon(
                      CupertinoIcons.location,
                      size: 20,
                    ),
                    Text(
                      "${(widget.resturant.distance / 1000).toStringAsFixed(1)} km",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).primaryTextTheme.headline3,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.money_euro_circle,
                      size: 20,
                    ),
                    Text(
                      "  \€ ${widget.resturant.deliveryPrice}",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).primaryTextTheme.headline3,
                    ),
                    SizedBox(width: 15),
                    Icon(
                      CupertinoIcons.bag,
                      size: 20,
                    ),
                    Text(
                      "  \€ ${widget.resturant.deliveryPrice}",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).primaryTextTheme.headline3,
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Öffnungszeiten',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headline3
                      .copyWith(fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '${widget.resturant.openingTime}',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subtitle1
                      .copyWith(fontSize: 12.0),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Adresse',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headline3
                      .copyWith(fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.resturant.address.toString(),
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subtitle1
                      .copyWith(fontSize: 12.0),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Eigentümer',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headline3
                      .copyWith(fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.resturant.owner,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subtitle1
                      .copyWith(fontSize: 14.0),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
