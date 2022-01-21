import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mjam/Contants/Color.dart';
import 'package:mjam/Screens/First_Page/First_Location_controller.dart';
import 'package:mjam/Screens/Resturants/pageResturant.dart';
import 'package:mjam/Widgets/Rating.dart';
import 'package:mjam/models_and_data/Class/models_and_data.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final adress = Get.find<FirstPageController>();
  int prevPage;
  Set<Marker> _list = {};
  GoogleMapController _googleMapController;
  PageController _pageController;

  void mapCreate(controller) {
    setState(() {
      _googleMapController = controller;
    });
  }

  void moveCamera() async {
    _googleMapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target: resturants[_pageController.page.toInt()].latlong,
            zoom: 17.0,
            bearing: 45.0,
            tilt: 45.0)));
  }

  void listPoins() {
    setState(() {
      for (var d in resturants) {
        Marker marker = Marker(
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose),
          draggable: false,
          infoWindow: InfoWindow(title: d.nameResturant),
          markerId: MarkerId('${d.id}'),
          position: d.latlong,
        );
        _list.add(marker);
      }
    });
  }

  _resturantListe(index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 200.0,
            width: Curves.easeInOut.transform(value) * 350.0,
            child: widget,
          ),
        );
      },
      child: InkWell(
        onTap: () {
          Get.to(PageResturant(
            resturant: resturants[index],
          ));
        },
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              height: 200.0,
              width: 280.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                      color: Theme.of(context).iconTheme.color,
                      blurRadius: 5,
                      offset: Offset(0.0, 1.0)),
                  BoxShadow(
                      color: Theme.of(context).iconTheme.color,
                      blurRadius: 5,
                      offset: Offset(1.0, 0.0))
                ],
              ),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).scaffoldBackgroundColor),
                child: Stack(
                  children: [
                    Positioned(
                        top: 15,
                        left: 10,
                        child: Text(resturants[index].nameResturant,
                            style: Theme.of(context)
                                .primaryTextTheme
                                .headline2
                                .copyWith(fontSize: 14))),
                    Positioned(
                        top: 35,
                        left: 10,
                        child: Text(
                          resturants[index].description,
                          style: Theme.of(context).primaryTextTheme.subtitle1,
                        )),
                    Positioned(
                        top: 70,
                        left: 10,
                        child: Row(
                          children: [
                            Icon(
                              CupertinoIcons.map_pin,
                              color: primaryColor,
                              size: 15,
                            ),
                            Text(
                              resturants[index].address,
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: 10,
                                fontFamily: 'Open_Sans-Regular',
                              ),
                            ),
                          ],
                        )),
                    Positioned(
                      top: 15,
                      right: 15,
                      child: Container(
                        height: 30,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                                image: ExactAssetImage(
                                  resturants[index].logoResturant,
                                ),
                                fit: BoxFit.fill)),
                      ),
                    ),
                    Positioned(
                        bottom: 10,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            width: 245,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${resturants[index].ratingResturant} Bewertungen',
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .headline3
                                          .copyWith(fontSize: 10),
                                    ),
                                    rating(
                                        20.0,
                                        105.0,
                                        12.0,
                                        Theme.of(context)
                                            .bottomAppBarTheme
                                            .color),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Distanz',
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .headline3
                                          .copyWith(fontSize: 10),
                                    ),
                                    Text(
                                      '${(resturants[index].distance / 1000).toStringAsFixed(1)} km',
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .headline3
                                          .copyWith(fontSize: 10),
                                    )
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'AbholZeit',
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .headline3
                                          .copyWith(fontSize: 10),
                                    ),
                                    Text(
                                      'ca.${resturants[index].deliveryDuration} min',
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .headline3
                                          .copyWith(fontSize: 10),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    this.listPoins();
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8)
      ..addListener(_onScroll);
  }

  void _onScroll() {
    if (_pageController.page.toInt() != prevPage) {
      prevPage = _pageController.page.toInt();
      moveCamera();
    }
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: GoogleMap(
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              markers: _list,
              onMapCreated: mapCreate,
              initialCameraPosition: CameraPosition(
                bearing: 30,
                tilt: 80,
                target: LatLng(48.666506, 15.655791),
                zoom: 13,
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: 20,
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: blackColor.withOpacity(0.6),
                      blurRadius: 10,
                      offset: Offset.zero,
                    )
                  ]),
              child: IconButton(
                  icon: Icon(
                    CupertinoIcons.arrow_left,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  onPressed: () {
                    Get.back();
                  }),
            ),
          ),
          Positioned(
            bottom: 10,
            child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                controller: _pageController,
                itemCount: resturants.length,
                itemBuilder: (BuildContext context, int index) {
                  return _resturantListe(index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
