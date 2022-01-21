import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
<<<<<<< HEAD
<<<<<<< HEAD

=======
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
=======
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mjam/Contants/Color.dart';
import 'package:mjam/Screens/First_Page/First_Location_controller.dart';
import 'package:mjam/Screens/Resturants/PageResturant/FavoritController.dart';
import 'package:mjam/Screens/Resturants/Resturant_List/Resturant_List_Controller.dart';
import 'package:mjam/Screens/BootomNavBar/BottomNavBarWidget.dart';
import 'package:mjam/models_and_data/Class/models_and_data.dart';

class LocationSet extends StatefulWidget {
  @override
  _LocationSetState createState() => _LocationSetState();
}

class _LocationSetState extends State<LocationSet> {
  final userData = GetStorage();
  final firstAdress = Get.put(FirstPageController());
  final ResturantListController ff = Get.put(ResturantListController());
  final Future<FirebaseApp> _fba = Firebase.initializeApp();
<<<<<<< HEAD
<<<<<<< HEAD

=======
  final FavoriteController favoritController = Get.put(FavoriteController());
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
=======
  final FavoriteController favoritController = Get.put(FavoriteController());
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
  bool isLoading = false;


  @override
  void initState() {
    super.initState();
    getCurrentLocation();
    isLoading = false;
    userData.writeIfNull('isLogged', false);

<<<<<<< HEAD
  }

<<<<<<< HEAD
  getCurrentLocation() async {
    await determinePosition().then((value) => {getPlace(value)});
    setState(() {
      isLoading = true;
    });
  }

=======


  getCurrentLocation() async {
    await determinePosition().then((value) => {getPlace(value)});
    setState(() {
      isLoading = true;
    });
  }

>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
=======
  }



  getCurrentLocation() async {
    await determinePosition().then((value) => {getPlace(value)});
    setState(() {
      isLoading = true;
    });
  }

>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
  void getPlace(Position pos) async {
    List<Placemark> newPlace =
        await placemarkFromCoordinates(pos.latitude, pos.longitude);
    for (var res in resturants) {
      var distanceBetweenLastTwoLocations = Geolocator.distanceBetween(
        pos.latitude,
        pos.longitude,
<<<<<<< HEAD
<<<<<<< HEAD
        res.lattut,
        res.longtut,
=======
        res.lattut!,
        res.longtut!,
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
=======
        res.lattut!,
        res.longtut!,
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
      );
      var totalDistance = distanceBetweenLastTwoLocations;
      res.distance = totalDistance;
    }

    Placemark placemark = newPlace[0];
<<<<<<< HEAD
<<<<<<< HEAD
    String plz = placemark.locality;
    String bzirck = placemark.postalCode;
    String hausNummer = placemark.subThoroughfare;
    String strasse = placemark.thoroughfare;
=======
=======
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
    String plz = placemark.locality!;
    String bzirck = placemark.postalCode!;
    String hausNummer = placemark.subThoroughfare!;
    String strasse = placemark.thoroughfare!;
<<<<<<< HEAD
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
=======
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8

    firstAdress.fistUserLocation.value = '$strasse $hausNummer, $plz $bzirck';
  }

  Future<Position> determinePosition() async {
    bool serviceEnable;
    LocationPermission permission;

    serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) {
      return Future.error('Location service are disable.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permission are denied.');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permission are permanently denied,we cannot request permission!');
    }
    return await Geolocator.getCurrentPosition();
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
                replacement: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      top: 50.0,
                      right: 20.0,
                    ),
                    child: Align(
                      // alignment: Alignment.topCenter,
                      child: LinearProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          primaryColor,
                        ),
                        backgroundColor: Colors.black38,
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
<<<<<<< HEAD
<<<<<<< HEAD
                        Get.off(() => HomePage());
=======

                        Get.off(() => BottomNavBarWidget());
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
=======

                        Get.off(() => BottomNavBarWidget());
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      top: 50.0,
                      right: 20.0,
                    ),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: LinearProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          primaryColor,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 100.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
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

                          Get.off(() => BottomNavBarWidget());
                        },
                      ),
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
