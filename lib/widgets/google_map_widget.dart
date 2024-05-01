import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class GoogleMapWidget extends StatefulWidget {
  const GoogleMapWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GoogleMapWidgetState createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kDefault = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962), // Default location
    zoom: 14.0,
  );

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _kDefault,
      onMapCreated: (GoogleMapController controller) =>
          _controller.complete(controller),
    );
  }

  // ignore: unused_element
  Future<void> _moveCamera(CameraPosition newPosition) async {
    final controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(newPosition));
  }
}
