
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class Rating extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: rating(20.0, 105.0, 20.0,Theme.of(context).bottomAppBarTheme.color)),
    );
  }

}

Widget rating(double height, width, size,Color color) {
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
          filledIconData: Icons.star,
          halfFilledIconData: Icons.star_half,
          defaultIconData: Icons.star_border,
          starCount: 5,
          allowHalfRating: true,
          spacing: 0.0,
          onRated: (value) {
            print("rating value -> $value");
            // print("rating value dd -> ${value.truncate()}");
          },
        )),
  );
}
