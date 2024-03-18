import 'package:smart_home_security/core/utils/type_enum.dart';

class DeviceModel {
  final String name;
  final String ip;
  final DeviceType type;
  const DeviceModel({required this.name, required this.type, required this.ip});
}
