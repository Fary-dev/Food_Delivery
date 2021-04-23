import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mjam/Screens/Menu_Screen/Menu.dart';
import 'package:mjam/bottom_Navigation_bar/FavoritScreen.dart';
import 'package:mjam/bottom_Navigation_bar/Profil.dart';
import 'package:mjam/bottom_Navigation_bar/searching.dart';
import 'package:mjam/bottom_Navigation_bar/shopping_carts.dart';
import 'package:mjam/models_and_data/Icons_Fonts/font1.dart';

// ignore: camel_case_types
class BottomNavBarWidget extends StatefulWidget {
  BottomNavBarWidget({Key key}) : super(key: key);
  @override
  _BottomNavBarWidgetState createState() => _BottomNavBarWidgetState();
}

// ignore: camel_case_types
class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  PageController _pageController = PageController();
  int _selectedIndex = 0;
  List<Widget> _screens = [
    Menu(),
    Searching(),
    FavoritScreen(),
    ShoppingCarts(),
    Profil(),
  ];
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _itemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          children: _screens,
          onPageChanged: _onPageChanged,
          physics: NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.red[700],
          unselectedItemColor: Colors.black87,
          items: [
            BottomNavigationBarItem(
              // ignore: deprecated_member_use
              title: Padding(
                padding: EdgeInsets.all(0),
                child: Text(''),
              ),
              icon: Icon(
                Iconsss.room_service,
                size: 28,
              ),
            ),
            BottomNavigationBarItem(
              // ignore: deprecated_member_use
              title: Padding(
                padding: EdgeInsets.all(0),
              ),
              icon: Icon(
                Iconsss.search_1,
                size: 20,
              ),
            ),
            BottomNavigationBarItem(
              // ignore: deprecated_member_use
              title: Padding(
                padding: EdgeInsets.all(0),
              ),
              icon: Icon(
                Iconsss.heart_empty,
                size: 20,
              ),
            ),
            BottomNavigationBarItem(
              // ignore: deprecated_member_use
              title: Padding(
                padding: EdgeInsets.all(0),
              ),
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: 25,
              ),
            ),
            BottomNavigationBarItem(
              // ignore: deprecated_member_use
              title: Padding(
                padding: EdgeInsets.all(0),
              ),
              icon: Icon(
                Icons.person_outline,
                size: 25,
              ),
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _itemTapped,
        ),
      ),
    );
  }
}
