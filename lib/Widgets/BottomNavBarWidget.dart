import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mjam/Contants/Color.dart';
import 'package:mjam/Screens/Menu_Screen/Menu.dart';
import 'package:mjam/bloc/Order_Bloc/productBloc.dart';
import 'package:mjam/bloc/Order_Bloc/states.dart';
import 'package:mjam/bottom_Navigation_bar/FavoritScreen.dart';
import 'package:mjam/bottom_Navigation_bar/Profil.dart';
import 'package:mjam/bottom_Navigation_bar/search_Screen.dart';
import 'package:mjam/bottom_Navigation_bar/Shopping/shopping_carts.dart';
import 'package:mjam/models_and_data/Icons/font1.dart';

// ignore: camel_case_types
class BottomNavBarWidget extends StatefulWidget {
  BottomNavBarWidget({Key key}) : super(key: key);
  @override
  _BottomNavBarWidgetState createState() => _BottomNavBarWidgetState();
}

// ignore: camel_case_types
class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
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
              icon: Icon(
                Iconsss.room_service,
                size: 25,
              ),
            ),
            BottomNavigationBarItem(
              // ignore: deprecated_member_use
              title: Padding(
                padding: EdgeInsets.all(0),
              ),
              icon: Icon(
                CupertinoIcons.search,
                // Iconsss.search_1,
                // size: 20,
              ),
            ),
            BottomNavigationBarItem(
              // ignore: deprecated_member_use
              title: Padding(
                padding: EdgeInsets.all(0),
              ),
              icon: Icon(
                CupertinoIcons.heart,
                // Iconsss.heart_empty,
              ),
            ),
            BottomNavigationBarItem(
              // ignore: deprecated_member_use
              title: Padding(
                padding: EdgeInsets.all(0),
              ),
              icon: Stack(
                children: <Widget>[
                  Icon(
                    CupertinoIcons.shopping_cart,
                  ),
                  BlocBuilder<ProductBloc, BlocState>(
                      builder: (context, state) => state is SuccessState
                          ? Positioned(
                              right: 0,
                              child: state.orderList.isNotEmpty
                                  ? Container(
                                      padding: EdgeInsets.all(1),
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      constraints: BoxConstraints(
                                        minWidth: 7,
                                        minHeight: 7,
                                      ),
                                    )
                                  : Container(
                                      padding: EdgeInsets.all(1),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      constraints: BoxConstraints(
                                        minWidth: 7,
                                        minHeight: 7,
                                      ),
                                    ),
                            )
                          : Text('')),
                ],
              ),
            ),
            BottomNavigationBarItem(
              // ignore: deprecated_member_use
              title: Padding(
                padding: EdgeInsets.all(0),
              ),
              icon: Icon(
                CupertinoIcons.person,
              ),
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (int value) {
            setState(() {
              _selectedIndex = value;
            });
          },
        ),
      ),
    );
  }
}
