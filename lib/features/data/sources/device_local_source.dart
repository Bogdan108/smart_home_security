// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:smart_home_security/features/domain/models/device_model.dart';

// abstract interface class DeviceLocalDataSource {
//   Future<List<DeviceModel>> getAllDevices();
//   Future<List<String>> addNewDevice(DeviceModel device);
// }

// // пока не готов сервер, буду делать в локальной бд
// // ignore: constant_identifier_names
// const CACHED_DEVICE_LIST = 'CACHED_DEVICE_LIST';

// class DeviceLocalDataSourceImpl implements DeviceLocalDataSource {
//   final SharedPreferences sharedPreferences;

//   DeviceLocalDataSourceImpl({required this.sharedPreferences});

//   @override
//   Future<List<String>> addNewDevice(DeviceModel device) {}

//   @override
//   Future<List<DeviceModel>> getAllDevices() {
//     final jsonDeviceList = sharedPreferences.getStringList(CACHED_DEVICE_LIST);
//     if (jsonDeviceList!.isNotEmpty) {
//       return Future.value(jsonDeviceList
//           .map((device) => DeviceModel.fromJson(json.decode(device)))
//           .toList());
//     }
//   }
// }
