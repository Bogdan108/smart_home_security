import 'package:smart_home_security/features/data/sources/device_local_source.dart';
import 'package:smart_home_security/features/domain/enteties/device_entity.dart';
import 'package:smart_home_security/features/domain/repositories/device_repository.dart';

class DeviceRepositoryImpl implements DeviceRepository {
  final DeviceLocalDataSourceImpl _localSource;

  DeviceRepositoryImpl({required DeviceLocalDataSourceImpl localSource})
      : _localSource = localSource;

  @override
  Future<List<DeviceEntity>> getDevices() {
    return _localSource.getAllDevices();
  }

  @override
  Future<void> addDevice(DeviceEntity device) {
    return _localSource.addNewDevice(device);
  }
}
