import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:potres2020/data.dart';

class MapPage extends StatefulWidget {
  const MapPage(this.setId) : super();

  final int setId;
  @override
  State<MapPage> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
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
            future: getMarkersFromData(widget.setId),
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
        floatingActionButton: Container(
            padding: EdgeInsets.all(10.0),
            child: Row(children: [
              Container(
                  padding: EdgeInsets.all(20.0),
                  child: FloatingActionButton.extended(
                    heroTag: "first",
                    onPressed: _goToTheLake,
                    label: Text('Dodaj pomoć'),
                    icon: Icon(Icons.help),
                  )),
              Container(
                padding: EdgeInsets.all(20.0),
                child: FloatingActionButton.extended(
                  onPressed: _goToTheLake,
                  heroTag: "second",
                  label: Text('Dodaj potrebu'),
                  icon: Icon(Icons.access_alarm),
                ),
              )
            ])));
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    //controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
