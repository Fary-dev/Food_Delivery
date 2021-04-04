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

  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    print(lastPosition);
    var lat = position.latitude;
    var long = position.longitude;
    final coordinates = new Coordinates(lat, long);
    var address =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    setState(() {
      add6 = address.first.locality;
      add7 = address.first.postalCode;
      add10 = address.first.subThoroughfare;
      add11 = address.first.thoroughfare;
      Timer(Duration(seconds: 0), () {
        MyBloc myBloc = Provider.of(
          context,
          listen: false,
        );
        myBloc.setLocation('$add11 $add10, $add6 $add7');
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.location_on, size: 45, color: Colors.blue),
            SizedBox(
              height: 20,
            ),
            Text(
              'Ihre location!!',
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
            SizedBox(
              height: 20,
            ),
            Text('$add11 $add10, $add6 $add7'),
            SizedBox(
              height: 10,
            ),
            // ignore: deprecated_member_use
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomNavBarWidget(),
                  ),
                );
              },
              color: Colors.blue[600],
              child: Text(
                'Los geht\'s',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
