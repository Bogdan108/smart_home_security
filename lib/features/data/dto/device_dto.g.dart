// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceDTO _$DeviceDTOFromJson(Map<String, dynamic> json) => DeviceDTO(
      id: json['id'] as String,
      name: json['name'] as String,
      roomId: json['roomId'] as String,
      type: json['type'] as String,
      state: json['state'] as bool,
    );

Map<String, dynamic> _$DeviceDTOToJson(DeviceDTO instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'roomId': instance.roomId,
      'type': instance.type,
      'state': instance.state,
    };
