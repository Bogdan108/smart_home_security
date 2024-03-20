import 'package:equatable/equatable.dart';
import 'package:smart_home_security/features/domain/enteties/device_entity.dart';

sealed class DeviceState extends Equatable {
  @override
  List<Object> get props => [];
}

class DevicesEmpty extends DeviceState {}

class DevicesLoading extends DeviceState {}

class DevicesLoaded extends DeviceState {
  final List<DeviceEntity> devices;

  DevicesLoaded({required this.devices});

  @override
  List<Object> get props => [devices];
}

class DevicesLoadingError extends DeviceState {
  final String exception;

  DevicesLoadingError({required this.exception});
  @override
  List<Object> get props => [exception];
}
