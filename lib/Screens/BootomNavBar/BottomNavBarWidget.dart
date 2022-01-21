import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mjam/Contants/Color.dart';
import 'package:mjam/Screens/BootomNavBar/bottom_Navigation_bar/FavoritScreen.dart';
import 'package:mjam/Screens/BootomNavBar/bottom_Navigation_bar/Shopping/shopping_Controller.dart';
import 'package:mjam/Screens/BootomNavBar/bottom_Navigation_bar/search_Screen.dart';
import 'package:mjam/Screens/Menu_Screen/Menu.dart';
import 'package:mjam/Sqlite/Database.dart';
import 'package:mjam/Sqlite/OrderModel.dart';

import 'bottom_Navigation_bar/Profil.dart';
import 'bottom_Navigation_bar/Shopping/shopping_carts.dart';


class BottomNavBarWidget extends StatefulWidget {
  BottomNavBarWidget({Key? key}) : super(key: key);

  @override
  _BottomNavBarWidgetState createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  final ShoppingCartController shoppingCartController =
  Get.put(ShoppingCartController());
  PageController pageController = PageController();

  int _selectedIndex = 0;
  final screens = <Widget>[
    Menu(),
    Searching(),
    FavoriteScreen(),
    ShoppingCarts(),
    Profil(),
  ];

  onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _refreshDataOrderList() async {
    final data = await DB.getDataOrderCard();
    shoppingCartController.orderList.value = data;
    _refreshSetList();
  }

  _refreshSetList() {
    shoppingCartController.orderSet.clear();

    final Map<String, OrderModel> profileMap = new Map();
    shoppingCartController.orderList.forEach((item) {
      profileMap[item.nameProduct] = item;
    });
    shoppingCartController.orderSet.value=profileMap.values.toList();
    shoppingCartController
        .setTextFieldController(shoppingCartController.orderSet.length);
  }

  @override
  void initState() {
    super.initState();
    _refreshDataOrderList();
  }
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageTransitionSwitcher(
          duration: Duration(milliseconds: 300),
          transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
            return FadeThroughTransition(
              child: child,
              animation: primaryAnimation,
              secondaryAnimation: secondaryAnimation,
            );
          },
          child: screens[_selectedIndex],

        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: primaryColor,
          unselectedItemColor: Theme.of(context).primaryIconTheme.color,
          items: [
            BottomNavigationBarItem(

              // ignore: deprecated_member_use
              label: 'null',
              icon: ImageIcon(AssetImage('assets/bottomNavBar/service.png')),
            ),
            BottomNavigationBarItem(
              // ignore: deprecated_member_use
              label: 'null',
              icon: ImageIcon(AssetImage('assets/bottomNavBar/search.png')),
            ),
            BottomNavigationBarItem(
              // ignore: deprecated_member_use
              label: 'null',
              icon: ImageIcon(AssetImage('assets/bottomNavBar/favo.png')),
            ),
            BottomNavigationBarItem(
              // ignore: deprecated_member_use
              label: 'null',
              icon: Stack(
                children: <Widget>[
                  ImageIcon(AssetImage('assets/bottomNavBar/shop.png')),
                  Obx(
                    () => Positioned(
                      top: 0,
                      right: 0,
                      child: shoppingCartController.orderList.isNotEmpty
                          ? Container(
                              padding: EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              constraints: BoxConstraints(
                                minWidth: 5,
                                minHeight: 5,
                              ),
                            )
                          : Container(
                              padding: EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              constraints: BoxConstraints(
                                minWidth: 5,
                                minHeight: 5,
                              ),
                            ),
                    ),
                  )
                ],
              ),
            ),
            BottomNavigationBarItem(
              // ignore: deprecated_member_use
              label: 'null',
              icon: ImageIcon(AssetImage('assets/bottomNavBar/user.png')),
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
