import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/day_completion_service.dart';
import '../services/hive_service.dart';
import 'day_completion_screen.dart';
import 'home_screen.dart';

class DayCompletionWrapper extends StatefulWidget {
  const DayCompletionWrapper({super.key});

  @override
  _DayCompletionWrapperState createState() => _DayCompletionWrapperState();
}

class _DayCompletionWrapperState extends State<DayCompletionWrapper> {
  final DayCompletionService _dayCompletionService = DayCompletionService();
  late HiveService _hiveService;
  bool _checkingDays = true;
  List<DateTime> _missedDays = [];
  int _currentDayIndex = 0;
  Map<String, int>? _lastSessionData;

  @override
  void initState() {
    super.initState();
    _hiveService = Provider.of<HiveService>(context, listen: false);
    _initializeApp();
  }

  void _initializeApp() async {
    _checkMissedDays();
  }

  void _checkMissedDays() async {
    final player = _hiveService.getPlayer();
    final lastLogin =
        await _dayCompletionService.getLastLoginDate(_hiveService);
    final missedDays = await _dayCompletionService.getMissedDays(
        _hiveService, player.dayResetHour);

    if (missedDays.isNotEmpty) {
      _lastSessionData = _getLastSessionData(lastLogin);
    }

    if (mounted) {
      setState(() {
        _missedDays = missedDays;
        _checkingDays = false;
      });
    }
  }

  // Получаем данные привычек на момент последнего входа
  Map<String, int> _getLastSessionData(DateTime lastLoginDate) {
    final habits = _hiveService.getHabits();
    final lastSessionData = <String, int>{};

    for (final habit in habits) {
      final lastLoginKey = _dateToKey(lastLoginDate);
      lastSessionData[habit.id] = habit.completionHistory[lastLoginKey] ?? 0;
    }

    return lastSessionData;
  }

  String _dateToKey(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  void _onDayCompleted(bool shouldContinue) {
    _proceedToNextDay();
  }

  void _proceedToNextDay() {
    if (_currentDayIndex >= _missedDays.length - 1) {
      // Все дни обработаны - переходим к главному экрану
      if (mounted) {
        setState(() {
          _missedDays = [];
        });
        // Обновляем дату последнего входа на сегодня
        _dayCompletionService.setLastLoginDate(DateTime.now(), _hiveService);
      }
    } else {
      // Переходим к следующему дню
      if (mounted) {
        setState(() {
          _currentDayIndex++;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_checkingDays) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_missedDays.isNotEmpty) {
      final targetDate = _missedDays[_currentDayIndex];
      final daysAgo = DateTime.now().difference(targetDate).inDays;
      final habits = _hiveService.getHabits();

      // Только для ПЕРВОГО дня (дня последнего входа) используем данные последней сессии
      // Для всех последующих дней используем нули
      final initialData = _currentDayIndex == 0 ? _lastSessionData : null;

      return DayCompletionScreen(
        targetDate: targetDate,
        daysAgo: daysAgo,
        habits: habits,
        initialCompletionData: initialData,
        onDayCompleted: _onDayCompleted,
      );
    }

    return HomeScreen();
  }
}
