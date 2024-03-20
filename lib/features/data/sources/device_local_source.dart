import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_home_security/features/data/dto/device_dto.dart';
import 'package:smart_home_security/features/domain/enteties/device_entity.dart';
import 'package:smart_home_security/features/domain/mappers/device_mapper.dart';

abstract interface class DeviceLocalDataSource {
  Future<List<DeviceEntity>> getAllDevices();
  Future<void> addNewDevice(DeviceEntity device);
}

// пока не готов сервер, буду делать в локальной бд
// ignore: constant_identifier_names
const GET_ALL = 'get_all';

class DeviceLocalDataSourceImpl implements DeviceLocalDataSource {
  final SharedPreferences sharedPreferences;
  final DeviceMapper deviceMapper;
  DeviceLocalDataSourceImpl(
      {required this.sharedPreferences, required this.deviceMapper});

  @override
  Future<void> addNewDevice(DeviceEntity device) async {
    final jsonDeviceList = sharedPreferences.getStringList(GET_ALL);
    if (jsonDeviceList != null) {
      jsonDeviceList
          .add(json.encode(deviceMapper.mapDeviceEntityToDto(device).toJson()));
      await sharedPreferences.setStringList(GET_ALL, jsonDeviceList);
    }
  }

  @override
  Future<List<DeviceEntity>> getAllDevices() {
    try {
      final jsonDeviceList = sharedPreferences.getStringList(GET_ALL);
      if (jsonDeviceList != null) {
        return Future.value(jsonDeviceList
            .map((device) => deviceMapper
                .mapDeviceDtoToEntity(DeviceDto.fromJson(json.decode(device))))
            .toList());
      } else {
        return Future.value([]);
      }
    } catch (e) {
      rethrow;
    }
  }
}
