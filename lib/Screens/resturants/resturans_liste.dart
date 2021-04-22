import 'package:flutter/material.dart';
import 'package:mjam/models_and_data/Class/models_and_data.dart';
import 'package:mjam/Widgets/Rating.dart';

import 'pageResturant.dart';

class ResturantListe extends StatefulWidget {
  ResturantListe({Key key}) : super(key: key);
  @override
  _ResturantListeState createState() => _ResturantListeState();
}

class _ResturantListeState extends State<ResturantListe> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: resturants.length,
        itemBuilder: (context, index) {
          final Resturant _resturant = resturants[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PageResturant(_resturant)));
            },
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  /////__________________ List Resturant _________/////////////////////////////7////
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 15, 15, 5),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Image.asset(_resturant.photoResturant,
                        height: 140,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fitWidth),
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
                                _resturant.nameResturant,
                                textAlign: TextAlign.center,
                                textScaleFactor: 1.5,
                                style: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Container(
                              height: 15,
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(left: 15, top: 3),
                              child: Text(
                                _resturant.description,
                                textAlign: TextAlign.center,
                                textScaleFactor: 1.0,
                                style: const TextStyle(
                                    color: Colors.black38, fontSize: 11),
                              ),
                            )
                          ],
                        ),
                        FittedBox(
                          child: Container(
                            margin: const EdgeInsets.only(right: 15),
                            height: 40,
                            width: 80,
                            child: Image.asset(_resturant.logoResturant,
                                height: 20,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.contain),
                          ),
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
                                  _resturant.ratingResturant.toString(),
                                  textAlign: TextAlign.center,
                                  textScaleFactor: 1.0,
                                  style: const TextStyle(
                                      color: Colors.black38, fontSize: 11),
                                ),
                              ),
                              Container(
                                // ignore: sort_child_properties_last
                                child: Rating(),
                                margin: const EdgeInsets.only(left: 15),
                                height: 20,
                                width: 100,
                              ),
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
                                child: const Text(
                                  "Liefergebühr",
                                  textAlign: TextAlign.center,
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                      color: Colors.black38, fontSize: 11),
                                ),
                              ),
                              Container(
                                child: Text(
                                  // ignore: unnecessary_string_escapes
                                  "\€ ${_resturant.deliveryPrice.toString().padRight(4, '0')}",
                                  textAlign: TextAlign.center,
                                  textScaleFactor: 1.0,
                                  style: const TextStyle(color: Colors.black),
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
                                child: const Text(
                                  "Minimum",
                                  textAlign: TextAlign.center,
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                      color: Colors.black38, fontSize: 11),
                                ),
                              ),
                              Container(
                                child: Text(
                                  // ignore: unnecessary_string_escapes
                                  "\€ ${_resturant.minimumOrder.toString().padRight(5, '0')}",
                                  textAlign: TextAlign.center,
                                  textScaleFactor: 1.0,
                                  style: const TextStyle(color: Colors.black),
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
                      color: Colors.grey[100],
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
