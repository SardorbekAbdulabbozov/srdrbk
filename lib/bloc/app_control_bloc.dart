import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:srdrbk/components/global_variables.dart';

part 'app_control_event.dart';
part 'app_control_state.dart';

class AppControlBloc extends Bloc<AppControlEvent, AppControlState> {
  AppControlBloc() : super( AppControlState(themeMode: storageService.getTheme())) {
    on<ChangeAppThemeEvent>(_changeAppTheme);
  }

  void _changeAppTheme(
    ChangeAppThemeEvent event,
    Emitter<AppControlState> emit,
  ) {
    emit(state.copyWith(themeMode: event.themeMode));
  }
}
