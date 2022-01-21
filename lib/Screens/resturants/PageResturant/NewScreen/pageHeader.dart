import 'package:flutter/material.dart';
import 'package:mjam/Screens/Resturants/Resturant_List/Clipper_Resturant_Photo.dart';
import 'package:mjam/models_and_data/Class/models_and_data.dart';

class TestPageHeader extends SliverPersistentHeaderDelegate {
  final Resturant? resturant;

  const TestPageHeader(this.resturant);

  final double minHeight = 0;
  final double maxHeight = 230;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: LayoutBuilder(
      builder: (_, constraints) {
        return
          Opacity(
            opacity:constraints.biggest.height/maxHeight ,

            child: Container(
              // color: Theme.of(context).primaryColor,
              child: ClipPath(
                child: Image.asset(
                  resturant!.photoResturant!,
                  // height: 230.0,
                  // width: double.infinity,
                  fit: BoxFit.cover,

                ),
                clipper: CliperHpmePageResturant(),

              ),
            ),
          );
      },
    ));
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
