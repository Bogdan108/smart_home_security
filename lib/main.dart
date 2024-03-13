import 'package:flutter/material.dart';
import 'package:smart_home_security/core/custom_theme.dart';
import 'package:smart_home_security/widget/pages/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        home: const HomePage());
  }
}