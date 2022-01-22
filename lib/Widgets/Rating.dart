import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
  );
}
