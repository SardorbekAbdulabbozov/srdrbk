part of 'app_control_bloc.dart';

class AppControlState extends Equatable {
  final ThemeMode themeMode;

  const AppControlState({required this.themeMode});

  AppControlState copyWith({
    ThemeMode? themeMode,
  }) {
    return AppControlState(
      themeMode: themeMode ?? this.themeMode,
    );
  }

  @override
  List<dynamic> get props => [themeMode];
}
