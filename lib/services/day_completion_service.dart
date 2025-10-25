import 'package:habit_to_do_some_level_up/services/hive_service.dart';

class DayCompletionService {
  static DateTime _adjustForDayReset(DateTime date, int dayResetHour) {
    // Если текущее время меньше часа сброса, считаем что это предыдущий день
    final DateTime resetHourTime =
        DateTime(date.year, date.month, date.day, dayResetHour, 0, 0);
    final bool isBeforeResetHour = date.isBefore(resetHourTime);

    DateTime adjustedTime = DateTime(date.year, date.month, date.day);

    if (isBeforeResetHour) {
      adjustedTime = adjustedTime.subtract(Duration(days: 1));
    }
    return adjustedTime;
  }

  Future<DateTime> getLastLoginDate(HiveService hiveService) async {
    final player = hiveService.getPlayer();
    return player.lastLoginDate;
  }

  Future<void> setLastLoginDate(DateTime date, HiveService hiveService) async {
    final player = hiveService.getPlayer();
    player.updateLastLoginDate(date);
    hiveService.updatePlayer(player);
  }

  bool shouldShowDayCompletion(List<DateTime> missedDays, int dayResetHour) {
    return missedDays.isNotEmpty;
  }

  Future<List<DateTime>> getMissedDays(
      HiveService hiveService, int dayResetHour) async {
    final lastLogin = await getLastLoginDate(hiveService);
    final now = DateTime.now();

    // Получаем adjusted даты для корректного сравнения
    final adjustedLastLogin = _adjustForDayReset(lastLogin, dayResetHour);
    final adjustedNow = _adjustForDayReset(now, dayResetHour);

    print('Last login: $lastLogin -> $adjustedLastLogin');
    print('Now: $now -> $adjustedNow');

    // Если adjusted даты совпадают - нет пропущенных дней
    if (adjustedLastLogin.isAtSameMomentAs(adjustedNow)) {
      return [];
    }

    final missedDays = <DateTime>[];

    // Начинаем со дня после последнего входа (adjusted)
    var currentDay = adjustedLastLogin;

    // Добавляем все дни до сегодняшнего (включительно), если они есть
    while (currentDay.isBefore(adjustedNow)) {
      missedDays.add(currentDay);
      currentDay = currentDay.add(Duration(days: 1));
    }

    print('Missed days: $missedDays');
    return missedDays;
  }

  // Проверяет, наступило ли время следующего дня прямо сейчас
  bool isNewDayStarted(HiveService hiveService, int dayResetHour) {
    final lastLogin = hiveService.getPlayer().lastLoginDate;
    final now = DateTime.now();

    final adjustedLastLogin = _adjustForDayReset(lastLogin, dayResetHour);
    final adjustedNow = _adjustForDayReset(now, dayResetHour);

    return adjustedLastLogin.isBefore(adjustedNow);
  }
}
