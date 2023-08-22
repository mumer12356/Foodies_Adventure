import 'package:flutter/material.dart';
import '../constructor/Home.dart';

class FavoriteProvider with ChangeNotifier {
  List<Home> favoriteItems = [];


  void addToFavorites(Home home) {
    if (!isFavorite(home)) {
      favoriteItems.add(home);
      notifyListeners();
    } // Notify listeners about the change
  }

  void removeFromFavorites(Home home) {
    if (isFavorite(home)) {
      favoriteItems.remove(home);
      notifyListeners();
    } // Notify listeners about the change
  }

  bool isFavorite(Home home) {
    return favoriteItems.contains(home);

  }
}

