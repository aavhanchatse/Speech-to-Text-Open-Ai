// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:location/location.dart' as loc;

// class LocationUtils {
//   static Future<loc.LocationData?> getCurrentLocation() async {
//     loc.Location location = new loc.Location();

//     bool _serviceEnabled;
//     loc.PermissionStatus _permissionGranted;
//     loc.LocationData _locationData;

//     _serviceEnabled = await location.serviceEnabled();
//     if (!_serviceEnabled) {
//       _serviceEnabled = await location.requestService();
//       if (!_serviceEnabled) {
//         return null;
//       }
//     }

//     _permissionGranted = await location.hasPermission();
//     if (_permissionGranted == loc.PermissionStatus.denied) {
//       _permissionGranted = await location.requestPermission();
//       if (_permissionGranted != loc.PermissionStatus.granted) {
//         return null;
//       }
//     }

//     _locationData = await location.getLocation();
//     return _locationData;
//   }

//   static Future<String?> getLocationFromCoordinates(
//       double latitude, double longitude) async {
//     // List<Placemark> placemarks =
//     //     await placemarkFromCoordinates(18.592347, 73.785125);
//     List<Placemark> placemarks =
//         await placemarkFromCoordinates(latitude, longitude);

//     debugPrint(placemarks.first.toString());

//     if (placemarks.isNotEmpty) {
//       return placemarks.first.locality;
//     }
//     return "";
//   }
// }
