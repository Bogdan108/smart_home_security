import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_home_security/features/device_feature/data/repository/device_repository_impl.dart';
import 'package:smart_home_security/features/device_feature/data/sources/device_network_data_provider.dart';
import 'package:smart_home_security/features/device_feature/domain/mappers/device_mapper.dart';
import 'package:smart_home_security/features/device_feature/domain/repositories/device_repository.dart';

final class DIContainer {
  DIContainer._();
  static DIContainer get instance => _instance ??= DIContainer._();
  static DIContainer? _instance;
  late final SharedPreferences sharedPref;
  late final Dio dio;
  late final DeviceMapper mapper;
  late final DeviceNetworkDataProvider deviceLocalDataSource;
  late final DeviceRepository deviceRepository;

  Future<void> initDeps() async {
    dio = Dio();
    sharedPref = await SharedPreferences.getInstance();
    mapper = DeviceMapper();
    deviceLocalDataSource = DeviceNetworkDataProviderImpl(
        sharedPreferences: sharedPref, deviceMapper: mapper);
    deviceRepository = DeviceRepositoryImpl(localSource: deviceLocalDataSource);
  }
}
