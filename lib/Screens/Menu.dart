import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geocoder/model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mjam/Widgets/listFoodGrupe.dart';
import 'package:mjam/home_Screen_Tile/Bottom_Filter_Abholung_sort.dart';
import 'package:mjam/myBloc/myBloc.dart';
import 'package:mjam/resturants/resturans_liste.dart';
import 'package:provider/provider.dart';
import '../Widgets/Banr.dart';

class Menu extends StatefulWidget {
  Menu({Key key}) : super(key: key);
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  var add6 = '';
  var add7 = '';
  var add10 = '';
  var add11 = '';
  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    print(lastPosition);
    var lat = position.latitude;
    var long = position.longitude;
    final coordinates = new Coordinates(lat, long);
    var address =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    setState(() {
      add6 = address.first.locality;
      add7 = address.first.postalCode;
      add10 = address.first.subThoroughfare;
      add11 = address.first.thoroughfare;
      Timer(Duration(seconds: 0), () {
        MyBloc myBloc = Provider.of(
          context,
          listen: false,
        );
        myBloc.setLocation('$add11 $add10, $add6 $add7');
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    MyBloc myBloc = Provider.of<MyBloc>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: RichText(
              text: TextSpan(children: [
            TextSpan(
              text: "Sofort zu ",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                letterSpacing: 0.5,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextSpan(
                text: myBloc.location.toString(),
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                )),
          ])),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 7),
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: FoodGrupe(),
              ),
              ////////////////___________________ Bottom  ____________////////////
              BottomFilterAbholungSort(),
              SizedBox(height: 5),
              ///////////////____________________ Banner _____________////////////
              Container(
                  padding: EdgeInsets.only(bottom: 0),
                  color: Colors.grey[100],
                  child: Banr()),

              //////______________________ Resturant List ____________////////////
              ResturantListe(),
            ],
          ),
        ),
      ),
    );
  }
}
