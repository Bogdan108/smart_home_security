import 'package:flutter/material.dart';
import 'package:smart_home_security/core/di/di_container.dart';
import 'package:smart_home_security/core/theme/custom_theme.dart';
import 'package:smart_home_security/features/domain/bloc/devices_bloc.dart';
import 'package:smart_home_security/features/widget/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DIContainer.instance.initDeps();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DeviceBloc(repo: DIContainer.instance.deviceRepository),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          home: const HomePage()),
    );
  }
}
