import 'package:hive/hive.dart';
import 'dart:io';

// Импортируем модели и их адаптеры
import 'package:todo_rpg_app/models/character.dart';
import 'package:todo_rpg_app/models/habit.dart';
import 'package:todo_rpg_app/models/task.dart';

class HiveTestHelper {
  static bool _isInitialized = false;
  static Directory? _testDir;

  static Future<void> initialize() async {
    if (!_isInitialized) {
      _testDir = await Directory.systemTemp.createTemp();
      Hive.init(_testDir!.path);

      // Регистрируем адаптеры только один раз
      if (!Hive.isAdapterRegistered(0)) {
        Hive.registerAdapter(CharacterAdapter());
      }
      if (!Hive.isAdapterRegistered(1)) {
        Hive.registerAdapter(TaskAdapter());
      }
      if (!Hive.isAdapterRegistered(2)) {
        Hive.registerAdapter(HabitAdapter());
      }

      // Явно открываем все необходимые боксы
      await Hive.openBox<Character>('characters');
      await Hive.openBox<Habit>('habits');
      await Hive.openBox<Task>('tasks');
      await Hive.openBox('preferences');

      _isInitialized = true;
    }
  }

  static Future<void> close() async {
    await Hive.close();
    _isInitialized = false;
    if (_testDir != null) {
      await _testDir!.delete(recursive: true);
    }
  }

  static Future<void> reset() async {
    await close();
    await initialize();
  }

  // Методы для получения открытых боксов
  static Box<Character> get charactersBox => Hive.box<Character>('characters');
  static Box<Habit> get habitsBox => Hive.box<Habit>('habits');
  static Box<Task> get tasksBox => Hive.box<Task>('tasks');
  static Box get preferencesBox => Hive.box('preferences');
}
