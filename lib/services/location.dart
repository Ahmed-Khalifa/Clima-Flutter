import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

class Location {
  double longitude, latitude;

  Location({this.longitude, this.latitude});

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      longitude = position.longitude;
      latitude = position.latitude;
    } catch (e) {
      print('ERROR: $e');
    }
  }
}
