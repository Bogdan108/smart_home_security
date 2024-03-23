import 'package:smart_home_security/features/device_feature/domain/enteties/device_entity.dart';

abstract interface class DeviceRepository {
  List<DeviceEntity> getDevices();
  Future<List<DeviceEntity>> addDevice(DeviceEntity device);
  Future<List<DeviceEntity>> deleteDevice(DeviceEntity device);
}
