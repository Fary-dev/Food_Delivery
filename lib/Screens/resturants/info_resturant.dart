import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mjam/Contants/Color.dart';
import 'package:mjam/Widgets/Rating.dart';
import 'package:mjam/models_and_data/Class/models_and_data.dart';

import 'PageResturant/FavoritController.dart';
import 'Resturant_List/Clipper_Resturant_Photo.dart';

class InfoResturant extends StatefulWidget {
  final Resturant? resturant;

  const InfoResturant({this.resturant});

  @override
  State<InfoResturant> createState() => _InfoResturantState();
}

class _InfoResturantState extends State<InfoResturant> {
  UserAccount? userAccount;
  final FavoriteController favoritController = Get.put(FavoriteController());
  TabController? tabController;
  String? changeText;
  bool showBottomSheet = false;
  final userData = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).bottomAppBarTheme.color,
      body: NestedScrollView(
        physics: NeverScrollableScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: 350.0,
              elevation: 0,
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
                      favoritController.userFavoriteList
                                  .contains(widget.resturant) ==
                              true
                          ? CupertinoIcons.heart_fill
                          : CupertinoIcons.heart,
                      color: primaryColor,
                    ),
                    onPressed: () {
                      widget.resturant!.licked == null
                          ? widget.resturant!.licked = true
                          : widget.resturant!.licked = !widget.resturant!.licked!;
                      setState(() {});
                      if (widget.resturant!.licked == true) {
                        favoritController.userFavoriteList.add(widget.resturant!);
                      } else {
                        favoritController.userFavoriteList
                            .remove(widget.resturant);
                      }
                    },
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: ClipPath(
                  child: Image.asset(
                    widget.resturant!.photoInfoPage!,
                    height: 350.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  clipper: CliperHpmePageResturant(),
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
                  widget.resturant!.nameResturant!,
                  textAlign: TextAlign.left,
                  textScaleFactor: 1.5,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headline2!
                      .copyWith(fontSize: 16),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    rating(20.0, 105.0, 20.0,
                        Theme.of(context).bottomAppBarTheme.color!),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      widget.resturant!.ratingResturant.toString(),
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
                      " ca.${widget.resturant!.deliveryDuration}min",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).primaryTextTheme.headline3,
                    ),
                    SizedBox(width: 10),
                    Icon(
                      CupertinoIcons.location,
                      size: 20,
                    ),
                    Text(
                      "${(widget.resturant!.distance! / 1000).toStringAsFixed(1)} km",
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
                      "  \€ ${widget.resturant!.deliveryPrice}",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).primaryTextTheme.headline3,
                    ),
                    SizedBox(width: 15),
                    Icon(
                      CupertinoIcons.bag,
                      size: 20,
                    ),
                    Text(
                      "  \€ ${widget.resturant!.deliveryPrice}",
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
                      .headline3!
                      .copyWith(fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '${widget.resturant!.openingTime}',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subtitle1!
                      .copyWith(fontSize: 12.0),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Adresse',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headline3!
                      .copyWith(fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.resturant!.address.toString(),
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subtitle1!
                      .copyWith(fontSize: 12.0),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Eigentümer',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headline3!
                      .copyWith(fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.resturant!.owner!,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subtitle1!
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
