import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'models_and_data.dart';

class Note {
  List favorit;
  bool licked;
  int id;
  double lattut;
  double longtut;
  LatLng latlong;
  String nameResturant = '';
  String description;
  String photoResturant;
  String logoResturant;
  String photoInfoPage;
  int ratingResturant;
  double deliveryPrice;
  double minimumOrder;
  int deliveryDuration;
  double distance;
  bool isOnline;
  String openingTime;
  String address;
  String owner;
  List<Products> products;
  List<Product> product;

  Note({
    this.favorit,
    this.licked,
    this.id,
    this.latlong,
    this.longtut,
    this.lattut,
    this.nameResturant,
    this.description,
    this.photoResturant,
    this.logoResturant,
    this.photoInfoPage,
    this.ratingResturant,
    this.deliveryPrice,
    this.minimumOrder,
    this.deliveryDuration,
    this.distance,
    this.address,
    this.isOnline,
    this.openingTime,
    this.owner,
    this.products,
    this.product,
  });
}
