import 'package:equatable/equatable.dart';
import 'package:smart_home_security/features/device_feature/domain/enteties/device_entity.dart';

sealed class DeviceEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadDevices extends DeviceEvent {}

class AddDevices extends DeviceEvent {
  final DeviceEntity device;

  AddDevices({required this.device});
  @override
  List<Object> get props => [device];
}

class DeleteDevice extends DeviceEvent {
  final DeviceEntity device;

  DeleteDevice({required this.device});
  @override
  List<Object> get props => [device];
}
