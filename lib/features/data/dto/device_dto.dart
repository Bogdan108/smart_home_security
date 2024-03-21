import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'device_dto.g.dart';

@JsonSerializable()
class DeviceDto extends Equatable {
  final int id;
  final String name;
  final int roomId;
  final String type;
  final bool state;
  final String ip;

  const DeviceDto({
    required this.id,
    required this.name,
    required this.roomId,
    required this.type,
    required this.state,
    required this.ip,
  });

  factory DeviceDto.fromJson(Map<String, dynamic> json) =>
      _$DeviceDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceDtoToJson(this);

  @override
  List<Object?> get props => [name, ip, id, roomId, type, state];
}
