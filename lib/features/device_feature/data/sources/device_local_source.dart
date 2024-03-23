import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_home_security/features/device_feature/data/dto/device_dto.dart';
import 'package:smart_home_security/features/device_feature/domain/enteties/device_entity.dart';
import 'package:smart_home_security/features/device_feature/domain/mappers/device_mapper.dart';

abstract interface class DeviceLocalDataSource {
  List<DeviceEntity> getAllDevices();
  Future<List<DeviceEntity>> addNewDevice(DeviceEntity device);
  Future<List<DeviceEntity>> deleteDevice(DeviceEntity device);
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
  Future<List<DeviceEntity>> addNewDevice(DeviceEntity device) async {
    var jsonDeviceList = _sharedPreferences.getStringList(GET_ALL);

    if (jsonDeviceList != null) {
      jsonDeviceList.add(
          json.encode(_deviceMapper.mapDeviceEntityToDto(device).toJson()));
      await _sharedPreferences.setStringList(GET_ALL, jsonDeviceList);
    } else {
      await _sharedPreferences.setStringList(GET_ALL,
          [json.encode(_deviceMapper.mapDeviceEntityToDto(device).toJson())]);
    }

    return Future.value(getAllDevices());
  }

  @override
  List<DeviceEntity> getAllDevices() {
    final jsonDeviceList = _sharedPreferences.getStringList(GET_ALL);
    if (jsonDeviceList != null) {
      return (jsonDeviceList
          .map((device) => _deviceMapper
              .mapDeviceDtoToEntity(DeviceDto.fromJson(json.decode(device))))
          .toList());
    } else {
      return [];
    }
  }

  @override
  Future<List<DeviceEntity>> deleteDevice(DeviceEntity device) async {
    List<String>? jsonDeviceList = _sharedPreferences.getStringList(GET_ALL);
    if (jsonDeviceList != null) {
      jsonDeviceList.removeWhere((element) =>
          element ==
          json.encode(_deviceMapper.mapDeviceEntityToDto(device).toJson()));
      await _sharedPreferences.setStringList(GET_ALL, jsonDeviceList);
    }
    return Future.value(getAllDevices());
  }
}
