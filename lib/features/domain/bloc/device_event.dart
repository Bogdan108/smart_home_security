import 'package:equatable/equatable.dart';

sealed class DeviceEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadDevices extends DeviceEvent {}
