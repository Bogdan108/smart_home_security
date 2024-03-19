import 'package:smart_home_security/core/utils/type_enum.dart';
import 'package:smart_home_security/features/data/dto/device_dto.dart';
import 'package:smart_home_security/features/domain/enteties/device_entity.dart';

class deviceMapper {
  DeviceEntity mapDeviceDtoToEntity(DeviceDto dto) => DeviceEntity(
      name: dto.name,
      type: stringToType(dto.type),
      ip: dto.ip,
      state: dto.state,
      roomId: dto.roomId,
      id: dto.id);

  DeviceDto mapDeviceEntityToDto(DeviceEntity entity) => DeviceDto(
      id: entity.id,
      name: entity.name,
      roomId: entity.roomId,
      type: typeToString(entity.type),
      state: entity.state,
      ip: entity.ip);

  DeviceType stringToType(String type) {
    switch (type) {
      case 'Camera':
        return DeviceType.camera;
      case 'Led':
        return DeviceType.led;
      case 'Clock':
        return DeviceType.clock;
    }
    return DeviceType.clock;
  }

  String typeToString(DeviceType type) {
    switch (type) {
      case DeviceType.camera:
        return 'Camera';
      case DeviceType.led:
        return 'Led';
      case DeviceType.clock:
        return 'Clock';
    }
  }
}
