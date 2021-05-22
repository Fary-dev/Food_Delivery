import 'package:flutter/material.dart';

import 'package:mjam/Contants/Color.dart';
import 'package:mjam/Screens/Resturants/pageResturant.dart';
import 'package:mjam/models_and_data/Class/models_and_data.dart';

class Searching extends StatefulWidget {
  @override
  _SearchingState createState() => _SearchingState();
}

class _SearchingState extends State<Searching> {
  TextEditingController _textEditingController = TextEditingController();
  List<Resturant> res = [];
  List searchList = [];
  var resturantsList = [];

  @override
  void initState() {
    for (var a in resturants) {
      res.add(a);
    }
    resturantsList = res;
    super.initState();
  }

  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            color: whiteColor,
            height: 60,
            width: MediaQuery.of(context).size.width,
            child: TextField(
              keyboardType: TextInputType.text,
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: "Resturant suchen...",
                prefixIcon: Icon(
                  Icons.search,
                  size: 25,
                  color: primaryColor,
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
              ),
              onChanged: _onChange,
            ),
          ),
        ),
        body: ListView.builder(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemCount: searchList.length,
          itemBuilder: (context, index) {
            var listViewSearch = searchList[index];

            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PageResturant(listViewSearch)));
              },
              child: Card(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            listViewSearch.nameResturant,
                            style: Theme.of(context).primaryTextTheme.bodyText1,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            listViewSearch.description,
                            style: Theme.of(context).primaryTextTheme.bodyText2,
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Container(
                          height: 40,
                          width: 80,
                          child: Image.asset(
                            listViewSearch.logoResturant,
                            fit: BoxFit.contain,
                          )),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _onChange(value) {
    setState(() {
      searchList.clear();

      if (value.isNotEmpty) {
        res.forEach((element) {
          if (element.nameResturant
              .toLowerCase()
              .contains(value.toLowerCase())) {
            setState(() {
              searchList.add(element);
            });
          }
        });
      }
    });
  }
}
