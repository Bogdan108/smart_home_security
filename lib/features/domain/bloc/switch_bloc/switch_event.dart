import 'package:equatable/equatable.dart';

sealed class SwitchEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SwitchDevice extends SwitchEvent {
  final bool state;
  final bool needToSave;
  SwitchDevice({required this.state, required this.needToSave});
  @override
  List<Object> get props => [state];
}
