import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

<<<<<<< HEAD
<<<<<<< HEAD
class Rating extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return rating(20.0, 105.0, 20.0, Theme.of(context).bottomAppBarTheme.color);
  }
}

Widget rating(double height, width, size, Color color) {
  return Container(
    margin: EdgeInsets.all(0),
    color: color,
    height: height,
    width: width,
    child: Center(
        child: SmoothStarRating(
      color: Colors.yellow,
      borderColor: Colors.yellow,
      rating: 5.0,
      isReadOnly: false,
      size: size,
      filledIconData: CupertinoIcons.star_fill,
      halfFilledIconData: CupertinoIcons.star_lefthalf_fill,
      defaultIconData: CupertinoIcons.star,
      starCount: 5,
      allowHalfRating: true,
      spacing: 0.0,
      onRated: (value) {
        print("rating value -> $value");
        // print("rating value dd -> ${value.truncate()}");
      },
    )),
=======
=======
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
Widget rating( height, padding, size, Color color) {
  return RatingBar.builder(
    initialRating: height,
    itemSize: size,
    minRating: 1,
    direction: Axis.horizontal,
    itemCount: 5,
    itemPadding: EdgeInsets.all(padding),
    itemBuilder: (context, _) => Icon(
      CupertinoIcons.star_fill,
      color: color,
    ),
    onRatingUpdate: (rating) {
      print(rating);
    },
<<<<<<< HEAD
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
=======
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
  );
}
