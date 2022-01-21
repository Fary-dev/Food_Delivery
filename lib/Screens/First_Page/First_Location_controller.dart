import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/state_manager.dart';

class FirstPageController extends GetxController {
  RxString fistUserLocation = ''.obs;

  getCurrentLocation() async {
    await determinePosition().then((value) => {getPlace(value)});
  }

  void getPlace(Position pos) async {
    List<Placemark> newPlace =
        await placemarkFromCoordinates(pos.latitude, pos.longitude);

    Placemark placemark = newPlace[0];
<<<<<<< HEAD
    String plz = placemark.locality;
    String bzirck = placemark.postalCode;
    String hausNummer = placemark.subThoroughfare;
    String strasse = placemark.thoroughfare;
=======
    String plz = placemark.locality!;
    String bzirck = placemark.postalCode!;
    String hausNummer = placemark.subThoroughfare!;
    String strasse = placemark.thoroughfare!;
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8

    fistUserLocation.value = '$strasse $hausNummer, $plz $bzirck';
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
}
