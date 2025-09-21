import 'dart:js_interop';

@JS('gtag')
external void _gtag(String command, String eventName, JSAny? params);

class AnalyticsService {
  static void logEvent(String name, [Map<String, Object?>? params]) {
    try {
      _gtag('event', name, params?.jsify());
    } catch (_) {}
  }
}
