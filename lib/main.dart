import 'package:app_cake/src/screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:app_cake/src/screen/welcom_screen.dart';
import 'package:app_cake/src/widgets/cart_provider.dart';

void main() {
  runApp(
    MultiProvider( // ✅ вместо двух create
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
      ],
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
          home: WelcomScreen(), // 👉 оставил как у тебя первый
        );
      },
    );
  }
}