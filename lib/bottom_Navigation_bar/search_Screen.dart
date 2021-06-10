import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:mjam/Contants/Color.dart';
import 'package:mjam/Screens/Resturants/pageResturant.dart';
import 'package:mjam/Widgets/BottomNavBarWidget.dart';
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
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          brightness: Theme.of(context).appBarTheme.brightness,
          automaticallyImplyLeading: false,
          flexibleSpace: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Get.to(() => BottomNavBarWidget());
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 25,
                  )),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    style: Theme.of(context)
                        .primaryTextTheme
                        .headline3
                        .apply(fontSizeDelta: 2),
                    keyboardType: TextInputType.text,
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                      fillColor: Theme.of(context).scaffoldBackgroundColor,
                      hintText: "Resturant suchen...",
                      hintStyle: Theme.of(context).primaryTextTheme.subtitle1,
                      suffixIcon: _textEditingController.text != ''
                          ? IconButton(
                              onPressed: () {
                                _textEditingController.clear();
                                searchList.clear();
                                setState(() {});
                              },
                              icon: Icon(
                                Icons.cancel_outlined,
                                size: 15,
                                color: primaryColor,
                              ),
                            )
                          : null,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    onChanged: _onChange,
                  ),
                ),
              ),
            ],
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
                        builder: (context) =>
                            PageResturant(resturant: listViewSearch)));
              },
              child: Card(
                color: Theme.of(context).cardColor,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
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
                            style: Theme.of(context).primaryTextTheme.subtitle1,
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
