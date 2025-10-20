import 'dart:ui';
import 'package:flutter/foundation.dart';

class LanguageManager with ChangeNotifier {
  Locale _locale = Locale('en');

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }
}
