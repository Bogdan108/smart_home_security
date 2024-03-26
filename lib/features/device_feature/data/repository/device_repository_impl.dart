import 'package:smart_home_security/features/device_feature/data/sources/device_network_data_provider.dart';
import 'package:smart_home_security/features/device_feature/domain/enteties/device_entity.dart';
import 'package:smart_home_security/features/device_feature/domain/repositories/device_repository.dart';

class DeviceRepositoryImpl implements DeviceRepository {
  final DeviceNetworkDataProvider _localSource;

  DeviceRepositoryImpl({required DeviceNetworkDataProvider localSource})
      : _localSource = localSource;

  @override
  List<DeviceEntity> getDevices() {
    return _localSource.getAllDevices();
  }

  @override
  Future<List<DeviceEntity>> addDevice(DeviceEntity device) {
    return Future.value(_localSource.addNewDevice(device));
  }

  @override
  Future<List<DeviceEntity>> deleteDevice(DeviceEntity device) {
    return Future.value(_localSource.deleteDevice(device));
  }
}
