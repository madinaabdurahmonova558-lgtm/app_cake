
import 'package:app_cake/src/screen/detail_screen.dart';
import 'package:app_cake/src/widgets/items.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: DetailScreen(item: items[0], index: 0),
        );
      },
    );
  }
}
