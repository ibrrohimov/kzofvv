import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:seysmoprognoz/features/earthquakes/data/models/quake_model.dart';

class MapSample extends StatefulWidget {
  final QuakeModel quake;

  const MapSample({Key? key, required this.quake}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  late LatLng latlang;
  late CameraPosition _kGooglePlex;
  final Set<Marker> markers = new Set();
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kLake = CameraPosition(
    bearing: 0.0,
    target: LatLng(41.297318870874555, 69.25052584585127),
    tilt: 59.440717697143555,
    zoom: 5.0,
  );

  @override
  void initState() {
    latlang = LatLng(
      widget.quake.latitude,
      widget.quake.longitude,
    );
    markers.add(
      Marker(
        markerId: MarkerId(latlang.toString()),
        position: latlang,
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ),
    );
    _kGooglePlex = CameraPosition(
      target: latlang,
      zoom: 5.0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      markers: markers, //markers to show on map
      mapType: MapType.normal,
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
