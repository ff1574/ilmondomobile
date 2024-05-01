import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Map extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300, // Fixed height for the map
      child: FlutterMap(
        mapController: MapController(),
        options: const MapOptions(
          initialCenter:
              LatLng(48.8566, 2.3522), // Paris coordinates as an example
          initialZoom: 13,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: const ['a', 'b', 'c'],
          ),
        ],
      ),
    );
  }
}
