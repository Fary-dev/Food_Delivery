import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliverPersistentHeaderDelegateTabBar extends SliverPersistentHeaderDelegate {
  final  TabBar? tabBar;
  const SliverPersistentHeaderDelegateTabBar(this.tabBar);

  final double minHeight = 50;
  final double maxHeight = 50;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {

    return SizedBox.expand(child: LayoutBuilder(
      builder: (_, constraints) {
        return Container(
            color: Theme.of(context).primaryColor,
            child: tabBar!);
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