import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mjam/bloc/blocEvents/events.dart';
import 'package:mjam/bloc/productBloc.dart';
import 'package:mjam/models_and_data/models_and_data.dart';
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
        physics: NeverScrollableScrollPhysics(),
        itemCount: resturants.length,
        itemBuilder: (context, index) {
          Resturant resturant = resturants[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PageResturant(resturant)));
            },
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  /////__________________ List Resturant _________/////////////////////////////7////
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 15, 15, 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Image.asset(resturant.photoResturant,
                        height: 140,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fitWidth),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 20,
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(left: 15),
                              child: Text(
                                resturant.nameResturant,
                                textAlign: TextAlign.center,
                                textScaleFactor: 1.5,
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Container(
                              height: 15,
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(left: 15, top: 3),
                              child: Text(
                                resturant.description,
                                textAlign: TextAlign.center,
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                    color: Colors.black38, fontSize: 11),
                              ),
                            )
                          ],
                        ),
                        FittedBox(
                          child: Container(
                            margin: EdgeInsets.only(right: 15),
                            height: 40,
                            width: 80,
                            child: Image.asset(resturant.logoResturant,
                                height: 20,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.contain),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 15, top: 15),
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
                                margin: EdgeInsets.only(left: 15, top: 7),
                                child: Text(
                                  resturant.ratingResturant.toString(),
                                  textAlign: TextAlign.center,
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                      color: Colors.black38, fontSize: 11),
                                ),
                              ),
                              Container(
                                child: Rating(),
                                margin: EdgeInsets.only(left: 15),
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
                                margin: EdgeInsets.only(left: 15, top: 11),
                                child: Text(
                                  "Liefergebühr",
                                  textAlign: TextAlign.center,
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                      color: Colors.black38, fontSize: 11),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "\€ ${resturant.deliveryPrice.toString().padRight(4, '0')}",
                                  textAlign: TextAlign.center,
                                  textScaleFactor: 1.0,
                                  style: TextStyle(color: Colors.black),
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
                                margin: EdgeInsets.only(
                                    left: 15, top: 11, right: 15),
                                child: Text(
                                  "Minimum",
                                  textAlign: TextAlign.center,
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                      color: Colors.black38, fontSize: 11),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "\€ ${resturant.minimumOrder.toString().padRight(5, '0')}",
                                  textAlign: TextAlign.center,
                                  textScaleFactor: 1.0,
                                  style: TextStyle(color: Colors.black),
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
