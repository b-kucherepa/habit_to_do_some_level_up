import 'package:flutter/material.dart';
import 'package:habit_to_do_some_level_up/widgets/level_up_dialog.dart';

class LevelUpService {
  final ValueNotifier<int?> levelUpNotifier = ValueNotifier<int?>(null);
  GlobalKey<NavigatorState>? _navigatorKey;

  void setNavigatorKey(GlobalKey<NavigatorState> navigatorKey) {
    _navigatorKey = navigatorKey;
  }

  void notifyLevelUp(int newLevel) {
    levelUpNotifier.value = newLevel;

    // Показываем диалог немедленно, используя GlobalKey
    if (_navigatorKey != null && _navigatorKey!.currentContext != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: _navigatorKey!.currentContext!,
          barrierDismissible: false,
          builder: (context) => LevelUpDialog(newLevel: newLevel),
        ).then((_) {
          clearLevelUp();
        });
      });
    } else {
      throw ('Navigator key not set or context is null');
    }
  }

  void clearLevelUp() {
    levelUpNotifier.value = null;
  }
}
