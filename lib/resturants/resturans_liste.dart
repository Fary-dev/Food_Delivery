import 'package:flutter/material.dart';
import 'package:mjam/resturants/pageResturant.dart';
import 'package:mjam/Widgets/Rating.dart';
import 'package:mjam/resturants/resturants_infos.dart';

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
        itemCount: ResturantList.length,
        itemBuilder: (context, index) {
          Res res = ResturantList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PageResturant(res)));
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
                    child: Image.asset(res.fotoR,
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
                                res.nameR,
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
                                res.detailR,
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
                            child: Image.asset(res.logoR,
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
                                  res.nRatingR.toString(),
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
                                  res.liferPreisR.toString(),
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
                                  res.minBestellR.toString(),
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
