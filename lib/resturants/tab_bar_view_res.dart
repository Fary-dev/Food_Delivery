import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mjam/resturants/resturants_infos.dart';

class TabBarViewRes extends StatefulWidget {
  final Res res;

  TabBarViewRes(this.res, {Key key}) : super(key: key);
  @override
  _TabBarViewResState createState() => _TabBarViewResState(res);
}

class _TabBarViewResState extends State<TabBarViewRes> {
  final Res res;

  List sller = ResturantList.toList();

  _TabBarViewResState(this.res);

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          child: Container(
              height: 100,
              child: Image.asset(
                res.fotoR,
                fit: BoxFit.fitWidth,
              )),
        ),
        Card(
          child: Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'test',
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '\€ 6.50',
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                    SizedBox(width: 10),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: Colors.green[700],
                              borderRadius: BorderRadius.circular(3)),
                          //color: Colors.grey[400],
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.add_sharp,
                            color: Colors.tealAccent[100],
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
