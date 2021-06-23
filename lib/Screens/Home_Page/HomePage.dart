import 'package:flutter/material.dart';
import 'package:mjam/Screens/Menu_Screen/Menu.dart';
import 'package:mjam/Widgets/BottomNavBarWidget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
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
