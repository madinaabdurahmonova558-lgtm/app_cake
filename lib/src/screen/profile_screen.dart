import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  final nameController = TextEditingController(text: "Jacky Shatty");
  final emailController =
      TextEditingController(text: "jachyshatty@gmail.com");
  final passwordController =
      TextEditingController(text: "12345678");
  final dobController =
      TextEditingController(text: "23/05/1995");

  String selectedCountry = "Germany";

  final List<String> countries = [
    "Germany",
    "USA",
    "Uzbekistan",
    "Kyrgyzstan",
    "Russia"
  ];

  /// 🌍 COUNTRY
  void setCountry(String value) {
    selectedCountry = value;
    notifyListeners();
  }

  /// 📅 DATE
  void setDate(DateTime date) {
    dobController.text =
        "${date.day}/${date.month}/${date.year}";
    notifyListeners();
  }

  /// 🔥 CLEAN MEMORY
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    dobController.dispose();
    super.dispose();
  }
}