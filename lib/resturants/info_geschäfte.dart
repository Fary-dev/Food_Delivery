import 'package:flutter/material.dart';
import 'package:mjam/Widgets/Rating.dart';
import 'package:mjam/resturants/resturants_infos.dart';

class InfoGeschaeft extends StatelessWidget {
  final Res res;
  InfoGeschaeft(this.res);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 350.0,
                width: double.infinity,
                color: Colors.grey,
                child: Image.asset(
                  res.fotoInfo.toString(),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 53,
                left: 4,
                child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.red[700],
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.all(0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  alignment: Alignment.topLeft,
                  child: Text(
                    res.nameR,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Container(
                  //padding: EdgeInsets.all(0),
                  //alignment: Alignment.topLeft,
                  height: 20,
                  width: 100,
                  child: Rating(),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '(${res.nRatingR})',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 10,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Container(
            margin: EdgeInsets.only(top: 5, left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.only(left: 0),
                    child: Icon(
                      Icons.timer_outlined,
                      size: 20,
                    )),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    " ca.${res.liferTimeR}min",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      letterSpacing: 0.4,
                      decoration: TextDecoration.none,
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                    padding: EdgeInsets.only(left: 0),
                    child: Icon(
                      Icons.location_on_outlined,
                      size: 20,
                    )),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${res.entferR} km",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      letterSpacing: 0.4,
                      decoration: TextDecoration.none,
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            margin: EdgeInsets.only(top: 5, left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.only(left: 0),
                    child: Icon(
                      Icons.delivery_dining,
                      size: 20,
                    )),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "  \€ ${res.liferPreisR}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      letterSpacing: 0.4,
                      decoration: TextDecoration.none,
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Container(
                    padding: EdgeInsets.only(left: 0),
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      size: 20,
                    )),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "  \€ ${res.minBestellR}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      letterSpacing: 0.4,
                      decoration: TextDecoration.none,
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              'Öffnungszeiten',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              '${res.offnungZeit}',
              style: TextStyle(fontSize: 14),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              'Adresse',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              '${res.adresse}',
              style: TextStyle(fontSize: 14),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              'Eigentümer',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              '${res.eigentumer}',
              style: TextStyle(fontSize: 14),
            ),
          )
        ],
      )),
    );
  }
}
