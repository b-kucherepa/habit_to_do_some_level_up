import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:habit_to_do_some_level_up/services/hive_service.dart';

class LanguageManager with ChangeNotifier {
  static const String _defaultLanguageCode = 'en';

  Locale _currentLocale = Locale(_defaultLanguageCode);
  bool _isInitialized = false;

  Locale get locale => _currentLocale;

  Future<void> init(HiveService hiveService) async {
    if (_isInitialized) return;

    final player = hiveService.getPlayer();
    final savedLanguage = player.languageCode;

    if (savedLanguage.isNotEmpty) {
      _currentLocale = Locale(savedLanguage);
    } else {
      _currentLocale = Locale(_defaultLanguageCode);
      // Сохраняем локаль по умолчанию в Player
      player.updateLanguage(_defaultLanguageCode);
      hiveService.updatePlayer(player);
    }

    _isInitialized = true;
  }

  Future<void> setLocale(Locale locale, HiveService hiveService) async {
    if (_currentLocale.languageCode == locale.languageCode) return;

    _currentLocale = locale;

    // Сохраняем в Player
    final player = hiveService.getPlayer();
    player.updateLanguage(locale.languageCode);
    hiveService.updatePlayer(player);

    notifyListeners();
  }
}
