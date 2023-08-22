import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:sipbara/helper/api_key.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Utils {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackBar(String? text) {
    if (text == null) return;

    final snackBar = SnackBar(
      content: Text(text),
      backgroundColor: Colors.red,
    );

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}

class MapUtils {
  MapUtils._();
  static Future<void> openMap(double latitude, double longitude) async {
    print('lat : $latitude, long : $longitude');
    MapsLauncher.launchCoordinates(latitude, longitude);
  }
}

Future<Map<String, dynamic>?> getPlaceInfo(
    double latitude, double longitude) async {
  final response = await http.get(Uri.parse(
    'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$google_maps_api_key',
  ));

  print(Uri.parse(
      'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$google_maps_api_key'));
  print(response.statusCode);
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    if (data['status'] == 'OK') {
      final results = data['results'] as List<dynamic>;
      if (results.isNotEmpty) {
        final addressComponents =
            results.first['address_components'] as List<dynamic>;
        String desa = '';
        String kecamatan = '';

        for (final component in addressComponents) {
          final types = component['types'] as List<dynamic>;
          if (types.contains('administrative_area_level_4')) {
            desa = component['long_name'];
          } else if (types.contains('administrative_area_level_3')) {
            kecamatan = component['short_name'];
          }

          if (desa != '' && kecamatan != '') {
            break;
          }
        }

        return {'desa': desa, 'kecamatan': kecamatan};
      }
    }
  }

  return null;
}
