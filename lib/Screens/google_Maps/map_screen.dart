import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mjam/models_and_data/Class/models_and_data.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Set<Marker> _list = {};
  Completer<GoogleMapController> _controller = Completer();

  void onCompleter(GoogleMapController controller) {
    _controller.complete();
  }

  void listPoins() {
    for (var d in resturants) {
      Marker marker = Marker(
        markerId: MarkerId('${d.id}'),
        position: LatLng(d.lattut, d.longtut),
      );
      _list.add(marker);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listPoins();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Adress',
          style: TextStyle(color: Colors.redAccent[400]),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            markers: _list,
            onMapCreated: onCompleter,
            initialCameraPosition: CameraPosition(
              target: LatLng(48.666506, 15.655791),
              zoom: 14,
            ),
          ),
          // Positioned(
          //   top: 20,
          //   left: 20,
          //   child: FloatingActionButton(
          //       backgroundColor: Colors.black,
          //       child: Icon(CupertinoIcons.back),
          //       onPressed: () => Navigator.pop(context)),
          // ),
          // Positioned(
          //   left: 20,
          //   bottom: 20,
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     itemCount: 5,
          //     itemBuilder: (context, index) {
          //       return Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 30),
          //         child: Container(
          //           height: 50,
          //           width: MediaQuery.of(context).size.width / 1.5,
          //           color: Colors.black.withOpacity(0.10),
          //         ),
          //       );
          //     },
          //   ),
          // )
        ],
      ),
    );
  }
}
