import 'package:flutter/material.dart';

class Res {
  int id;

  var nameR; //نام رستوران
  var detailR; //در مورد رستوران
  var fotoR; //عکس رستوران
  var logoR; //لوگو رستوران
  var nRatingR; //امتیاز رستوران
  var liferPreisR; //هزینه ارسال
  var minBestellR; //حداقل سفارش
  var liferTimeR; //مدت زمان تحویل
  var entferR; //فاصله با رستوران
  var infoR; //در مورد رستوران
  List listTab; //لیست منو رستوران
  var offnungZeit;
  var adresse;
  var eigentumer;
  var fotoInfo;

  Res({
    @required this.id,
    @required this.nameR,
    @required this.detailR,
    @required this.fotoR,
    @required this.logoR,
    @required this.nRatingR,
    @required this.liferPreisR,
    @required this.minBestellR,
    @required this.liferTimeR,
    @required this.entferR,
    @required this.infoR,
    @required this.listTab,
    @required this.offnungZeit,
    @required this.adresse,
    @required this.eigentumer,
    @required this.fotoInfo,
  });
}

// ignore: non_constant_identifier_names
List<Res> ResturantList = [
  Res(
      id: 1,
      nameR: 'Horner Pizzaservice',
      detailR: 'Beste Pizza & Schnizel',
      fotoR: 'assets/HornerPizzaa.jpg',
      logoR: 'assets/hornerpizza.png',
      nRatingR: 1852,
      liferPreisR: 2.00,
      minBestellR: 20,
      liferTimeR: 30,
      entferR: 1.7,
      infoR: true,
      listTab: [
        'Top 10',
        'Pizza',
        'Salate',
        'Burger',
        'Pasta',
        'Fleischgerichte',
        'Desserts',
        'Getränke',
        'Allergene & Zusatztoffe'
      ],
      offnungZeit: '11:00 - 22:00',
      adresse: 'Prager Straße 50, 3580 Horn',
      eigentumer: 'Mohammad Azam Alami',
      fotoInfo: 'assets/hornerinfo.jpeg'),
  // ignore: missing_required_param
  Res(
      id: 2,
      nameR: 'Mcdonald\'s',
      detailR: 'MCDONALD\'S ÖSTERREICH',
      fotoR: 'assets/mc2.jpg',
      logoR: 'assets/Mc1.png',
      nRatingR: 98,
      liferPreisR: 3.50,
      minBestellR: 30,
      liferTimeR: 45,
      entferR: 1.7,
      infoR: true,
      listTab: [
        'Top 10',
        'jetzt neu',
        'Mcmenüs',
        'Burger',
        'Chicken Mcnuggets',
        'Wraps & Salate',
        'Pommes',
        'Getränke',
        'Desserts',
        'Mccaffe Kuchen',
        'Happy Meal',
        'Spezial-Veggie',
        'Extras-Dips & Dressings',
        'Allergene & Zusatztoffe'
      ],
      offnungZeit: '11:00 - 19:00',
      adresse: 'Wiener Straße 4, 3580 Horn',
      eigentumer: 'Marschalek GmbH',
      fotoInfo: 'assets/mcinfo.jpeg'),
  // ignore: missing_required_param
  Res(
      id: 3,
      nameR: 'Resturant Milano',
      detailR: 'Pizza Pasta Schnizel',
      fotoR: 'assets/Milano.jpg',
      logoR: 'assets/milano.png',
      nRatingR: 1584,
      liferPreisR: 1.50,
      minBestellR: 25,
      liferTimeR: 30,
      entferR: 1.3,
      infoR: true,
      listTab: [
        'Top 10',
        'Pizza',
        'Suppen',
        'Salate',
        'Kalte Vorspeisen',
        'Warme Vorspeisen',
        'Kinder Pizza',
        'Geschlossene Pizzen',
        'Mexikanische Pizza',
        'Pasta',
        'Pfannengrechte',
        'Grillspezialitäten',
        'Hausgemachtes Dürüm',
        'Hausgemachtes Kebapbrot',
        'Desserts',
        'Alkoholfreie Getränke',
        'Alkoholische Getränke',
        'Allergene & Zusatztoffe'
      ],
      offnungZeit: '11:00 - 22:00',
      adresse: 'Prager Straße 10, 3580 Horn',
      eigentumer: 'Ibrahim BUGDAYCI',
      fotoInfo: 'assets/milanoinfo.jpg'),
  // ignore: missing_required_param
  Res(
      id: 4,
      nameR: 'Schnitzelpalast',
      detailR: 'Schnitzel für immer',
      fotoR: 'assets/Schnitzel.jpg',
      logoR: 'assets/schnitzelp.png',
      nRatingR: 1322,
      liferPreisR: 3.00,
      minBestellR: 20,
      liferTimeR: 30,
      entferR: 1.7,
      infoR: true,
      listTab: [
        'Top 10',
        'Schnitzel',
        'Schnitzelsemmel & Co.',
        'Fleischgerichte',
        'Fischgerichte und Vegetarische Speisen',
        'Kinder Gerichte',
        'Nachspeisen',
        'Salate',
        'Beilagen',
        'Alkoholfreie Getränke',
        'Alkoholische Getränke',
        'Allergene & Zusatztoffe'
      ],
      offnungZeit: '11:00 - 19:00',
      adresse: 'Wiener Straße 5, 3580 Frauenhofen',
      eigentumer: 'BIRO & CO KG',
      fotoInfo: 'assets/schnitzelinfo.jpg'),
  // ignore: missing_required_param
  Res(
      id: 5,
      nameR: 'Restaurant Arian',
      detailR: 'Mittagessen, Abendessen',
      fotoR: 'assets/Ariana.jpg',
      logoR: 'assets/arian.jpg',
      nRatingR: 2476,
      liferPreisR: 2.90,
      minBestellR: 30,
      liferTimeR: 45,
      entferR: 0.9,
      infoR: true,
      listTab: [
        'Top 10',
        'Vorspeisen und Suppen',
        'Salate',
        'Spezialitäten',
        'Fischspezialitäten',
        'Vegetarische Speisen',
        'Pasta',
        'Pizza aus dem Holzofen',
        'Allergene & Zusatztoffe'
      ],
      offnungZeit: '11:00 - 21:00',
      adresse: 'Taffatal 4, 3580 Horn',
      eigentumer: 'Arian GmbH',
      fotoInfo: 'assets/arianinfo.jpg'),
];
