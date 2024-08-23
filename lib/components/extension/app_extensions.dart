import 'dart:math';

extension StringExtension on String{
  String capitalize() => "${this[0].toUpperCase()}${substring(1)}";
}

extension ListExt<T> on List<T> {
  T? get firstIfNotEmpty => isNotEmpty ? first : null;

  T? get lastIfNotEmpty => isNotEmpty ? last : null;

  T? get random => isNotEmpty ? this[Random().nextInt(length)] : null;
}