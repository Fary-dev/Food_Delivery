import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mjam/Widgets/search.dart';
import 'package:mjam/Widgets/Rating.dart';
import 'package:mjam/models_and_data/models_and_data.dart';

import 'info_resturant.dart';

class PageResturant extends StatefulWidget {
  final Resturant resturant;
  PageResturant(this.resturant, {Key key}) : super(key: key);

  @override
  _PageResturantState createState() => _PageResturantState(resturant);
}

class _PageResturantState extends State<PageResturant>
    with SingleTickerProviderStateMixin {
  final Resturant resturant;

  _PageResturantState(this.resturant);

  bool likeBottumPress = false;
  TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController =
        TabController(length: resturant.products.length, vsync: this);
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
                    icon: Icon(
                        likeBottumPress
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: likeBottumPress
                            ? Colors.red[700]
                            : Colors.red[700]),
                    onPressed: () {
                      setState(() {
                        likeBottumPress = !likeBottumPress;
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
                        resturant.photoResturant.toString(),
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
                              resturant.nameResturant,
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
                                      builder: (context) =>
                                          InfoResturant(resturant),
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
                            resturant.ratingResturant.toString(),
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
                              " ca.${resturant.deliveryDuration}min",
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
                              "${resturant.distance} km",
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
//========================================= TabBar =============================
              bottom: TabBar(
                labelStyle:
                    TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                isScrollable: true,
                indicatorColor: Colors.red[700],
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black,
                indicatorWeight: 4,
                tabs: [
                  for (int i = 0; i < resturant.products.length; i++)
                    Tab(text: resturant.products[i].nameProducts),
                ],
                controller: tabController,
              ),
            ),
          ];
        },
//==================================== TabBarView ==============================

        body: TabBarView(controller: tabController, children: [
          for (int i = 0; i < resturant.products.length; i++)
            ListView(
              children: [
                Card(
                  child: Container(
                      height: 100,
                      child: Image.asset(
                        resturant.photoResturant,
                        fit: BoxFit.fitWidth,
                      )),
                ),
                for (Product product in resturant.product)
                  if (resturant.products[i].id == product.id)
                    Card(
                      child: Container(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  product.nameProduct,
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '\€ ${product.price.toString().padRight(4, "0")}',
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
                                          borderRadius:
                                              BorderRadius.circular(3)),
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
            ),
        ]),
      ),
    );
  }
}
