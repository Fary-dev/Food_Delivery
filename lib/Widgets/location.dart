import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mjam/Widgets/BottomNavBarWidget.dart';
import 'package:mjam/myBloc/myBloc.dart';
import 'package:provider/provider.dart';

class LocationSet extends StatefulWidget {
  @override
  _LocationSetState createState() => _LocationSetState();
}

class _LocationSetState extends State<LocationSet> {
  var add6 = '';
  var add7 = '';
  var add10 = '';
  var add11 = '';
  bool isLoading = true;

  void getCurrentLocation() async {
    isLoading = false;
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lat = position.latitude;
    var long = position.longitude;
    final coordinates = new Coordinates(lat, long);
    var address =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);

    setState(() {
      isLoading = true;
      add6 = address.first.locality;
      add7 = address.first.postalCode;
      add10 = address.first.subThoroughfare;
      add11 = address.first.thoroughfare;
      MyBloc myBloc = Provider.of(context, listen: false);
      myBloc.setLocation('$add11 $add10, $add6 $add7');
    });
    Timer(
      Duration(seconds: 2),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BottomNavBarWidget(),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/willkommen.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Visibility(
        visible: isLoading,
        replacement: Container(
          child: Center(
            child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(
                Colors.white,
              ),
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Text(
              'Herzlich Willkommen',
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'FOODO',
              style: TextStyle(
                fontSize: 80,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
