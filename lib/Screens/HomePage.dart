import 'package:flutter/material.dart';
import 'file:///C:/Users/Fary/AndroidStudioProjects/mjam/lib/Widgets/BottomNavBarWidget.dart';
import 'file:///C:/Users/Fary/AndroidStudioProjects/mjam/lib/Screens/Menu.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Menu(),
          bottomNavigationBar: BottomNavBarWidget(),
        ),
      ),
    );
  }

}
