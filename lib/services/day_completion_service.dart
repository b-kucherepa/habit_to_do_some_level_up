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
    final now = DateTime.now();

    if (lastLogin.day == now.day) {
      return [];
    }

    final missedDays = <DateTime>[];

    var currentMoment = lastLogin;

    // Добавляем все дни до сегодняшнего, если они есть
    while (currentMoment.day < now.day) {
      missedDays.add(currentMoment);
      currentMoment = currentMoment.add(Duration(days: 1));
    }

    return missedDays;
  }
}
