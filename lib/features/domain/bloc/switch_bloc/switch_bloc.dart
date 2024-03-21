import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home_security/features/domain/bloc/switch_bloc/switch_event.dart';
import 'package:smart_home_security/features/domain/bloc/switch_bloc/switch_state.dart';

//TODO: переименовать блока для карточки
class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc({
    SwitchState? initialState,
    //required DeviceRepository repository,
    //_deviceRepository = repository,
  }) : super(
          initialState ?? SwitchEmpty(isActive: false),
        ) {
    //TODO: вынести все в отдельную функцию, добавить флаг в switchDevice, по которому мы должны сохранять в бд
    //если мы нажали на свитч на карточке, то isNeedToSave = false, если возвращаемся выставляем true
    on<SwitchEvent>((event, emit) =>
        switch (event) { SwitchDevice() => _switch(event, emit) });
  }
  //final DeviceRepository _deviceRepository;

  Future<void> _switch(
    SwitchDevice event,
    Emitter<SwitchState> emit,
  ) async {
    try {
      if (event.needToSave) {
        //await _deviceRepository.switch(event.device);
        print("я реально сохранил");
      }
      emit(Switched(isActive: event.state));
    } catch (e) {
      emit(
        SwitchLoadingError(
          exception: 'Error of adding News $e',
          isActive: false,
        ),
      );
      rethrow;
    }
  }
}
