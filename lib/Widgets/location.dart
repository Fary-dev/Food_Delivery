import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mjam/Widgets/BottomNavBarWidget.dart';
import 'package:mjam/bloc/firstLocation.dart';
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
      DefultLocation myBloc = Provider.of(context, listen: false);
      myBloc.setLocation('$add11 $add10, $add6 $add7');
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
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
              height: 120,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  'Herzlich Willkommen',
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'FOODO',
              style: TextStyle(
                fontSize: 23,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 50.0,
              ),
              // ignore: deprecated_member_use
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                color: Colors.redAccent[400].withOpacity(0.80),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomNavBarWidget(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Los geht\'s',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
