import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//================================ Resturants ==========================
class Resturant {
  List? favorit;
  bool? licked;
  int? id;
  double? lattut;
  double? longtut;
  LatLng? latlong;
  String? nameResturant ;
  String? description;
  String ?photoResturant;
  String? logoResturant;
  String? photoInfoPage;
  int? ratingResturant;
  double? deliveryPrice;
  double? minimumOrder;
  int? deliveryDuration;
  double? distance;
  bool? isOnline;
  String? openingTime;
  String? address;
  String? owner;
  List<ProductType>? products;
  List<Product>? product;
  List<Extra>? extra;

  Resturant({
    this.favorit,
    this.licked,
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
    this.extra
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
  distance: 0,
  address: 'Prager Straße 50, 3580 Horn',
  isOnline: true,
  openingTime: '11:00 - 22:00',
  owner: 'Mohammad Azam Alami',
  products: [beliebt, pizza, pasta, salate, desserts, burger, allergene],
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
  extra: [
    Extra(name: 'Knoblauch', price: 0.0),
    Extra(name: 'Oregana', price: 0.0),
    Extra(name: 'Käse', price: 1.0),
    Extra(name: 'Dopelte Boden', price: 1.5),
    Extra(name: 'Salami', price: 1.0),
    Extra(name: 'Schinken', price: 1.0),
    Extra(name: 'Speck', price: 1.0),
    Extra(name: 'Paprika', price: 1.0),
    Extra(name: 'Zwiebl', price: 1.0),
    Extra(name: 'kebap', price: 1.0),
    Extra(name: 'Bolonese', price: 1.0),
    Extra(name: 'Oliven', price: 1.0),
    Extra(name: 'Sardilen', price: 1.0),
    Extra(name: 'Tunfisch', price: 1.0),
    Extra(name: 'Ei', price: 1.0),
    Extra(name: 'Ananas', price: 1.0),
    Extra(name: 'Mozarela', price: 1.0),
    Extra(name: 'Schaf Käse', price: 1.0),
    Extra(name: 'Schimel Käse', price: 1.0),
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
  minimumOrder: 10,
  deliveryDuration: 45,
  distance: 0,
  address: 'Wiener Straße 4, 3580 Horn',
  isOnline: true,
  openingTime: '11:00 - 19:00',
  owner: 'Marschalek GmbH',
  products: [beliebt, burger, desserts, allergene],
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
  distance: 0,
  address: 'Prager Straße 10, 3580 Horn',
  isOnline: true,
  openingTime: '11:00 - 22:00',
  owner: 'Ibrahim BUGDAYCI',
  products: [beliebt, pizza, salate, pasta, burger, allergene],
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
  extra: [
    Extra(name: 'Knoblauch', price: 0.0),
    Extra(name: 'Oregana', price: 0.0),
    Extra(name: 'Käse', price: 1.0),
    Extra(name: 'Dopelte Boden', price: 1.5),
    Extra(name: 'Salami', price: 1.0),
    Extra(name: 'Schinken', price: 1.0),
    Extra(name: 'Speck', price: 1.0),
    Extra(name: 'Paprika', price: 1.0),
    Extra(name: 'Zwiebl', price: 1.0),
    Extra(name: 'kebap', price: 1.0),
    Extra(name: 'Bolonese', price: 1.0),
    Extra(name: 'Oliven', price: 1.0),
    Extra(name: 'Sardilen', price: 1.0),
    Extra(name: 'Tunfisch', price: 1.0),
    Extra(name: 'Ei', price: 1.0),
    Extra(name: 'Ananas', price: 1.0),
    Extra(name: 'Mozarela', price: 1.0),
    Extra(name: 'Schaf Käse', price: 1.0),
    Extra(name: 'Schimel Käse', price: 1.0),
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
  distance: 0,
  address: 'Wiener Straße 5, 3580 Frauenhofen',
  isOnline: true,
  openingTime: '11:00 - 19:00',
  owner: 'BIRO & CO KG',
  products: [beliebt, burger, fleisch, getraenke, allergene],
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
  distance: 0,
  address: 'Taffatal 4, 3580 Horn',
  isOnline: true,
  openingTime: '11:00 - 21:00',
  owner: 'Arian GmbH',
  products: [
    beliebt,
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
  extra: [
    Extra(name: 'Knoblauch', price: 0.0),
    Extra(name: 'Oregana', price: 0.0),
    Extra(name: 'Käse', price: 1.0),
    Extra(name: 'Dopelte Boden', price: 1.5),
    Extra(name: 'Salami', price: 1.0),
    Extra(name: 'Schinken', price: 1.0),
    Extra(name: 'Speck', price: 1.0),
    Extra(name: 'Paprika', price: 1.0),
    Extra(name: 'Zwiebl', price: 1.0),
    Extra(name: 'kebap', price: 1.0),
    Extra(name: 'Bolonese', price: 1.0),
    Extra(name: 'Oliven', price: 1.0),
    Extra(name: 'Sardilen', price: 1.0),
    Extra(name: 'Tunfisch', price: 1.0),
    Extra(name: 'Ei', price: 1.0),
    Extra(name: 'Ananas', price: 1.0),
    Extra(name: 'Mozarela', price: 1.0),
    Extra(name: 'Schaf Käse', price: 1.0),
    Extra(name: 'Schimel Käse', price: 1.0),
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
class ProductType {
  int? id;
  String? nameProductType ;
  String? photo;

  ProductType({
    @required this.id,
    @required this.nameProductType,
    this.photo,

  });
}

final beliebt = ProductType(id: 1, nameProductType: 'Beliebt');
final pizza = ProductType(id: 2, nameProductType: 'Pizza');
final salate = ProductType(id: 3, nameProductType: 'Salate');
final burger = ProductType(id: 4, nameProductType: 'Burger');
final pasta = ProductType(id: 5, nameProductType: 'Pasta');
final fleisch = ProductType(id: 6, nameProductType: 'Fleisch');
final desserts = ProductType(id: 7, nameProductType: 'Desserts');
final getraenke = ProductType(id: 8, nameProductType: 'Getränke');
final allergene = ProductType(id: 9, nameProductType: 'Allergene_Zusatztoffe');

final List<ProductType> listProducts = [
  beliebt,
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

class Product extends ProductType {
  int? id;
  String? nameProduct ;
  String?subtitle;
  double? price;
  bool? isNoVeg;
  String type;
  String? allergy;
  String note;
  String?comment;
  String? photo;
  bool top10;
  List<Extra>? extra;
  final ProductType? productType;


  Product({
    @required this.id,
    @required this.nameProduct,
    this.subtitle='',
    @required this.price,
    this.type='M',
    this.isNoVeg,
    this.allergy,
     this.note='Keine Hinweise',
    this.photo,
    this.top10=false,
    this.extra,
    this.productType,
  });
}

final salami = Product(
  id: 2,
  nameProduct: 'Salami',
  subtitle: 'mit Salami',
  price: 7.00,
  isNoVeg: true,
  productType: pizza,
  top10: true,
  extra: [
    Extra(name: 'Knoblauch', price: 0.0),
    Extra(name: 'Oregana', price: 0.0),
    Extra(name: 'Käse', price: 1.0),
    Extra(name: 'Dopelte Boden', price: 1.5),
    Extra(name: 'Salami', price: 1.0),
    Extra(name: 'Schinken', price: 1.0),
    Extra(name: 'Speck', price: 1.0),
    Extra(name: 'Paprika', price: 1.0),
    Extra(name: 'Zwiebl', price: 1.0),
    Extra(name: 'kebap', price: 1.0),
    Extra(name: 'Bolonese', price: 1.0),
    Extra(name: 'Oliven', price: 1.0),
    Extra(name: 'Sardilen', price: 1.0),
    Extra(name: 'Tunfisch', price: 1.0),
    Extra(name: 'Ei', price: 1.0),
    Extra(name: 'Ananas', price: 1.0),
    Extra(name: 'Mozarela', price: 1.0),
    Extra(name: 'Schaf Käse', price: 1.0),
    Extra(name: 'Schimel Käse', price: 1.0),
  ],
);
final cardi = Product(
  id: 2,
  nameProduct: 'Cardinale',
  subtitle: 'mit Schinken',
  price: 6.00,
  isNoVeg: true,
  productType: pizza,
  extra: [
    Extra(name: 'Knoblauch', price: 0.0),
    Extra(name: 'Oregana', price: 0.0),
    Extra(name: 'Käse', price: 1.0),
    Extra(name: 'Dopelte Boden', price: 1.5),
    Extra(name: 'Salami', price: 1.0),
    Extra(name: 'Schinken', price: 1.0),
    Extra(name: 'Speck', price: 1.0),
    Extra(name: 'Paprika', price: 1.0),
    Extra(name: 'Zwiebl', price: 1.0),
    Extra(name: 'kebap', price: 1.0),
    Extra(name: 'Bolonese', price: 1.0),
    Extra(name: 'Oliven', price: 1.0),
    Extra(name: 'Sardilen', price: 1.0),
    Extra(name: 'Tunfisch', price: 1.0),
    Extra(name: 'Ei', price: 1.0),
    Extra(name: 'Ananas', price: 1.0),
    Extra(name: 'Mozarela', price: 1.0),
    Extra(name: 'Schaf Käse', price: 1.0),
    Extra(name: 'Schimel Käse', price: 1.0),
  ],
);
final margharita = Product(
  id: 2,
  nameProduct: 'Margharita',
  price: 6.50,
  isNoVeg: true,
  productType: pizza,
  top10: true,
  extra: [
    Extra(name: 'Knoblauch', price: 0.0),
    Extra(name: 'Oregana', price: 0.0),
    Extra(name: 'Käse', price: 1.0),
    Extra(name: 'Dopelte Boden', price: 1.5),
    Extra(name: 'Salami', price: 1.0),
    Extra(name: 'Schinken', price: 1.0),
    Extra(name: 'Speck', price: 1.0),
    Extra(name: 'Paprika', price: 1.0),
    Extra(name: 'Zwiebl', price: 1.0),
    Extra(name: 'kebap', price: 1.0),
    Extra(name: 'Bolonese', price: 1.0),
    Extra(name: 'Oliven', price: 1.0),
    Extra(name: 'Sardilen', price: 1.0),
    Extra(name: 'Tunfisch', price: 1.0),
    Extra(name: 'Ei', price: 1.0),
    Extra(name: 'Ananas', price: 1.0),
    Extra(name: 'Mozarela', price: 1.0),
    Extra(name: 'Schaf Käse', price: 1.0),
    Extra(name: 'Schimel Käse', price: 1.0),
  ],
);
final salateFasl = Product(
  id: 3,
  nameProduct: 'Salate Fasl',
  price: 6.50,
  isNoVeg: true,
  productType: salate,
);
final salatebela = Product(
  id: 3,
  nameProduct: 'Salate Bella',
  price: 6.50,
  isNoVeg: true,
  productType: salate,
  top10: true,
);
final salatedodo = Product(
  id: 3,
  nameProduct: 'Salate Dodo',
  price: 6.50,
  isNoVeg: true,
  productType: salate,
);
final hamburger = Product(
  id: 4,
  nameProduct: 'Hamburger',
  price: 6.50,
  isNoVeg: true,
  productType: burger,
  top10: true,
);
final cheesburger = Product(
  id: 4,
  nameProduct: 'Cheesburger',
  price: 6.50,
  isNoVeg: true,
  productType: burger,
);
final funghi = Product(
  id: 5,
  nameProduct: 'Funghi',
  price: 5.00,
  isNoVeg: true,
  productType: pasta,
  top10: true,
);
final carbonara = Product(
  id: 5,
  nameProduct: 'Carbonara',
  price: 6.50,
  isNoVeg: true,
  productType: pasta,
);
final chickenNagets = Product(
  id: 6,
  nameProduct: 'Chicken Nagets',
  price: 6.50,
  isNoVeg: true,
  productType: fleisch,
);
final spribs = Product(
  id: 6,
  nameProduct: 'Speribs',
  price: 6.50,
  isNoVeg: true,
  productType: fleisch,
  top10: true,
);
final chickenWings = Product(
  id: 6,
  nameProduct: 'Chicken Wings',
  price: 6.50,
  isNoVeg: true,
  productType: fleisch,
);
final tramisu = Product(
  id: 7,
  nameProduct: 'Teramisu',
  price: 6.50,
  isNoVeg: true,
  productType: desserts,
  top10: true,
);
final mohrImHemd = Product(
  id: 7,
  nameProduct: 'Mohr im Hemd',
  price: 6.50,
  isNoVeg: true,
  productType: desserts,
);
final cola = Product(
  id: 8,
  nameProduct: 'Cola',
  price: 6.50,
  isNoVeg: true,
  productType: getraenke,
);
final fanta = Product(
  id: 8,
  nameProduct: 'Fanta',
  price: 6.50,
  isNoVeg: true,
  productType: getraenke,
  top10: true,
);
final bier = Product(
  id: 8,
  nameProduct: 'Bier',
  price: 6.50,
  isNoVeg: true,
  productType: getraenke,
);
final eisTee = Product(
  id: 8,
  nameProduct: 'Eis Tee',
  price: 6.50,
  isNoVeg: true,
  productType: getraenke,
  top10: true,
);
final a = Product(
  id: 9,
  nameProduct: 'A',
  price: 0.0,
  isNoVeg: true,
  productType: allergene,
);
final b = Product(
  id: 9,
  nameProduct: 'B',
  price: 0.0,
  isNoVeg: true,
  productType: allergene,
);
final c = Product(
  id: 9,
  nameProduct: 'C',
  price: 0.0,
  isNoVeg: true,
  productType: allergene,
);
final d = Product(
  id: 9,
  nameProduct: 'D',
  price: 0.0,
  isNoVeg: true,
  productType: allergene,
);
final f = Product(
  id: 9,
  nameProduct: 'F',
  price: 0.0,
  isNoVeg: true,
  productType: allergene,
);

class Extra{
  String name;
  String? subtitle;
  String? allergy;
  String note;
  String? photo;
  double price;
  bool selected;
  Extra({required this.name,this.subtitle,this.allergy,this.note='Keine Hinweise',this.photo,required this.price,this.selected=false});
}

class ShoppingCart {
  final Order? order;
  final UserAccount ?user;

  ShoppingCart({this.order, this.user});
}

class Order {
  final Resturant? resturant;
  final Product? product;
  int? quantity;
  double? totalPrise;

  Order({
    this.resturant,
    this.product,
    this.quantity,
    this.totalPrise,
  });
}

class UserAccount {
  final Order? order;
  final List<String>? favorit;
  String? firstName;
  String? lastName;
  String ?nicName;
  String ?email;
  String? password;
  bool ?licked;
  String? photo;
  final String? key;

  UserAccount({
    this.order,
    this.favorit,
    this.firstName,
    this.lastName,
    this.nicName,
    this.email,
    this.password,
    this.licked = false,
    this.photo,
    this.key,
  });
}

