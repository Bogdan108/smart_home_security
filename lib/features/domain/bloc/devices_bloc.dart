import 'package:smart_home_security/features/domain/bloc/device_event.dart';
import 'package:smart_home_security/features/domain/bloc/device_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home_security/features/domain/repositories/device_repository.dart';

class DeviceBloc extends Bloc<DeviceEvent, DeviceState> {
  final DeviceRepository _deviceRepository;
  DeviceBloc({required DeviceRepository repo})
      : _deviceRepository = repo,
        super(DevicesEmpty()) {
    on<DeviceEvent>((event, emit) => switch (event) {
          LoadDevices() => _load(emit),
          AddDevices() => _add(event, emit),
        });
  }

  Future<void> _load(Emitter<DeviceState> emit) async {
    emit(DevicesLoading());
    try {
      final devicesList = _deviceRepository.getDevices();
      emit(DevicesLoaded(devices: devicesList));
    } catch (e) {
      emit(DevicesLoadingError(exception: 'Error of loading News $e'));
      rethrow;
    }
  }

  Future<void> _add(
    AddDevices event,
    Emitter<DeviceState> emit,
  ) async {
    emit(DevicesLoading());
    try {
      final devicesList = await _deviceRepository.addDevice(event.device);
      emit(DevicesAdded(devices: devicesList));
    } catch (e) {
      emit(DevicesLoadingError(exception: 'Error of loading News $e'));
      rethrow;
    }
  }
}
