import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/screen/png_screen.dart';
import 'src/widgets/cart_provider.dart';

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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PngScreen(),
    );
  }
}