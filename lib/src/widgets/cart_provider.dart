import 'package:flutter/material.dart';

class Item {
  final String name;
  final String image;
  final double price;

  Item({required this.name, required this.image, required this.price});
}

class CartProvider extends ChangeNotifier {
  final List<Item> _favorites = [];

  List<Item> get favorites => _favorites;

  bool isFavorite(Item item) {
    return _favorites.any((e) => e.name == item.name);
  }

  void toggleFavorite(Item item) {
    if (isFavorite(item)) {
      _favorites.removeWhere((e) => e.name == item.name);
    } else {
      _favorites.add(item);
    }
    notifyListeners();
  }
}