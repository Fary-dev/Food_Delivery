import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mjam/Screens/Resturants/Resturant_List/Resturant_List_Controller.dart';
import 'package:mjam/models_and_data/Class/models_and_data.dart';
import 'package:mjam/Widgets/Rating.dart';
import '../PageResturant/pageResturant.dart';

class ResturantListe extends StatefulWidget {
  ResturantListe({Key key}) : super(key: key);

  @override
  _ResturantListeState createState() => _ResturantListeState();
}

class _ResturantListeState extends State<ResturantListe> {
  final ResturantListController sortList = Get.find();

  @override
  void initState() {

    super.initState();
     if (sortList.defaultListResturant.isEmpty)
      sortList.defaultListResturant.addAll(resturants);

  }

  @override
  Widget build(BuildContext context) {
    return Obx(
       () => ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: sortList.list.isEmpty
            ? sortList.defaultListResturant.length
            : sortList.list.length,
        itemBuilder: (context, index) {
          final Resturant _resturant = sortList.list.isEmpty
              ?sortList.defaultListResturant[index]
              : sortList.list[index];

          return GestureDetector(
            onTap: () {
              Get.to(() => PageResturant(
                    resturant: _resturant,
                  ));
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
                          child: Image.asset(_resturant.photoResturant,
                              height: 140,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.fitWidth),
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
                              child: Text('${_resturant.deliveryDuration} min',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .button
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
                                  '${(_resturant.distance / 1000).toStringAsFixed(1)} km',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .button
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
                                _resturant.nameResturant,
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
                                _resturant.description,
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
                          child: Image.asset(_resturant.logoResturant,
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
                                  _resturant.ratingResturant.toString(),
                                  textAlign: TextAlign.center,
                                  textScaleFactor: 1.0,
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headline3,
                                ),
                              ),
                              rating(20.0, 105.0, 15.0,
                                  Theme.of(context).bottomAppBarTheme.color),
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
                                  "\€ ${_resturant.deliveryPrice.toString().padRight(4, '0')}",
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
                                  "\€ ${_resturant.minimumOrder.toString().padRight(5, '0')}",
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
