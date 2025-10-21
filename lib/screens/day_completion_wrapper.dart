import 'package:flutter/material.dart';
import 'package:todo_rpg_app/services/character_service.dart';

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
  final HiveService _hiveService = HiveService();
  final CharacterService _characterService = CharacterService(HiveService());
  bool _checkingDays = true;
  List<DateTime> _missedDays = [];
  int _currentDayIndex = 0;
  Map<String, int>? _lastSessionData;

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  void _initializeApp() async {
    // Инициализируем персонажа с правильной локализацией
    await _characterService.ensureCharacterInitialized(context);
    _checkMissedDays();
  }

  void _checkMissedDays() async {
    final lastLogin = await _dayCompletionService.getLastLoginDate();
    final missedDays = await _dayCompletionService.getMissedDays();

    // Получаем данные последней сессии только если есть пропущенные дни
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
        _dayCompletionService.setLastLoginDate(DateTime.now());
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
