import 'dart:io';

import 'package:fav_place/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserPlaceNotifier extends StateNotifier<List<Place>> {
  UserPlaceNotifier() : super([]);

  void addPlace(String title, File img) {
    final newPlace = Place(title: title, image: img);
    state = [newPlace, ...state];
  }
}

final placeProvider = StateNotifierProvider<UserPlaceNotifier, List<Place>>(
  (ref) => UserPlaceNotifier(),
);
