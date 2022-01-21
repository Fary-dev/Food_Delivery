import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mjam/Screens/Resturants/Resturant_List/Resturant_List_Controller.dart';
import 'package:mjam/Screens/Resturants/PageResturant/NewScreen/pageResturant.dart';
import 'package:mjam/models_and_data/Class/models_and_data.dart';
import 'package:mjam/Widgets/Rating.dart';

class ResturantListe extends StatefulWidget {
  ResturantListe({Key? key}) : super(key: key);

  @override
  _ResturantListeState createState() => _ResturantListeState();
}

class _ResturantListeState extends State<ResturantListe> {
<<<<<<< HEAD
<<<<<<< HEAD
  final ResturantListController sortList = Get.put(ResturantListController());
  final GlobalKey _globalKey = GlobalKey();
=======
=======
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
  final ResturantListController sortList = Get.find();

  @override
  void initState() {
    super.initState();
    if (sortList.defaultListResturant.isEmpty)
      sortList.defaultListResturant.addAll(resturants);
  }
<<<<<<< HEAD
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
=======
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        key: _globalKey,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: sortList.list.isEmpty
            ? sortList.defaultListResturant.length
            : sortList.list.length,
        itemBuilder: (context, index) {
<<<<<<< HEAD
<<<<<<< HEAD
          final Resturant resturant = sortList.sort.value == ''
              ? resturants[index]
=======
          final Resturant _resturant = sortList.list.isEmpty
              ? sortList.defaultListResturant[index]
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
=======
          final Resturant _resturant = sortList.list.isEmpty
              ? sortList.defaultListResturant[index]
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
              : sortList.list[index];

          return GestureDetector(
            onTap: () {
<<<<<<< HEAD
<<<<<<< HEAD
              Get.to(() => PageResturant(resturant: resturant));
=======
=======
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
              Get.to(() => PageResturant(
                    resturant: _resturant,
                  ));
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
            },
            child: Container(
              color: Theme.of(context).bottomAppBarTheme.color,
              child: Column(
                children: [
                  /////__________________ List Resturant _________/////////////////////////////7////
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
<<<<<<< HEAD
<<<<<<< HEAD
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     PageRouteBuilder(
                              //         transitionDuration: Duration(seconds: 2),
                              //         pageBuilder: (_, __, ___) => PageResturant(
                              //               resturant: resturant,
                              //             )));
                              Get.to(() => PageResturant(resturant: resturant));
                            },
                            child: Image.asset(resturant.photoResturant,
                                height: 140,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.fitWidth),
                          ),
=======
=======
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
                          child: Image.asset(_resturant.photoResturant!,
                              height: 140,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.fitWidth),
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 20,
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(5, 3, 5, 3),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
<<<<<<< HEAD
                              child: Text('${resturant.deliveryDuration} min',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .button
=======
                              child: Text('${_resturant.deliveryDuration} min',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .button!
<<<<<<< HEAD
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
=======
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
                                      .apply(fontSizeDelta: -1)),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(5, 3, 5, 3),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Text(
<<<<<<< HEAD
<<<<<<< HEAD
                                  '${(resturant.distance / 1000).toStringAsFixed(1)} km',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .button
=======
=======
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
                                  '${(_resturant.distance! / 1000).toStringAsFixed(1)} km',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .button!
<<<<<<< HEAD
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
=======
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
                                      .apply(fontSizeDelta: -1)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 20,
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(left: 15),
                              child: Text(
<<<<<<< HEAD
<<<<<<< HEAD
                                resturant.nameResturant,
=======
                                _resturant.nameResturant!,
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
=======
                                _resturant.nameResturant!,
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
                                textAlign: TextAlign.center,
                                textScaleFactor: 1.5,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headline2,
                              ),
                            ),
                            Container(
                              height: 15,
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(left: 15, top: 3),
                              child: Text(
<<<<<<< HEAD
<<<<<<< HEAD
                                resturant.description,
=======
                                _resturant.description!,
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
=======
                                _resturant.description!,
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
                                textAlign: TextAlign.center,
                                textScaleFactor: 1.0,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .subtitle1,
                              ),
                            )
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 15),
                          height: 40,
                          width: 80,
<<<<<<< HEAD
<<<<<<< HEAD
                          child: Image.asset(resturant.logoResturant,
=======
                          child: Image.asset(_resturant.logoResturant!,
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
=======
                          child: Image.asset(_resturant.logoResturant!,
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
                              height: 20,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.contain),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 15, top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 15,
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(left: 15, top: 7),
                                child: Text(
                                  resturant.ratingResturant.toString(),
                                  textAlign: TextAlign.center,
                                  textScaleFactor: 1.0,
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headline3,
                                ),
                              ),
<<<<<<< HEAD
<<<<<<< HEAD
                              rating(20.0, 105.0, 15.0,
                                  Theme.of(context).bottomAppBarTheme.color),
=======
=======
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: rating(5.0, 0.0, 15.0, Colors.amber),
                              ),
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                height: 15,
                                alignment: Alignment.topLeft,
                                margin:
                                    const EdgeInsets.only(left: 15, top: 11),
                                child: Text(
                                  "Liefergebühr",
                                  textAlign: TextAlign.center,
                                  textScaleFactor: 1.0,
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headline3,
                                ),
                              ),
                              Container(
                                child: Text(
                                  "\€ ${resturant.deliveryPrice.toString().padRight(4, '0')}",
                                  textAlign: TextAlign.center,
                                  textScaleFactor: 1.0,
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headline3,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                height: 15,
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(
                                    left: 15, top: 11, right: 15),
                                child: Text(
                                  "Minimum",
                                  textAlign: TextAlign.center,
                                  textScaleFactor: 1.0,
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headline3,
                                ),
                              ),
                              Container(
                                child: Text(
                                  "\€ ${resturant.minimumOrder.toString().padRight(5, '0')}",
                                  textAlign: TextAlign.center,
                                  textScaleFactor: 1.0,
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headline3,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                    child: Container(
                      color: Theme.of(context).backgroundColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
