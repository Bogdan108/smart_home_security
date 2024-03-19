import 'package:json_annotation/json_annotation.dart';
part 'device_dto.g.dart';

@JsonSerializable()
class DeviceDTO {
  final String id;
  final String name;
  final String roomId;
  final String type;
  final bool state;

  const DeviceDTO(
      {required this.id,
      required this.name,
      required this.roomId,
      required this.type,
      required this.state});

  factory DeviceDTO.fromJson(Map<String, dynamic> json) =>
      _$DeviceDTOFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceDTOToJson(this);
}
