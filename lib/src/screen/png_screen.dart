import 'package:app_cake/src/screen/cart_screen.dart';
import 'package:app_cake/src/screen/favorite_screen.dart';
import 'package:flutter/material.dart';

class PngScreen extends StatefulWidget {
  final int initialIndex;

  const PngScreen({super.key, this.initialIndex = 0});

  @override
  State<PngScreen> createState() => _PngScreenState();
}

class _PngScreenState extends State<PngScreen> {
  late int index;

  @override
  void initState() {
    super.initState();
    index = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: index == 0
          ? FavoriteScreen(
              key: ValueKey(index),
              onTabChange: (i) {
                setState(() => index = i);
              },
            )
          : CartScreen(
              key: ValueKey(index),
              onTabChange: (i) {
                setState(() => index = i);
              },
            ),
    );
  }
}