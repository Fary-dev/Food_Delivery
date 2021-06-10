import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:mjam/Contants/Color.dart';
import 'package:mjam/Screens/First_Page/First_Location_controller.dart';
import 'package:mjam/Screens/Home_Page/HomePage.dart';
import 'package:mjam/Screens/Resturants/Resturant_List/Resturant_List_Controller.dart';
import 'package:mjam/models_and_data/Class/models_and_data.dart';

class LocationSet extends StatefulWidget {
  @override
  _LocationSetState createState() => _LocationSetState();
}

class _LocationSetState extends State<LocationSet> {
  final firstAdress = Get.put(FirstPageController());
  final ResturantListController ff = Get.put(ResturantListController());
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

    for (var res in resturants) {
      var distanceBetweenLastTwoLocations = Geolocator.distanceBetween(
        position.latitude,
        position.longitude,
        res.lattut,
        res.longtut,
      );
      var totalDistance = distanceBetweenLastTwoLocations;
      res.distance = totalDistance;
    }
    final coordinates = Coordinates(position.latitude, position.longitude);
    final address =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    address.isNotEmpty ? isLoading = true : isLoading = false;
    setState(() {
      plz = address.first.locality;
      bzirck = address.first.postalCode;
      hausNummer = address.first.subThoroughfare;
      strasse = address.first.thoroughfare;
      firstAdress.fistUserLocation.value = '$strasse $hausNummer, $plz $bzirck';
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
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          primary: primaryColor,
                          textStyle: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                      child: Text(
                        "Los geht's",
                        style: TextStyle(
                          fontSize: 15,
                          color: whiteColor,
                        ),
                      ),
                      onPressed: () {
                        Get.off(() => HomePage());
                      },
                    )
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
