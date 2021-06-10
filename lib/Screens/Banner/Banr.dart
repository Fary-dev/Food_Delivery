import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:mjam/Contants/Color.dart';
import 'package:mjam/Screens/Banner/banner_Screen_1.dart';

class Banr extends StatefulWidget {
  Banr({Key key}) : super(key: key);
  //CarouselDemo() : super();

  final String title = "CarouselDemo";

  @override
  BanrState createState() => BanrState();
}

class BanrState extends State<Banr> {
  int _current = 0;
  List imgList = [
    ("assets/mc2.jpg"),
    ("assets/obs1.jpg"),
    ("assets/pom1.jpg"),
    ("assets/ham1.jpg"),
  ];
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  final CarouselController _buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: <Widget>[
          SizedBox(height: 10,),
          CarouselSlider(

            carouselController: _buttonCarouselController,
            options: CarouselOptions(
              onPageChanged: (i, imgeUrl) {
                setState(() {
                  _current = i;
                });
              },
              viewportFraction: 1.0,
              height: 160,
              initialPage: 0,
              enlargeCenterPage: false,
              autoPlay: true,
              reverse: false,
              enableInfiniteScroll: true,
              aspectRatio: 16 / 9,
              autoPlayInterval: Duration(seconds: 5),
              autoPlayAnimationDuration: Duration(milliseconds: 100),
              pauseAutoPlayOnTouch: true,
              scrollDirection: Axis.horizontal,

            ),
            items: imgList.map((imgUrl) {
              return Builder(builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(
                      horizontal: 15.0,
                    ),
                    decoration:
                        BoxDecoration(

                            borderRadius: BorderRadius.circular(5)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      child: InkWell(
                        onTap: () {
                          Get.to(BannerScreen1());
                        },
                        child: Image(
                          image: AssetImage(
                            imgUrl,
                          ),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ));
              });
            }).toList(),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: map<Widget>(imgList, (i, imagurl) {
              return Container(
                width: 8,
                height: 8,
                margin: EdgeInsets.symmetric(horizontal: 4, vertical: 5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == i ? primaryColor : Theme.of(context).hoverColor,
                ),
              );
            }),
          ),
          SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
