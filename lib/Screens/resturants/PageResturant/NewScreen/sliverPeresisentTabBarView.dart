import 'package:flutter/material.dart';
import 'package:mjam/models_and_data/Class/models_and_data.dart';

class SilverTabBarView extends SliverPersistentHeaderDelegate {
  final TabController? tabController;
  final Resturant? resturant;

  const SilverTabBarView(this.tabController,this.resturant);

  final double minHeight = 0;
  final double maxHeight = 230;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: LayoutBuilder(
      builder: (_, constraints) {
        return TabBarView(
          children: [
        for (int index = 0;
        index < resturant!.products!.length;)
            ListView(
              children: [
                for (Product product in resturant!.product!)
                  if (resturant!.products![index].id == product.id)
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text(product.nameProduct!),
                    ),
              ],
            ),
          ],
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
