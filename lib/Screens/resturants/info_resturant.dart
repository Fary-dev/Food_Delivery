import 'package:flutter/material.dart';
import 'package:mjam/Contants/Color.dart';
import 'package:mjam/Widgets/Rating.dart';
import 'package:mjam/models_and_data/Class/models_and_data.dart';

class InfoResturant extends StatelessWidget {
  final Resturant resturant;
  InfoResturant(this.resturant);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
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
                color: greyColor,
                child: Image.asset(
                  resturant.photoInfoPage.toString(),
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
                      color: primaryColor,
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
                    resturant.nameResturant,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 20,
                      color: blackColor,
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
                  height: 20,
                  width: 100,
                  child: Rating(),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  resturant.ratingResturant.toString(),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 10,
                    color: blackColor,
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
                    " ca.${resturant.deliveryDuration}min",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      letterSpacing: 0.4,
                      decoration: TextDecoration.none,
                      fontSize: 14,
                      color: blackColor,
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
                    "${resturant.distance} km",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      letterSpacing: 0.4,
                      decoration: TextDecoration.none,
                      fontSize: 14,
                      color: blackColor,
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
                    "  \€ ${resturant.deliveryPrice}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      letterSpacing: 0.4,
                      decoration: TextDecoration.none,
                      fontSize: 14,
                      color: blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Container(
                    child: Icon(
                  Icons.shopping_cart_outlined,
                  size: 20,
                )),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "  \€ ${resturant.deliveryPrice}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      letterSpacing: 0.4,
                      decoration: TextDecoration.none,
                      fontSize: 14,
                      color: blackColor,
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
              '${resturant.openingTime}',
              style: TextStyle(fontSize: 14, color: greyColor),
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
              resturant.address.toString(),
              style: TextStyle(fontSize: 14, color: greyColor),
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
              resturant.owner,
              style: TextStyle(fontSize: 14, color: greyColor),
            ),
          )
        ],
      )),
    );
  }
}
