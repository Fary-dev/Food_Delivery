import 'package:flutter/material.dart';

class Resturant {
  int id;
  String nameResturant;
  String description;
  var photoResturant;
  var logoResturant;
  var photoInfoPage;
  var ratingResturant;
  double deliveryPrice;
  double minimumOrder;
  String deliveryDuration;
  String distance;
  bool isOnline;
  List products;
  List product;
  String openingTime;
  String address;
  String owner;

  Resturant({
    @required this.id,
    @required this.nameResturant,
    @required this.description,
    @required this.photoResturant,
    @required this.logoResturant,
    @required this.photoInfoPage,
    @required this.ratingResturant,
    @required this.deliveryPrice,
    @required this.minimumOrder,
    @required this.deliveryDuration,
    @required this.distance,
    @required this.address,
    @required this.isOnline,
    @required this.openingTime,
    @required this.owner,
    @required this.products,
    @required this.product,
  });
}

//================================ Products ==========================
class Products {
  int id;
  String nameProducts;
  Products({
    @required this.id,
    @required this.nameProducts,
  });
}

//================================ Product ===========================

class Product {
  int id;
  String nameProduct;

  Product({
    @required this.id,
    @required this.nameProduct,
  });
}
