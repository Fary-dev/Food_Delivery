import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mjam/Widgets/search.dart';
import 'package:mjam/Widgets/Rating.dart';
import 'package:mjam/resturants/info_gesch%C3%A4fte.dart';
import 'package:mjam/resturants/resturants_infos.dart';
import 'package:mjam/resturants/tab_bar_view_res.dart';

class PageResturant extends StatefulWidget {
  final Res res;
  PageResturant(this.res, {Key key}) : super(key: key);

  @override
  _PageResturantState createState() => _PageResturantState(res);
}

class _PageResturantState extends State<PageResturant>
    with SingleTickerProviderStateMixin {
  final Res res;

  _PageResturantState(this.res);

  bool like = false;
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: res.listTab.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: IconButton(
                    icon: Icon(like ? Icons.favorite : Icons.favorite_border,
                        color: like ? Colors.red[700] : Colors.red[700]),
                    onPressed: () {
                      setState(() {
                        like = !like;
                      });
                    },
                  ),
                )
              ],
              elevation: 10,
              leading: BottomAppBar(
                elevation: 0,
                color: Colors.transparent,
                child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.red[700],
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ),
              pinned: true,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 180.0,
                      width: double.infinity,
                      color: Colors.grey,
                      child: Image.asset(
                        res.fotoR.toString(),
                        width: double.infinity,
                        fit: BoxFit.fitWidth,
                      ),
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
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: IconButton(
                              icon: Icon(
                                Icons.info_outline,
                                size: 38,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => InfoGeschaeft(res),
                                    ));
                              },
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
                      height: 15,
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
                                fontSize: 10,
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
                                fontSize: 10,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      elevation: 0,
                      borderOnForeground: false,
                      margin: EdgeInsets.only(top: 10),
                      child: Container(
                        color: Colors.grey[100],
                        child: Container(
                          color: Colors.white,
                          margin: EdgeInsets.only(top: 8, bottom: 8),
                          //margin: EdgeInsets.only(left: 0),
                          child: Search(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              expandedHeight: 400.0,
              bottom: TabBar(
                labelStyle:
                    TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                isScrollable: true,
                indicatorColor: Colors.red[700],
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black,
                indicatorWeight: 4,
                tabs: [
                  for (int i = 0; i < res.listTab.length; i++)
                    Tab(text: res.listTab[i]),
                ],
                controller: controller,
              ),
            ),
          ];
        },
        body: TabBarView(controller: controller, children: [
          for (int i = 0; i < res.listTab.length; i++) TabBarViewRes(res)
        ]),
      ),
    );
  }
}
