
import 'package:app_cake/src/screen/account_screen.dart';
import 'package:app_cake/src/screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_cake/src/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:app_cake/src/screen/welcom_screen.dart';
import 'package:app_cake/src/widgets/cart_provider.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(
    ChangeNotifierProvider(

      create: (_) => CartProvider(),
      child:  MyApp(),

      create: (_) => ProfileProvider(),
      child: const MyApp(),

    ),
  );
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: WelcomScreen(),

        return const MaterialApp(
          debugShowCheckedModeBanner: false,

          home: AccountScreen(), // 🔥 endi topadi

          home: HomePage(),


        );
      },
    );
  }
}
