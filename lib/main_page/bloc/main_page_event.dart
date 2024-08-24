part of 'main_page_bloc.dart';

abstract class MainPageEvent extends Equatable {
  const MainPageEvent();
}

class Initialize extends MainPageEvent {
  const Initialize();

  @override
  List<Object?> get props => [];
}

class ChangeLocale extends MainPageEvent {
  final String locale;

  const ChangeLocale(this.locale);

  @override
  List<Object?> get props => [locale];
}
