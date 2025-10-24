import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class LanguageManager with ChangeNotifier {
  static const String _localeKey = 'locale';
  static const String _defaultLanguageCode = 'en';

  Locale _currentLocale = Locale(_defaultLanguageCode);
  bool _isInitialized = false;

  Locale get locale => _currentLocale;

  Future<void> init() async {
    if (_isInitialized) return;

    final prefs = await Hive.openBox('preferences');
    final savedLanguage = prefs.get(_localeKey);

    if (savedLanguage != null && savedLanguage is String) {
      _currentLocale = Locale(savedLanguage);
    } else {
      _currentLocale = Locale(_defaultLanguageCode);
      // Сохраняем локаль по умолчанию при первом запуске
      await prefs.put(_localeKey, _defaultLanguageCode);
    }

    _isInitialized = true;
  }

  Future<void> setLocale(Locale locale) async {
    if (_currentLocale.languageCode == locale.languageCode) return;

    _currentLocale = locale;

    final prefs = await Hive.openBox('preferences');
    await prefs.put(_localeKey, locale.languageCode);
    notifyListeners();
  }
}
