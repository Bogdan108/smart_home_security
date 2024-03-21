import 'package:smart_home_security/features/domain/enteties/device_entity.dart';

abstract interface class DeviceRepository {
  List<DeviceEntity> getDevices();
  Future<List<DeviceEntity>> addDevice(DeviceEntity device);
  Future<List<DeviceEntity>> deleteDevice(DeviceEntity device);
}
