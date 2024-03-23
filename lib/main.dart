import 'package:flutter/material.dart';
import 'package:smart_home_security/core/di/di_container.dart';
import 'package:smart_home_security/core/theme/custom_theme.dart';
import 'package:smart_home_security/features/auth_feature/domain/bloc/auth_bloc.dart';
import 'package:smart_home_security/features/auth_feature/widget/pages/login_page.dart';
import 'package:smart_home_security/features/device_feature/domain/bloc/device_bloc/devices_bloc.dart';
import 'package:smart_home_security/features/device_feature/widget/pages/home_page.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<DeviceBloc>(
          create: (BuildContext context) =>
              DeviceBloc(repo: DIContainer.instance.deviceRepository),
        ),
        BlocProvider<AuthBloc>(
          create: (BuildContext context) => AuthBloc(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          home: const LoginPage()),
    );
  }
}
