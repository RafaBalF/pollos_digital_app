import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pollos_digital/app/models/dtos/state_and_cities.dto.dart';

class LocationService {
  StatesAndCitiesModel statesAndCitiesModel = StatesAndCitiesModel();

  Future<Position> getPosition({
    LocationAccuracy locationAccuracy = LocationAccuracy.high,
  }) async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: locationAccuracy);
  }

  Future<Placemark?> getPlacemark(double latitude, double longitude) async {
    List<Placemark>? places = await getPlaces(latitude, longitude);

    if (places != null && places.isNotEmpty) {
      return places[0];
    }

    return null;
  }

  Future<List<Placemark>?> getPlaces(double latitude, double longitude) async {
    List<Placemark>? places;

    await placemarkFromCoordinates(latitude, longitude)
        .then((List<Placemark> placemarks) {
      places = placemarks;
    }).catchError((e) {});

    return places;
  }

  String? getCountry(String? country) {
    if (country != null && country == 'Brazil') {
      return 'BR';
    }
    return country;
  }

  Future<String?> findStateAcronym(String? state) async {
    if (statesAndCitiesModel.stateAndCities == null) {
      await getStateAndCities();
    }

    String? s;
    StateAndCities? stateAndCities;

    for (var s in statesAndCitiesModel.stateAndCities!) {
      if (s.nome == state) {
        stateAndCities = s;
      }
    }

    if (stateAndCities != null) {
      s = stateAndCities.sigla;
    }

    return s;
  }

  Future getStateAndCities() async {
    final String response =
        await rootBundle.loadString('assets/json/states_cities.json');
    var jsonResult = await json.decode(response);
    statesAndCitiesModel = StatesAndCitiesModel.fromJson(jsonResult);
  }
}
