import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mjam/Screens/Resturants/info_resturant.dart';
import 'package:mjam/Widgets/Rating.dart';
import 'package:mjam/models_and_data/Class/models_and_data.dart';

class TestPageHeaderInfo extends SliverPersistentHeaderDelegate {
  final Resturant? resturant;
   TestPageHeaderInfo(this.resturant);

  final double minHeight = 50;
  final double maxHeight = 105;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(

      child: LayoutBuilder(
        builder: (_, constraints) {
          double a = 1 -
              ((constraints.biggest.height - minHeight) /
                  (maxHeight - minHeight));

          return a < 0.1
              ? Container(
                  child: Opacity(
                    opacity: 1 - a,
                    child: ListView(
                      children: <Widget>[

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Text(
                                resturant!.nameResturant!,
                                textAlign: TextAlign.left,
                                textScaleFactor: 1.5,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headline2,
                              ),
                              IconButton(
                                icon: Icon(
                                  CupertinoIcons.info_circle,
                                  size: 35,
                                ),
                                onPressed: () {
                                  Get.to(
                                      InfoResturant(resturant: resturant!));
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              rating(5.0, 0.0, 15.0, Colors.amber),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                resturant!.ratingResturant.toString(),
                                textAlign: TextAlign.left,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headline3,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                CupertinoIcons.timer,
                                size: 20,
                              ),
                              Text(
                                " ca.${resturant!.deliveryDuration}min",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headline3,
                              ),
                              SizedBox(width: 10),
                              Icon(
                                CupertinoIcons.location,
                                size: 20,
                              ),
                              Text(
                                "${(resturant!.distance! / 1000).toStringAsFixed(1)} km",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headline3,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                )
              : Container(
                  color: Theme.of(context).primaryColor,
                  child: Container(
                    color: Theme.of(context).primaryColor,
                    alignment: Alignment.center,
                    height: 54,
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      resturant!.nameResturant!,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .button!
                          .copyWith(fontSize: 16),
                    ),
                  ),
                );
        },
      ),
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return maxExtent != oldDelegate.maxExtent ||
        minExtent != oldDelegate.minExtent;
  }
}
