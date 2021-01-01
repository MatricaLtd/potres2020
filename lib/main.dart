import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:potres2020/data.dart';
import 'package:sticky_infinite_list/sticky_infinite_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      home: MapSample(),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(45.44000750619874, 16.28022766322829),
    zoom: 8,
  );

  Set<Marker> markers = Set();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: FutureBuilder<Set<Marker>>(
          future: getMarkersFromData(),
          builder: (context, snapshot) => GoogleMap(
                buildingsEnabled: true,
                mapType: MapType.hybrid,
                markers: snapshot.data,
                initialCameraPosition: _kGooglePlex,
                myLocationEnabled: true,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              )),
      floatingActionButton: Row(children: [ FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('Dodaj pomoć'),
        icon: Icon(Icons.help),
      ),
      FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('Dodaj potrebu'),
        icon: Icon(Icons.access_alarm),
      ),
    ]));
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    //controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
