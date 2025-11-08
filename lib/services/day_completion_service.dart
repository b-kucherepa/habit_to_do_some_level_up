import 'package:habit_to_do_some_level_up/services/hive_service.dart';

class DayCompletionService {
  Future<DateTime> getLastLoginDate(HiveService hiveService) async {
    final player = hiveService.getPlayer();
    return player.lastLoginDate;
  }

  Future<void> setLastLoginDate(DateTime date, HiveService hiveService) async {
    final player = hiveService.getPlayer();
    player.updateLastLoginDate(date);
    hiveService.updatePlayer(player);
  }

  bool shouldShowDayCompletion(List<DateTime> missedDays) {
    return missedDays.isNotEmpty;
  }

  Future<List<DateTime>> getMissedDays(HiveService hiveService) async {
    final lastLogin = await getLastLoginDate(hiveService);

    final lastLoginDay = _getTimelessDay(lastLogin);
    final today = _getTimelessDay(DateTime.now());

    if (!lastLoginDay.isBefore(today)) {
      return [];
    }

    final missedDays = <DateTime>[];

    var currentDay = _getTimelessDay(lastLogin);

    // Добавляем все дни до сегодняшнего, если они есть
    while (currentDay.isBefore(today)) {
      missedDays.add(currentDay);
      currentDay = currentDay.add(Duration(days: 1));
    }

    return missedDays;
  }

  DateTime _getTimelessDay(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }
}
