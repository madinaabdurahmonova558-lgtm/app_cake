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
    return Scaffold(
      body: index == 0
          ? FavoriteScreen(
              onTabChange: (i) {
                setState(() => index = i);
              },
            )
          : CartScreen(
              onTabChange: (i) {
                setState(() => index = i);
              },
            ),
    );
  }
}