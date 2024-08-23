part of 'app_control_bloc.dart';

sealed class AppControlEvent extends Equatable {
  const AppControlEvent();
}

class ChangeAppThemeEvent extends AppControlEvent {
  final ThemeMode? themeMode;

  const ChangeAppThemeEvent({this.themeMode});

  @override
  List<dynamic> get props => [themeMode];
}
