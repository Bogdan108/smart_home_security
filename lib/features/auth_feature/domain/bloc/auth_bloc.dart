import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smart_home_security/core/utils/exception_to_message.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    //required AuthRepository repository,
    AuthState? initialState,
  }) : //_repository = repository,
        super(initialState ?? const AuthState.idle(isAuthenticated: false)) {
    //_repository.isAuthenticatedStream.map((isAuthenticated) {});
    on<AuthEvent>(
      (event, emit) => switch (event) {
        _AuthEvent$CheckStatus() => _checkStatus(emit),
        _AuthEvent$Register() => _register(event, emit),
        _AuthEvent$Login() => _login(event, emit),
        _AuthEvent$Logout() => _logout(emit),
      },
      //transformer: bloc_concurrency.droppable(),
    );
  }

  //final AuthRepository _repository;

  Future<void> _checkStatus(Emitter<AuthState> emit) async {
    emit(AuthState.processing(isAuthenticated: state.isAuthenticated));
    try {
      // final isAuthenticated = await _repository.checkAuthenticatedStatus();
      const isAuthenticated = false;
      // ignore: dead_code
      if (isAuthenticated) {
        emit(const AuthState.idle(isAuthenticated: true));
      } else {
        emit(const AuthState.idle(isAuthenticated: false));
      }
    } on Object catch (e) {
      emit(AuthState.error(
        isAuthenticated: state.isAuthenticated,
        message: exceptionToMessage(e),
      ));
      rethrow;
    } finally {
      emit(AuthState.idle(isAuthenticated: state.isAuthenticated));
    }
  }

  Future<void> _register(
    _AuthEvent$Register event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthState.processing(isAuthenticated: state.isAuthenticated));
    try {
      // await _repository.register(
      //   event.username,
      //   event.password,
      // );
      emit(AuthState.successful(
        isAuthenticated: state.isAuthenticated,
        message: 'Вы успешно зарегистрировались',
      ));
    } on Object {
      emit(AuthState.error(
        isAuthenticated: state.isAuthenticated,
        message: 'Регистрация временно недоступна',
      ));
      rethrow;
    } finally {
      emit(AuthState.idle(isAuthenticated: state.isAuthenticated));
    }
  }

  Future<void> _login(
    _AuthEvent$Login event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthState.processing(isAuthenticated: state.isAuthenticated));
    try {
      // await _repository.login(
      //   event.username,
      //   event.password,
      // );
      emit(
        const AuthState.successful(
          isAuthenticated: true,
          message: 'Вы успешно вошли',
        ),
      );
    } on Object catch (e) {
      emit(AuthState.error(
        isAuthenticated: state.isAuthenticated,
        message: exceptionToMessage(e),
      ));
      rethrow;
    } finally {
      emit(AuthState.idle(isAuthenticated: state.isAuthenticated));
    }
  }

  Future<void> _logout(
    Emitter<AuthState> emit,
  ) async {
    emit(AuthState.processing(isAuthenticated: state.isAuthenticated));
    try {
      // await _repository.logout();
      // emit(const AuthState.idle(
      //   isAuthenticated: false,
      //   message: 'Вы успешно вышли',
      // ));
    } on Object catch (e) {
      emit(AuthState.error(
        isAuthenticated: state.isAuthenticated,
        message: exceptionToMessage(e),
      ));
      rethrow;
    } finally {
      emit(AuthState.idle(isAuthenticated: state.isAuthenticated));
    }
  }
}
