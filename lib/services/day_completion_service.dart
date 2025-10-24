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

  bool shouldShowDayCompletion(List<DateTime> missedDays, int dayResetHour) {
    return missedDays.isNotEmpty;
  }

  bool _isSameDay(DateTime date1, DateTime date2, int dayResetHour) {
    final adjustedDate1 = _adjustForDayReset(date1, dayResetHour);
    final adjustedDate2 = _adjustForDayReset(date2, dayResetHour);

    return adjustedDate1.year == adjustedDate2.year &&
        adjustedDate1.month == adjustedDate2.month &&
        adjustedDate1.day == adjustedDate2.day;
  }

  DateTime _adjustForDayReset(DateTime date, int dayResetHour) {
    // Если текущее время меньше часа сброса, считаем что это предыдущий день
    if (date.hour < dayResetHour) {
      return date.subtract(Duration(days: 1));
    }
    return date;
  }

  Future<List<DateTime>> getMissedDays(
      HiveService hiveService, int dayResetHour) async {
    final lastLogin = await getLastLoginDate(hiveService);
    final today = DateTime.now();

    // Используем adjusted даты для корректного сравнения
    final adjustedLastLogin = _adjustForDayReset(lastLogin, dayResetHour);
    final adjustedToday = _adjustForDayReset(today, dayResetHour);

    // Если adjusted даты совпадают - нет пропущенных дней
    if (adjustedLastLogin.year == adjustedToday.year &&
        adjustedLastLogin.month == adjustedToday.month &&
        adjustedLastLogin.day == adjustedToday.day) {
      return [];
    }

    final missedDays = <DateTime>[];

    // Начинаем со дня после последнего входа (adjusted)
    var currentDay = DateTime(adjustedLastLogin.year, adjustedLastLogin.month,
            adjustedLastLogin.day)
        .add(Duration(days: 1));

    final todayDate =
        DateTime(adjustedToday.year, adjustedToday.month, adjustedToday.day);

    // Добавляем все дни до сегодняшнего (не включая сегодня)
    while (currentDay.isBefore(todayDate)) {
      missedDays.add(currentDay);
      currentDay = currentDay.add(Duration(days: 1));
    }

    return missedDays;
  }
}
