import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mjam/Contants/Color.dart';
import 'package:mjam/Widgets/Rating.dart';
import 'package:mjam/models_and_data/Class/models_and_data.dart';

// ignore: must_be_immutable
class InfoResturant extends StatelessWidget {
  final Resturant resturant;

  InfoResturant(this.resturant);

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
                SizedBox(
                  width: 15,
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor,
                  ),
                  child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: primaryColor,
                      ),
                      onPressed: () {
                        Get.back();
                      }),
                ),
                Spacer(),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor,
                  ),
                  child: IconButton(
                    icon: Icon(
                        likeBottumPress
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: likeBottumPress ? primaryColor : primaryColor),
                    onPressed: () {
                      likeBottumPress = !likeBottumPress;
                    },
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Container(
                  height: 350.0,
                  width: double.infinity,
                  child: Image.asset(
                    resturant.photoInfoPage.toString(),
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
                  resturant.nameResturant,
                  textAlign: TextAlign.left,
                  textScaleFactor: 1.5,
                  style: Theme.of(context).primaryTextTheme.headline2.copyWith(fontSize: 16),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(

                      height: 20,
                      width: 100,
                      child: Rating(),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      resturant.ratingResturant.toString(),
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
                      Icons.timer_outlined,
                      size: 20,
                    ),
                    Text(
                      " ca.${resturant.deliveryDuration}min",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).primaryTextTheme.headline3,
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.location_on_outlined,
                      size: 20,
                    ),
                    Text(
                      "${(resturant.distance / 1000).toStringAsFixed(1)} km",
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
                      Icons.delivery_dining,
                      size: 20,
                    ),
                    Text(
                      "  \€ ${resturant.deliveryPrice}",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).primaryTextTheme.headline3,
                    ),
                    SizedBox(width: 15),
                    Icon(
                      Icons.shopping_bag_outlined,
                      size: 20,
                    ),
                    Text(
                      "  \€ ${resturant.deliveryPrice}",
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
                  '${resturant.openingTime}',
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
                  resturant.address.toString(),
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
                  resturant.owner,
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
/*

NestedScrollView(
headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
return [
SliverAppBar(

flexibleSpace: FlexibleSpaceBar(

collapseMode: CollapseMode.pin,
background: Column(
mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Stack(
children: [
Container(
height: 350.0,
width: double.infinity,
child: Image.asset(
resturant.photoInfoPage.toString(),
fit: BoxFit.cover,
),
),
Positioned(
top: 53,
left: 4,
child: Container(
height: 40,
width: 40,
decoration: BoxDecoration(
shape: BoxShape.circle,
color:
Theme.of(context).bottomAppBarTheme.color),
child: IconButton(
icon: Icon(
Icons.arrow_back,
size: 30,
color: primaryColor,
),
onPressed: () {
Navigator.pop(context);
}),
),
)
],
),
Padding(
padding: EdgeInsets.all(0),
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Container(
padding: EdgeInsets.all(15),
alignment: Alignment.topLeft,
child: Text(
resturant.nameResturant,
textAlign: TextAlign.left,
textScaleFactor: 1.5,
style:
Theme.of(context).primaryTextTheme.headline2,
),
),
],
),
),
Container(
padding: EdgeInsets.only(left: 15),
child: Row(
children: [
Container(
height: 20,
width: 100,
child: Rating(),
),
SizedBox(
width: 5,
),
Text(
resturant.ratingResturant.toString(),
textAlign: TextAlign.left,
style: Theme.of(context).primaryTextTheme.headline3,
),
],
),
),
SizedBox(
height: 7,
),
Container(
margin: EdgeInsets.only(top: 5, left: 15),
child: Row(
mainAxisAlignment: MainAxisAlignment.start,
children: [
Container(
padding: EdgeInsets.only(left: 0),
child: Icon(
Icons.timer_outlined,
size: 20,
)),
Container(
alignment: Alignment.centerLeft,
child: Text(
" ca.${resturant.deliveryDuration}min",
textAlign: TextAlign.center,
style:
Theme.of(context).primaryTextTheme.headline3,
),
),
SizedBox(width: 10),
Container(
padding: EdgeInsets.only(left: 0),
child: Icon(
Icons.location_on_outlined,
size: 20,
)),
Container(
alignment: Alignment.centerLeft,
child: Text(
"${(resturant.distance / 1000).toStringAsFixed(1)} km",
textAlign: TextAlign.center,
style:
Theme.of(context).primaryTextTheme.headline3,
),
),
],
),
),
SizedBox(
height: 5,
),
Container(
margin: EdgeInsets.only(top: 5, left: 15),
child: Row(
mainAxisAlignment: MainAxisAlignment.start,
children: [
Container(
padding: EdgeInsets.only(left: 0),
child: Icon(
Icons.delivery_dining,
size: 20,
)),
Container(
alignment: Alignment.centerLeft,
child: Text(
"  \€ ${resturant.deliveryPrice}",
textAlign: TextAlign.center,
style:
Theme.of(context).primaryTextTheme.headline3,
),
),
SizedBox(width: 15),
Container(
child: Icon(
Icons.shopping_cart_outlined,
size: 20,
)),
Container(
alignment: Alignment.centerLeft,
child: Text(
"  \€ ${resturant.deliveryPrice}",
textAlign: TextAlign.center,
style:
Theme.of(context).primaryTextTheme.headline3,
),
),
],
),
),
SizedBox(
height: 20,
),
Padding(
padding: const EdgeInsets.only(left: 15),
child: Text(
'Öffnungszeiten',
style: TextStyle(
fontSize: 18, fontWeight: FontWeight.bold),
),
),
SizedBox(
height: 10,
),
Padding(
padding: const EdgeInsets.only(left: 15),
child: Text(
'${resturant.openingTime}',
style: TextStyle(fontSize: 14, color: greyColor),
),
),
SizedBox(
height: 20,
),
Padding(
padding: const EdgeInsets.only(left: 15),
child: Text(
'Adresse',
style: TextStyle(
fontSize: 18, fontWeight: FontWeight.bold),
),
),
SizedBox(
height: 10,
),
Padding(
padding: const EdgeInsets.only(left: 15),
child: Text(
resturant.address.toString(),
style: TextStyle(fontSize: 14, color: greyColor),
),
),
SizedBox(
height: 20,
),
Padding(
padding: const EdgeInsets.only(left: 15),
child: Text(
'Eigentümer',
style: TextStyle(
fontSize: 18, fontWeight: FontWeight.bold),
),
),
SizedBox(
height: 10,
),
Padding(
padding: const EdgeInsets.only(left: 15),
child: Text(
resturant.owner,
style: TextStyle(fontSize: 14, color: greyColor),
),
)
],
),
)),
];
},
),
   */
