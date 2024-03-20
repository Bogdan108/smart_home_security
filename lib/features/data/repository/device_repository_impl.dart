import 'package:smart_home_security/features/data/sources/device_local_source.dart';
import 'package:smart_home_security/features/domain/enteties/device_entity.dart';
import 'package:smart_home_security/features/domain/repositories/device_repository.dart';

class DeviceRepositoryImpl implements DeviceRepository {
  final DeviceLocalDataSource _localSource;

  DeviceRepositoryImpl({required DeviceLocalDataSource localSource})
      : _localSource = localSource;

  @override
  List<DeviceEntity> getDevices() {
    return _localSource.getAllDevices();
  }

  @override
  Future<List<DeviceEntity>> addDevice(DeviceEntity device) {
    return Future.value(_localSource.addNewDevice(device));
  }
}
