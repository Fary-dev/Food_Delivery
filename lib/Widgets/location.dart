import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mjam/Contants/Color.dart';
import 'package:mjam/Screens/Home_Page/HomePage.dart';
import 'package:mjam/bloc/Location_Bloc/firstLocation.dart';
import 'package:provider/provider.dart';

class LocationSet extends StatefulWidget {
  @override
  _LocationSetState createState() => _LocationSetState();
}

class _LocationSetState extends State<LocationSet> {
  final Future<FirebaseApp> _fba = Firebase.initializeApp();
  String strasse, hausNummer, bzirck, plz;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
    isLoading = false;
  }

  void getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    final coordinates = Coordinates(position.latitude, position.longitude);

    final address =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    address.isNotEmpty ? isLoading = true : isLoading = false;
    setState(() {
      plz = address.first.locality;
      bzirck = address.first.postalCode;
      hausNummer = address.first.subThoroughfare;
      strasse = address.first.thoroughfare;
      DefultLocation myBloc = Provider.of(context, listen: false);
      myBloc.setLocation('$strasse $hausNummer, $plz $bzirck');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _fba,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("you have an error!${snapshot.error}");
            return Center(child: Text('Something went wrong!'));
          } else if (snapshot.hasData) {
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
                        whiteColor,
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
                            color: whiteColor,
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
                        color: whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 400,
                    ),
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      ),
                      child: Container(
                        height: 100,
                        width: 100,
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: primaryColor.withOpacity(0.80),
                        ),
                        child: Center(
                          child: Text(
                            "Los geht's",
                            style: TextStyle(
                              fontSize: 15,
                              color: whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/willkommen.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
