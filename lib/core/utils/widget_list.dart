import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:smart_home_security/features/domain/enteties/device_entity.dart';

class DeviceList extends ChangeNotifier {
  final List<DeviceEntity> _devices = [];

  UnmodifiableListView<DeviceEntity> get devices =>
      UnmodifiableListView(_devices);

  void add(DeviceEntity device) {
    _devices.add(device);

    notifyListeners();
  }

  void removeAll() {
    _devices.clear();

    notifyListeners();
  }
}
