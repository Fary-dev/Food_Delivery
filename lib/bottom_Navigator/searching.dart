import 'package:flutter/material.dart';
import 'package:mjam/Screens/resturants/resturans_liste.dart';
import 'package:mjam/models_and_data/models_and_data.dart';

class Searching extends StatefulWidget {
  @override
  _SearchingState createState() => _SearchingState();
}

class _SearchingState extends State<Searching> {
  // ignore: deprecated_member_use
  List items = new List();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          TextField(
            onChanged: (String value) {
              items.clear();
              if (value.isEmpty) {
                items.addAll(resturants);
              } else {
                resturants.forEach((element) {
                  if (element
                      .toString()
                      .toLowerCase()
                      .contains(value.toLowerCase())) {
                    items.add(element);
                  }
                });
              }
            },
            decoration: InputDecoration(
              hintText: "Gericht suchen...",
              // labelText: 'Resturant suchen',

              prefixIcon: Icon(
                Icons.search,
                size: 25,
                color: Colors.red[700],
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
          ResturantListe(),
        ],
      ),
    );
  }
}
