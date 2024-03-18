import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_security/core/theme/custom_theme.dart';
import 'package:smart_home_security/core/utils/widget_list.dart';
import 'package:smart_home_security/features/widget/pages/home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DeviceList(),
      child: const MainApp(),
    ),
  );
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
