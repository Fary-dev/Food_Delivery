import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mjam/Contants/Color.dart';
import 'package:mjam/Screens/Menu_Screen/Menu.dart';
import 'package:mjam/Screens/Resturants/PageResturant/orderController.dart';
import 'package:mjam/bottom_Navigation_bar/FavoritScreen.dart';
import 'package:mjam/bottom_Navigation_bar/Profil.dart';
import 'package:mjam/bottom_Navigation_bar/search_Screen.dart';
import 'package:mjam/bottom_Navigation_bar/Shopping/shopping_carts.dart';

class BottomNavBarWidget extends StatefulWidget {
  BottomNavBarWidget({Key key}) : super(key: key);

  @override
  _BottomNavBarWidgetState createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  final OrderController orderController = Get.put(OrderController());
  PageController pageController = PageController();
  int _selectedIndex = 0;
  final screens = <Widget>[
    Menu(),
    Searching(),
    FavoritScreen(),
    ShoppingCarts(),
    Profil(),
  ];

  onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: primaryColor,
        unselectedItemColor: Theme.of(context).primaryIconTheme.color,
        items: [
          BottomNavigationBarItem(
            // ignore: deprecated_member_use
            title: Padding(
              padding: EdgeInsets.all(0),
            ),
            icon: ImageIcon(AssetImage('assets/bottomNavBar/service.png')),
          ),
          BottomNavigationBarItem(
            // ignore: deprecated_member_use
            title: Padding(
              padding: EdgeInsets.all(0),
            ),
            icon: ImageIcon(AssetImage('assets/bottomNavBar/search.png')),
          ),
          BottomNavigationBarItem(
            // ignore: deprecated_member_use
            title: Padding(
              padding: EdgeInsets.all(0),
            ),
            icon: ImageIcon(AssetImage('assets/bottomNavBar/favo.png')),
          ),
          BottomNavigationBarItem(
            // ignore: deprecated_member_use
            title: Padding(
              padding: EdgeInsets.all(0),
            ),
            icon: Stack(
              children: <Widget>[
                ImageIcon(AssetImage('assets/bottomNavBar/shop.png')),
                Obx(
                  () => Positioned(
                    top: 0,
                    right: 0,
                    child: orderController.cartOrder.isNotEmpty
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
            title: Padding(
              padding: EdgeInsets.all(0),
            ),
            icon: ImageIcon(AssetImage('assets/bottomNavBar/user.png')),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (int value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}
