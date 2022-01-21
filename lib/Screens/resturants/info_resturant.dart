import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
<<<<<<< HEAD
=======
import 'package:get_storage/get_storage.dart';
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
import 'package:mjam/Contants/Color.dart';
import 'package:mjam/Sqlite/Database.dart';
import 'package:mjam/Sqlite/FavoriteModel.dart';
import 'package:mjam/Widgets/Rating.dart';
import 'package:mjam/models_and_data/Class/models_and_data.dart';

<<<<<<< HEAD
class InfoResturant extends StatefulWidget {
  final Resturant resturant;

 const InfoResturant({this.resturant});
=======
import 'PageResturant/FavoritController.dart';
import 'Resturant_List/Clipper_Resturant_Photo.dart';

class InfoResturant extends StatefulWidget {
  final Resturant? resturant;

  InfoResturant({Key? key, this.resturant}) : super(key: key);
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8

  @override
  State<InfoResturant> createState() => _InfoResturantState();
}

<<<<<<< HEAD
class _InfoResturantState extends State<InfoResturant> {
  bool likeBottumPress = false;

  TabController tabController;

  String changeText;

  bool showBottomSheet = false;
=======
final FavoriteController favoritController = Get.put(FavoriteController());

@override
void initState() {
  _refreshData();
}

void _refreshData() async {
  final data = await DB.getDataFavoriteList();

  favoritController.favoriteList.value = data;
}

_addToFavoriteList(Resturant res) async {
  FavoriteModel favoriteModel = FavoriteModel(
    name: '${res.nameResturant}',
    owner: '${res.owner}',
  );
  await DB.insertToFavoriteList(favoriteModel);
  favoriteModel.id = favoritController.favoriteList.isEmpty
      ? 0
      : favoritController
              .favoriteList[favoritController.favoriteList.length - 1].id! +
          1;
  _refreshData();
}

_removeFromFavoriteList(Resturant res) async {
  for (var a in favoritController.favoriteList) {
    if (a.name == res.nameResturant && a.owner == res.owner) {
      await DB.deleteFromFavoriteList(a.id!);
    }
  }
  _refreshData();
}

class _InfoResturantState extends State<InfoResturant> {
  UserAccount? userAccount;
  final FavoriteController favoritController = Get.put(FavoriteController());
  TabController? tabController;
  String? changeText;
  bool showBottomSheet = false;
  final userData = GetStorage();
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      backgroundColor: Theme.of(context).bottomAppBarTheme.color,
=======
      backgroundColor: Theme.of(context).primaryColor,
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
      body: NestedScrollView(
        physics: NeverScrollableScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: 350.0,
              elevation: 0,
              pinned: true,
<<<<<<< HEAD
              backgroundColor: Theme.of(context).bottomAppBarTheme.color,
=======
              backgroundColor: Theme.of(context).primaryColor,
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
              actions: [
                Container(
                  margin: EdgeInsets.only(left: 15),
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
<<<<<<< HEAD
                    color: Color(0xFFFFFFFF),
=======
                    color: Theme.of(context).primaryColor,
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
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
<<<<<<< HEAD
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
=======
                    color: Theme.of(context).primaryColor,
                  ),
                  child: IconButton(
                    icon: Obx(
                      () => Icon(
                        (favoritController.favoriteList.any((e) =>
                                    (e.name) ==
                                    widget.resturant!.nameResturant)) ==
                                true
                            ? CupertinoIcons.heart_fill
                            : CupertinoIcons.heart,
                        color: primaryColor,
                      ),
                    ),
                    onPressed: () {
                      (favoritController.favoriteList.any((e) =>
                                  (e.name) ==
                                  widget.resturant!.nameResturant!)) ==
                              true
                          ? _removeFromFavoriteList(widget.resturant!)
                          : _addToFavoriteList(widget.resturant!);
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
                    },
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
<<<<<<< HEAD
                background: Hero(tag:widget.resturant.photoResturant,
                  child: Image.asset(
                    widget.resturant.photoInfoPage,
=======
                background: ClipPath(
                  child: Image.asset(
                    widget.resturant!.photoInfoPage!,
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
                    height: 350.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
<<<<<<< HEAD
=======
                  clipper: CliperHpmePageResturant(),
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
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
<<<<<<< HEAD
                  widget.resturant.nameResturant,
=======
                  widget.resturant!.nameResturant!,
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
                  textAlign: TextAlign.left,
                  textScaleFactor: 1.5,
                  style: Theme.of(context)
                      .primaryTextTheme
<<<<<<< HEAD
                      .headline2
=======
                      .headline2!
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
                      .copyWith(fontSize: 16),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
<<<<<<< HEAD
                    rating(20.0, 105.0, 20.0,
                        Theme.of(context).bottomAppBarTheme.color),
=======
                    rating(5.0, 0.0, 15.0, Colors.amber),
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
                    SizedBox(
                      width: 5,
                    ),
                    Text(
<<<<<<< HEAD
                      widget.resturant.ratingResturant.toString(),
=======
                      widget.resturant!.ratingResturant.toString(),
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
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
<<<<<<< HEAD
                      " ca.${widget.resturant.deliveryDuration}min",
=======
                      " ca.${widget.resturant!.deliveryDuration}min",
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
                      textAlign: TextAlign.center,
                      style: Theme.of(context).primaryTextTheme.headline3,
                    ),
                    SizedBox(width: 10),
                    Icon(
                      CupertinoIcons.location,
                      size: 20,
                    ),
                    Text(
<<<<<<< HEAD
                      "${(widget.resturant.distance / 1000).toStringAsFixed(1)} km",
=======
                      "${(widget.resturant!.distance! / 1000).toStringAsFixed(1)} km",
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
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
<<<<<<< HEAD
                      "  \€ ${widget.resturant.deliveryPrice}",
=======
                      "  \€ ${widget.resturant!.deliveryPrice}",
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
                      textAlign: TextAlign.center,
                      style: Theme.of(context).primaryTextTheme.headline3,
                    ),
                    SizedBox(width: 15),
                    Icon(
                      CupertinoIcons.bag,
                      size: 20,
                    ),
                    Text(
<<<<<<< HEAD
                      "  \€ ${widget.resturant.deliveryPrice}",
=======
                      "  \€ ${widget.resturant!.deliveryPrice}",
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
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
<<<<<<< HEAD
                      .headline3
=======
                      .headline3!
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
                      .copyWith(fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
<<<<<<< HEAD
                  '${widget.resturant.openingTime}',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subtitle1
=======
                  '${widget.resturant!.openingTime}',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subtitle1!
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
                      .copyWith(fontSize: 12.0),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Adresse',
                  style: Theme.of(context)
                      .primaryTextTheme
<<<<<<< HEAD
                      .headline3
=======
                      .headline3!
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
                      .copyWith(fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
<<<<<<< HEAD
                  widget.resturant.address.toString(),
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subtitle1
=======
                  widget.resturant!.address.toString(),
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subtitle1!
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
                      .copyWith(fontSize: 12.0),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Eigentümer',
                  style: Theme.of(context)
                      .primaryTextTheme
<<<<<<< HEAD
                      .headline3
=======
                      .headline3!
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
                      .copyWith(fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
<<<<<<< HEAD
                  widget.resturant.owner,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subtitle1
=======
                  widget.resturant!.owner!,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subtitle1!
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
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
