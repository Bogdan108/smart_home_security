import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_home_security/features/data/repository/device_repository_impl.dart';
import 'package:smart_home_security/features/data/sources/device_local_source.dart';
import 'package:smart_home_security/features/domain/mappers/device_mapper.dart';
import 'package:smart_home_security/features/domain/repositories/device_repository.dart';

final class DIContainer {
  DIContainer._();
  static DIContainer get instance => _instance ??= DIContainer._();
  static DIContainer? _instance;
  late final SharedPreferences sharedPref;
  late final Dio dio;
  late final DeviceMapper mapper;
  late final DeviceLocalDataSource deviceLocalDataSource;
  late final DeviceRepository deviceRepository;

  Future<void> initDeps() async {
    dio = Dio();
    sharedPref = await SharedPreferences.getInstance();
    mapper = DeviceMapper();
    deviceLocalDataSource = DeviceLocalDataSourceImpl(
        sharedPreferences: sharedPref, deviceMapper: mapper);
    deviceRepository = DeviceRepositoryImpl(localSource: deviceLocalDataSource);
  }
}
