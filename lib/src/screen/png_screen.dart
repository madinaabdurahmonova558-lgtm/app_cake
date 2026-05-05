import 'package:app_cake/src/screen/cart_screen.dart';
import 'package:app_cake/src/screen/favorite_screen.dart';
import 'package:flutter/material.dart';

class PngScreen extends StatefulWidget {
  const PngScreen({super.key});

  @override
  State<PngScreen> createState() => _PngScreenState();
}

class _PngScreenState extends State<PngScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      CartScreen(
        onTabChange: (i) {
          if (i == 1) setState(() => index = 1);
        },
      ),
      FavoriteScreen(
        onTabChange: (i) {
          if (i == 0) setState(() => index = 0);
        },
      ),
    ];

    return Scaffold(body: screens[index]);
  }
}