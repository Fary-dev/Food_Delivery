import 'package:flutter/material.dart';
import 'package:mjam/Contants/Color.dart';
import 'package:mjam/models_and_data/Class/models_and_data.dart';

class Searching extends StatefulWidget {
  @override
  _SearchingState createState() => _SearchingState();
}

class _SearchingState extends State<Searching> {
  TextEditingController _controller = new TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _formKey,
        appBar: AppBar(
          elevation: 0.0,
          toolbarHeight: 75,
          backgroundColor: whiteColor,
          automaticallyImplyLeading: false,
          flexibleSpace: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              keyboardType: TextInputType.text,
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Resturant suchen...",
                prefixIcon: Icon(
                  Icons.search,
                  size: 25,
                  color: Colors.red[700],
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              ),
              onChanged: _onChange,
            ),
          ),
        ),
        body: ListView.builder(
          // shrinkWrap: true,
          itemCount: searchList.length,
          itemBuilder: (context, index) {
            var f = searchList[index];

            return InkWell(
              onTap: () {},
              child: Card(
                child: Row(
                  children: [
                    Container(
                      height: 30,
                      width: 70,
                      child: Image.asset(
                        '${f.logoResturant}',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text('${f.nameResturant}'),
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
    searchList.clear();
    if (value.isNotEmpty) {
      res.forEach((element) {
        if (element.nameResturant.toLowerCase().contains(value.toLowerCase())) {
          setState(() {
            searchList.add(element);
          });
        }
      });
    }
    setState(() {});
  }
}
