import 'package:equatable/equatable.dart';

sealed class SwitchState extends Equatable {
  final bool isActive;

  const SwitchState({required this.isActive});

  @override
  List<Object> get props => [];
}

class SwitchEmpty extends SwitchState {
  final bool isActive;

  const SwitchEmpty({required this.isActive}) : super(isActive: false);

  @override
  List<Object> get props => [isActive];
}

class Switched extends SwitchState {
  final bool isActive;

  const Switched({
    required this.isActive,
  }) : super(isActive: false);

  @override
  List<Object> get props => [isActive];
}

class SwitchLoadingError extends SwitchState {
  final String exception;

  const SwitchLoadingError({required this.exception, required super.isActive});
  @override
  List<Object> get props => [exception];
}
