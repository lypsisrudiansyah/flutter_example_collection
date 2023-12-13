import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_lypsisbook/core.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../controller/google_maps_example_controller.dart';

class GoogleMapsExampleView extends StatefulWidget {
  const GoogleMapsExampleView({Key? key}) : super(key: key);

  Widget build(context, GoogleMapsExampleController controller) {
    // Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rudi Belajar Google Maps Lagi'),
      ),
      body: GoogleMap(
        onMapCreated: (GoogleMapController theMapController) {
          controller.mapsController = theMapController;
          List<dynamic> mapStyle = [
            {
              "featureType": "all",
              "elementType": "geometry.fill",
              "stylers": [
                {"color": "#ebe3cd"}
              ],
            },
            {
              "featureType": "administrative",
              "elementType": "geometry.stroke",
              "stylers": [
                {"color": "#c9b2a6"},
              ],
            },
          ];

          var mapThemeString = jsonEncode(mapStyle);
          controller.mapsController!.setMapStyle(mapThemeString);
        },
        initialCameraPosition: CameraPosition(
          target: controller.initialPosition,
          zoom: 15.0,
        ),
        mapType: MapType.normal,
        markers: Set.from(controller.markers),
        onTap: controller.handleTap,
        padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.7),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.getCurrentLocation,
        child: const Icon(Icons.location_searching),
      ),
    );
  }

  @override
  State<GoogleMapsExampleView> createState() => GoogleMapsExampleController();
}
