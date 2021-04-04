import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';

class LocationApp extends StatefulWidget {
  @override
  _LocationAppState createState() => _LocationAppState();
}

class _LocationAppState extends State<LocationApp> {
  var add1 = '';
  var add2 = '';
  var add3 = '';
  var add4 = '';
  var add5 = '';
  var add6 = '';
  var add7 = '';
  var add8 = '';
  var add9 = '';
  var add10 = '';
  var add11 = '';

  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    print(lastPosition);
    var lat = position.latitude;
    var long = position.longitude;
    print('lat $lat. ,lang $long');
    final coordinates = new Coordinates(lat, long);
    var address =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    setState(() {
      add1 = address.first.addressLine;
      add2 = address.first.adminArea;
      add3 = address.first.countryCode;
      add4 = address.first.countryName;
      add5 = address.first.featureName;
      add6 = address.first.locality;
      add7 = address.first.postalCode;
      add8 = address.first.subAdminArea;
      add9 = address.first.subLocality;
      add10 = address.first.subThoroughfare;
      add11 = address.first.thoroughfare;
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
              'Get Your location!!',
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
            SizedBox(
              height: 20,
            ),
            Text('addressLine:   $add1'),
            SizedBox(
              height: 10,
            ),
            Text('adminArea:   $add2'),
            SizedBox(
              height: 10,
            ),
            Text('countryCode:   $add3'),
            SizedBox(
              height: 10,
            ),
            Text('countryName:   $add4'),
            SizedBox(
              height: 10,
            ),
            Text('featureName:   $add5'),
            SizedBox(
              height: 10,
            ),
            Text('locality:   $add6'),
            SizedBox(
              height: 10,
            ),
            Text('postalCode:   $add7'),
            SizedBox(
              height: 10,
            ),
            Text('subAdminArea:   $add8'),
            SizedBox(
              height: 10,
            ),
            Text('subLocality:   $add9'),
            SizedBox(
              height: 10,
            ),
            Text('subThoroughfare:   $add10'),
            SizedBox(
              height: 10,
            ),
            Text('thoroughfare:   $add11'),
            SizedBox(
              height: 10,
            ),

            // ignore: deprecated_member_use
            FlatButton(
              onPressed: () {},
              color: Colors.blue[600],
              child: Text(
                'Get current location',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
