import 'package:smart_home_security/core/utils/type_enum.dart';

class DeviceEntity {
  final String name;
  final String ip;
  final int id;
  final int roomId;
  final DeviceType type;
  final bool state;

  const DeviceEntity(
      {required this.name,
      required this.type,
      required this.ip,
      required this.state,
      required this.roomId,
      required this.id});
}
