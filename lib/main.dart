import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:app_cake/src/screen/detail_screen.dart';
import 'package:app_cake/src/widgets/cart_provider.dart';
import 'package:app_cake/src/widgets/items.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: DetailScreen(
            item: items[0],
            index: 0,
          ),
        );
      },
    );
  }
}