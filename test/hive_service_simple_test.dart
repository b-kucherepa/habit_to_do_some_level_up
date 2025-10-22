import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'dart:io';

import 'package:todo_rpg_app/models/player.dart';
import 'package:todo_rpg_app/models/habit.dart';
import 'package:todo_rpg_app/models/task.dart';
import 'package:todo_rpg_app/services/hive_service.dart';

void main() {
  group('HiveService Simple Integration Tests', () {
    late Directory testDir;
    late HiveService hiveService;

    setUpAll(() async {
      testDir = await Directory.systemTemp.createTemp();
      Hive.init(testDir.path);

      // Регистрируем адаптеры
      Hive.registerAdapter(PlayerAdapter());
      Hive.registerAdapter(TaskAdapter());
      Hive.registerAdapter(HabitAdapter());
    });

    setUp(() async {
      // Открываем боксы перед каждым тестом
      await Hive.openBox<Player>('players');
      await Hive.openBox<Habit>('habits');
      await Hive.openBox<Task>('tasks');
      await Hive.openBox('preferences');

      hiveService = HiveService();
    });

    tearDown(() async {
      // Очищаем боксы после каждого теста
      await Hive.box<Player>('players').clear();
      await Hive.box<Habit>('habits').clear();
      await Hive.box<Task>('tasks').clear();
      await Hive.box('preferences').clear();

      // Закрываем боксы
      await Hive.box<Player>('players').close();
      await Hive.box<Habit>('habits').close();
      await Hive.box<Task>('tasks').close();
      await Hive.box('preferences').close();
    });

    tearDownAll(() async {
      await Hive.close();
      await testDir.delete(recursive: true);
    });

    test('Service can be instantiated after opening boxes', () {
      expect(hiveService, isNotNull);
      expect(() => hiveService.playersBox, returnsNormally);
      expect(() => hiveService.habitsBox, returnsNormally);
      expect(() => hiveService.tasksBox, returnsNormally);
    });

    test('Can create and retrieve default player', () {
      hiveService.createDefaultPlayer();

      final players = hiveService.getPlayers();
      expect(players, isNotEmpty);
      expect(players.first.id, 'default');
    });

    test('Can add and retrieve habit', () {
      final habit = Habit(
        id: 'test-habit',
        title: 'Test Habit',
        description: 'Test Description',
        experience: 10,
        scheduleType: 'daily',
        createdDate: DateTime.now(),
      );

      hiveService.habitsBox.add(habit);

      final habits = hiveService.getHabits();
      expect(habits, hasLength(1));
      expect(habits.first.title, 'Test Habit');
    });

    test('Can add and retrieve task', () {
      final task = Task(
        id: 'test-task',
        title: 'Test Task',
        description: 'Test Description',
        experience: 25,
        createdDate: DateTime.now(),
        dueDate: DateTime.now().add(Duration(days: 1)),
        priority: 3,
        category: 'general',
      );

      hiveService.tasksBox.add(task);

      final tasks = hiveService.getTasks();
      expect(tasks, hasLength(1));
      expect(tasks.first.title, 'Test Task');
    });
  });
}
