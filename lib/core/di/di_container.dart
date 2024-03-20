import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class DIContainer {
  DIContainer._();
  static DIContainer get instance => _instance ??= DIContainer._();
  static DIContainer? _instance;
  late final SharedPreferences sharedPref;
  late final Dio dio;

  Future<void> initDeps() async {
    dio = Dio();
    sharedPref = await SharedPreferences.getInstance();
  }
}
