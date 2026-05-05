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

  void toggleFavorite(Item item) {
    if (_favorites.contains(item)) {
      _favorites.remove(item);
    } else {
      _favorites.add(item);
    }
    notifyListeners();
  }

  bool isFavorite(Item item) => _favorites.contains(item);
}