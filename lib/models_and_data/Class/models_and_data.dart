import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//================================ Resturants ==========================
class Resturant {
  int id;
  double lattut;
  double longtut;
  LatLng latlong;
  String nameResturant;
  String description;
  String photoResturant;
  String logoResturant;
  String photoInfoPage;
  double ratingResturant;
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

  Resturant({
    @required this.id,
    @required this.latlong,
    @required this.longtut,
    @required this.lattut,
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

final resturant1 = Resturant(
  id: 1,
  latlong: LatLng(48.66507923548689, 15.63873216469989),
  lattut: 48.66507923548689,
  longtut: 15.63873216469989,
  nameResturant: 'Horner Pizzaservice',
  description: 'Beste Pizza & Schnizel',
  photoResturant: 'assets/HornerPizzaa.jpg',
  logoResturant: 'assets/hornerpizza.png',
  photoInfoPage: 'assets/hornerinfo.jpeg',
  ratingResturant: 1852,
  deliveryPrice: 2.00,
  minimumOrder: 20,
  deliveryDuration: 30,
  distance: 1.7,
  address: 'Prager Straße 50, 3580 Horn',
  isOnline: true,
  openingTime: '11:00 - 22:00',
  owner: 'Mohammad Azam Alami',
  products: [top10, pizza, pasta, salate, desserts, burger, allergene],
  product: [
    salami,
    cardi,
    funghi,
    carbonara,
    salateFasl,
    salatebela,
    mohrImHemd,
    tramisu,
    hamburger,
    cheesburger,
    a,
    b,
    c,
    d,
    f,
  ],
);
final resturant2 = Resturant(
  id: 2,
  latlong: LatLng(48.665538925380226, 15.633648444305498),
  lattut: 48.665538925380226,
  longtut: 15.633648444305498,
  nameResturant: 'Mcdonald\'s',
  description: 'MCDONALD\'S ÖSTERREICH',
  photoResturant: 'assets/mc2.jpg',
  logoResturant: 'assets/Mc1.png',
  photoInfoPage: 'assets/mcinfo.jpeg',
  ratingResturant: 168,
  deliveryPrice: 3.50,
  minimumOrder: 30,
  deliveryDuration: 45,
  distance: 1.7,
  address: 'Wiener Straße 4, 3580 Horn',
  isOnline: true,
  openingTime: '11:00 - 19:00',
  owner: 'Marschalek GmbH',
  products: [top10, burger, desserts, allergene],
  product: [hamburger, cheesburger, tramisu, mohrImHemd, a, b, c, d, f],
);
final resturant3 = Resturant(
  id: 3,
  latlong: LatLng(48.66207965750285, 15.654308480654059),
  lattut: 48.66207965750285,
  longtut: 15.654308480654059,
  nameResturant: 'Resturant Milano',
  description: 'Pizza Pasta Schnizel',
  photoResturant: 'assets/Milano.jpg',
  logoResturant: 'assets/milano.png',
  photoInfoPage: 'assets/milanoinfo.jpg',
  ratingResturant: 1584,
  deliveryPrice: 1.50,
  minimumOrder: 15,
  deliveryDuration: 30,
  distance: 1.1,
  address: 'Prager Straße 10, 3580 Horn',
  isOnline: true,
  openingTime: '11:00 - 22:00',
  owner: 'Ibrahim BUGDAYCI',
  products: [top10, pizza, salate, pasta, burger, allergene],
  product: [
    margharita,
    salami,
    cardi,
    salatedodo,
    salateFasl,
    salatebela,
    carbonara,
    funghi,
    cheesburger,
    a,
    b,
    c,
    d,
    f,
  ],
);
final resturant4 = Resturant(
  id: 4,
  latlong: LatLng(48.664687222651246, 15.633361206578444),
  lattut: 48.664687222651246,
  longtut: 15.633361206578444,
  nameResturant: 'Schnitzelpalast',
  description: 'Schnitzel für immer',
  photoResturant: 'assets/Schnitzel.jpg',
  logoResturant: 'assets/schnitzelp.png',
  photoInfoPage: 'assets/schnitzelinfo.jpg',
  ratingResturant: 1322,
  deliveryPrice: 3.00,
  minimumOrder: 20,
  deliveryDuration: 35,
  distance: 2.4,
  address: 'Wiener Straße 5, 3580 Frauenhofen',
  isOnline: true,
  openingTime: '11:00 - 19:00',
  owner: 'BIRO & CO KG',
  products: [top10, burger, fleisch, getraenke, allergene],
  product: [
    cheesburger,
    hamburger,
    spribs,
    chickenNagets,
    chickenWings,
    cola,
    fanta,
    bier,
    a,
    b,
    c,
    d,
    f,
  ],
);
final resturant5 = Resturant(
  id: 5,
  latlong: LatLng(48.66432424932352, 15.662778866146501),
  lattut: 48.66432424932352,
  longtut: 15.662778866146501,
  nameResturant: 'Restaurant Arian',
  description: 'Mittagessen, Abendessen',
  photoResturant: 'assets/Ariana.jpg',
  logoResturant: 'assets/arian.jpg',
  photoInfoPage: 'assets/arianinfo.jpg',
  ratingResturant: 2680,
  deliveryPrice: 2.90,
  minimumOrder: 30,
  deliveryDuration: 45,
  distance: 0.8,
  address: 'Taffatal 4, 3580 Horn',
  isOnline: true,
  openingTime: '11:00 - 21:00',
  owner: 'Arian GmbH',
  products: [
    top10,
    pizza,
    pasta,
    burger,
    fleisch,
    desserts,
    getraenke,
    allergene
  ],
  product: [
    salami,
    margharita,
    cardi,
    funghi,
    carbonara,
    chickenNagets,
    chickenWings,
    hamburger,
    mohrImHemd,
    tramisu,
    cola,
    fanta,
    bier,
    a,
    b,
    c,
    d,
    f,
  ],
);

final List<Resturant> resturants = [
  resturant1,
  resturant2,
  resturant3,
  resturant4,
  resturant5,
];

//================================ Products ==========================
class Products {
  int id;
  String nameProducts;
  Products({
    @required this.id,
    @required this.nameProducts,
  });
}

final top10 = Products(id: 1, nameProducts: 'Top 10');
final pizza = Products(id: 2, nameProducts: 'Pizza');
final salate = Products(id: 3, nameProducts: 'Salate');
final burger = Products(id: 4, nameProducts: 'Burger');
final pasta = Products(id: 5, nameProducts: 'Pasta');
final fleisch = Products(id: 6, nameProducts: 'Fleisch');
final desserts = Products(id: 7, nameProducts: 'Desserts');
final getraenke = Products(id: 8, nameProducts: 'Getränke');
final allergene = Products(id: 9, nameProducts: 'Allergene_Zusatztoffe');

final List<Products> listProducts = [
  top10,
  pizza,
  salate,
  burger,
  pasta,
  fleisch,
  desserts,
  getraenke,
  allergene,
];
//================================ Product ===========================

class Product extends Products {
  int id;
  String nameProduct;
  double price;
  bool isNoVeg;
  List<String> allergy;

  Product({
    String nameProducts,
    @required this.id,
    @required this.nameProduct,
    this.price,
    this.isNoVeg,
    this.allergy,
  });
}

final salami = Product(
  id: 2,
  nameProduct: 'Salami',
  price: 6.50,
  isNoVeg: true,
);
final cardi = Product(
  id: 2,
  nameProduct: 'Cardinale',
  price: 6.50,
  isNoVeg: true,
);
final margharita = Product(
  id: 2,
  nameProduct: 'Margharita',
  price: 6.50,
  isNoVeg: true,
);
final salateFasl = Product(
  id: 3,
  nameProduct: 'Salate Fasl',
  price: 6.50,
  isNoVeg: true,
);
final salatebela = Product(
  id: 3,
  nameProduct: 'Salate Bella',
  price: 6.50,
  isNoVeg: true,
);
final salatedodo = Product(
  id: 3,
  nameProduct: 'Salate Dodo',
  price: 6.50,
  isNoVeg: true,
);
final hamburger = Product(
  id: 4,
  nameProduct: 'Hamburger',
  price: 6.50,
  isNoVeg: true,
);
final cheesburger = Product(
  id: 4,
  nameProduct: 'Cheesburger',
  price: 6.50,
  isNoVeg: true,
);
final funghi = Product(
  id: 5,
  nameProduct: 'Funghi',
  price: 6.50,
  isNoVeg: true,
);
final carbonara = Product(
  id: 5,
  nameProduct: 'Carbonara',
  price: 6.50,
  isNoVeg: true,
);
final chickenNagets = Product(
  id: 6,
  nameProduct: 'Chicken Nagets',
  price: 6.50,
  isNoVeg: true,
);
final spribs = Product(
  id: 6,
  nameProduct: 'Speribs',
  price: 6.50,
  isNoVeg: true,
);
final chickenWings = Product(
  id: 6,
  nameProduct: 'Chicken Wings',
  price: 6.50,
  isNoVeg: true,
);
final tramisu = Product(
  id: 7,
  nameProduct: 'Teramisu',
  price: 6.50,
  isNoVeg: true,
);
final mohrImHemd = Product(
  id: 7,
  nameProduct: 'Mohr im Hemd',
  price: 6.50,
  isNoVeg: true,
);
final cola = Product(
  id: 8,
  nameProduct: 'Cola',
  price: 6.50,
  isNoVeg: true,
);
final fanta = Product(
  id: 8,
  nameProduct: 'Fanta',
  price: 6.50,
  isNoVeg: true,
);
final bier = Product(
  id: 8,
  nameProduct: 'Bier',
  price: 6.50,
  isNoVeg: true,
);
final eisTee = Product(
  id: 8,
  nameProduct: 'Eis Tee',
  price: 6.50,
  isNoVeg: true,
);
final a = Product(
  id: 9,
  nameProduct: 'A',
  isNoVeg: true,
);
final b = Product(
  id: 9,
  nameProduct: 'B',
  isNoVeg: true,
);
final c = Product(
  id: 9,
  nameProduct: 'C',
  isNoVeg: true,
);
final d = Product(
  id: 9,
  nameProduct: 'D',
  isNoVeg: true,
);
final f = Product(
  id: 9,
  nameProduct: 'F',
  isNoVeg: true,
);

class Order {
  final Resturant resturant;
  Product product;
  int quantity;
  double totalPrise;

  Order({
    this.resturant,
    this.product,
    this.quantity,
    this.totalPrise,
  });
}

class User {
  final Order order;
  String firstName;
  String lastName;
  String nicName;
  String email;
  String password;
  User({
    this.order,
    this.firstName,
    this.lastName,
    this.nicName,
    this.email,
    this.password,
  });
}
