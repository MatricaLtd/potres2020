import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Potres2020Data {
  String type;
  List<Features> features;
  int total;

  Potres2020Data({this.type, this.features, this.total});

  Potres2020Data.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['features'] != null) {
      features = new List<Features>();
      json['features'].forEach((v) {
        features.add(new Features.fromJson(v));
      });
    }
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.features != null) {
      data['features'] = this.features.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    return data;
  }
}

class Features {
  String type;
  Geometry geometry;
  Properties properties;

  Features({this.type, this.geometry, this.properties});

  Features.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    geometry = json['geometry'] != null
        ? new Geometry.fromJson(json['geometry'])
        : null;
    properties = json['properties'] != null
        ? new Properties.fromJson(json['properties'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.geometry != null) {
      data['geometry'] = this.geometry.toJson();
    }
    if (this.properties != null) {
      data['properties'] = this.properties.toJson();
    }
    return data;
  }
}

class Geometry {
  String type;
  List<Geometries> geometries;

  Geometry({this.type, this.geometries});

  Geometry.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['geometries'] != null) {
      geometries = new List<Geometries>();
      json['geometries'].forEach((v) {
        geometries.add(new Geometries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.geometries != null) {
      data['geometries'] = this.geometries.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Geometries {
  String type;
  List<double> coordinates;

  Geometries({this.type, this.coordinates});

  Geometries.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}

class Properties {
  String title;
  String description;
  String markerColor;
  int id;
  String url;

  Properties(
      {this.title, this.description, this.markerColor, this.id, this.url});

  Properties.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    markerColor = json['marker-color'];
    id = json['id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['marker-color'] = this.markerColor;
    data['id'] = this.id;
    data['url'] = this.url;
    return data;
  }
}

Future<List<Features>> getData(int setId, String search) async {
  var _dio = Dio();
  //_dio.options.headers = {"Authorization": "Bearer $token"};

  Response response = await _dio.get(
      'https://potres2020.openit.hr/api/v3/posts/geojson',
      options: Options(responseType: ResponseType.json));
  print(Potres2020Data.fromJson(response.data).features);
  return Potres2020Data.fromJson(response.data).features;
}

Future<Set<Marker>> getMarkersFromData(int setId) async {
  Set<Marker> markers = Set<Marker>();

  List<Features> data = await getData(setId, "");
  data.forEach((element) {
    BitmapDescriptor bd;

    if (element.properties.markerColor == "#5BAA00") {
      bd = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen);
    } else if (element.properties.markerColor == "#A51A1A") {
      bd = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);
    } else {
      bd = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue);
    }
    print(element.properties.markerColor);
    markers.add(Marker(
      markerId: MarkerId(element.properties.id.toString()),
      position: LatLng(element.geometry.geometries.first.coordinates[1],
          element.geometry.geometries.first.coordinates[0]),
      infoWindow: InfoWindow(
          title:
              element.properties.title + "\n" + element.properties.description),
      icon: bd,
    ));
  });

  return markers;
}
