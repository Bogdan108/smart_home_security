import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:smart_home_security/features/domain/entities/device_model.dart';

class DeviceList extends ChangeNotifier {
  final List<DeviceModel> _devices = [];

  UnmodifiableListView<DeviceModel> get devices =>
      UnmodifiableListView(_devices);

  void add(DeviceModel device) {
    _devices.add(device);

    notifyListeners();
  }

  void removeAll() {
    _devices.clear();

    notifyListeners();
  }
}
