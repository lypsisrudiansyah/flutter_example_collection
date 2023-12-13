import 'package:flutter/material.dart';
import 'package:flutter_lypsisbook/core.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../view/google_maps_example_view.dart';

class GoogleMapsExampleController extends State<GoogleMapsExampleView> {
  static late GoogleMapsExampleController instance;
  late GoogleMapsExampleView view;

  GoogleMapController? mapsController;

  final LatLng initialPosition = const LatLng(-0.026330, 109.342506);

  final List<Marker> markers = [];

  final Map<String, dynamic> mapTheme = {
    "elementType": "geometry",
    "stylers": [
      {"color": "#242f3e"}
    ]
  };

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  handleTap(LatLng tappedPoint) {
    setState(() {
      markers.add(
        Marker(
          markerId: MarkerId(tappedPoint.toString()),
          position: tappedPoint,
        ),
      );
    });
  }

  getCurrentLocation() async {
    Location location = Location();
    LocationData currentLocation = await location.getLocation();
    // Move camera position to current location
    mapsController!.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(currentLocation.latitude!, currentLocation.longitude!),
          zoom: 15.0,
        ),
      ),
    );
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
