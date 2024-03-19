// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceDto _$DeviceDtoFromJson(Map<String, dynamic> json) => DeviceDto(
      id: json['id'] as int,
      name: json['name'] as String,
      roomId: json['roomId'] as int,
      type: json['type'] as String,
      state: json['state'] as bool,
      ip: json['ip'] as String,
    );

Map<String, dynamic> _$DeviceDtoToJson(DeviceDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'roomId': instance.roomId,
      'type': instance.type,
      'state': instance.state,
      'ip': instance.ip,
    };
