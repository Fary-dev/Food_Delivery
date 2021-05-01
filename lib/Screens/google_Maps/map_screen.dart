import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mjam/Widgets/Rating.dart';
import 'package:mjam/bloc/Location_Bloc/firstLocation.dart';
import 'package:mjam/models_and_data/Class/models_and_data.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Set<Marker> _list = {};
  Completer<GoogleMapController> _controller = Completer();
  PageController _pageController;

  void onCompleter(GoogleMapController controller) {
    setState(() {
      _controller.complete();
    });
  }

  void listPoins() {
    setState(() {
      for (var d in resturants) {
        Marker marker = Marker(
          markerId: MarkerId('${d.id}'),
          position: LatLng(d.lattut, d.longtut),
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
        onTap: () {},
        child: Stack(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                height: 200.0,
                width: 280.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        blurRadius: 10,
                        offset: Offset(0.0, 4.0))
                  ],
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Stack(
                    children: [
                      Positioned(
                          top: 15,
                          left: 10,
                          child: Text(
                            resturants[index].nameResturant,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      Positioned(
                          top: 35,
                          left: 10,
                          child: Text(
                            resturants[index].description,
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          )),
                      Positioned(
                          top: 70,
                          left: 10,
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: Colors.redAccent[400],
                                size: 20,
                              ),
                              Text(
                                resturants[index].address,
                                style: TextStyle(
                                    color: Colors.redAccent[400], fontSize: 12),
                              ),
                            ],
                          )),
                      Positioned(
                        top: 15,
                        right: 15,
                        child: Container(
                          height: 40,
                          width: 80,
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
                          bottom: 40,
                          right: 25,
                          child: Text(
                            'AbholZeit',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          )),
                      Positioned(
                          bottom: 40,
                          right: 100,
                          child: Text(
                            'Distanz',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          )),
                      Positioned(
                          bottom: 40,
                          left: 10,
                          child: Text(
                            '${resturants[index].ratingResturant} Bewertungen',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          )),
                      Positioned(
                          bottom: 20,
                          right: 20,
                          child: Text(
                            'ca.${resturants[index].deliveryDuration} min',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          )),
                      Positioned(
                          bottom: 20,
                          right: 100,
                          child: Text(
                            '${resturants[index].distance} km',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          )),
                      Positioned(
                          bottom: 20,
                          left: 10,
                          child: Container(
                            height: 20,
                            width: 85,
                            child: rating(20.0, 80.0, 16.0),
                          ))
                    ],
                  ),
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
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    DefultLocation userLocation = Provider.of<DefultLocation>(context);
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: GoogleMap(
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              markers: _list,
              onMapCreated: onCompleter,
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
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            offset: Offset.zero)
                      ]),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          icon: Icon(
                            CupertinoIcons.back,
                            color: Colors.black,
                          ),
                          onPressed: () => Navigator.pop(context)),
                      Spacer(),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Abholen ',
                              style: TextStyle(color: Colors.black)),
                          TextSpan(
                            text: userLocation.location.toString(),
                            style: TextStyle(color: Colors.redAccent[400]),
                          ),
                        ]),
                      ),
                      Spacer(),
                      IconButton(
                          icon: Icon(
                            CupertinoIcons.location_solid,
                            color: Colors.redAccent[400],
                          ),
                          onPressed: () => Navigator.pop(context)),
                    ],
                  ),
                ),
              )),
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
              )),
        ],
      ),
    );
  }
}
