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
  final SharedPreferences _sharedPreferences;
  final DeviceMapper _deviceMapper;
  DeviceLocalDataSourceImpl(
      {required SharedPreferences sharedPreferences,
      required DeviceMapper deviceMapper})
      : _sharedPreferences = sharedPreferences,
        _deviceMapper = deviceMapper;

  @override
  Future<void> addNewDevice(DeviceEntity device) async {
    final jsonDeviceList = _sharedPreferences.getStringList(GET_ALL);
    if (jsonDeviceList != null) {
      jsonDeviceList.add(
          json.encode(_deviceMapper.mapDeviceEntityToDto(device).toJson()));
      await _sharedPreferences.setStringList(GET_ALL, jsonDeviceList);
    }
  }

  @override
  Future<List<DeviceEntity>> getAllDevices() {
    final jsonDeviceList = _sharedPreferences.getStringList(GET_ALL);
    if (jsonDeviceList != null) {
      return Future.value(jsonDeviceList
          .map((device) => _deviceMapper
              .mapDeviceDtoToEntity(DeviceDto.fromJson(json.decode(device))))
          .toList());
    } else {
      return Future.value([]);
    }
  }
}
