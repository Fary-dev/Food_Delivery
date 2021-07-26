import 'package:flutter/material.dart';
import 'package:mjam/Screens/Menu_Screen/Menu.dart';
import 'package:mjam/Widgets/BottomNavBarWidget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        body: Menu(),
        bottomNavigationBar: BottomNavBarWidget(),
      ),
    );
  }
}
