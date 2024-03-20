import 'package:smart_home_security/features/domain/enteties/device_entity.dart';

abstract interface class DeviceRepository {
  Future<List<DeviceEntity>> getDevices();
  Future<void> addDevice(DeviceEntity device);
}
