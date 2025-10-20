import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'dart:io';

import 'package:todo_rpg_app/models/character.dart';
import 'package:todo_rpg_app/models/habit.dart';
import 'package:todo_rpg_app/models/task.dart';

void main() {
  group('Simple Hive Tests', () {
    late Directory testDir;

    setUpAll(() async {
      testDir = await Directory.systemTemp.createTemp();
      Hive.init(testDir.path);

      // Регистрируем адаптеры
      Hive.registerAdapter(CharacterAdapter());
      Hive.registerAdapter(TaskAdapter());
      Hive.registerAdapter(HabitAdapter());
    });

    tearDownAll(() async {
      await Hive.close();
      await testDir.delete(recursive: true);
    });

    test('Can store and retrieve Character', () async {
      final box = await Hive.openBox<Character>('test_characters');
      await box.clear();

      final character = Character(
        id: 'test-char',
        goal: 'Test Goal',
        experience: 100,
        level: 2,
        createdDate: DateTime.now(),
        curveExponent: 1.5,
        experienceMultiplier: 100.0,
      );

      await box.add(character);

      final characters = box.values.toList();
      expect(characters, hasLength(1));
      expect(characters.first.id, 'test-char');
      expect(characters.first.goal, 'Test Goal');

      await box.close();
    });

    test('Can store and retrieve Habit', () async {
      final box = await Hive.openBox<Habit>('test_habits');
      await box.clear();

      final habit = Habit(
        id: 'test-habit',
        title: 'Test Habit',
        description: 'Test Description',
        experience: 10,
        scheduleType: 'daily',
        createdDate: DateTime.now(),
      );

      await box.add(habit);

      final habits = box.values.toList();
      expect(habits, hasLength(1));
      expect(habits.first.title, 'Test Habit');
      expect(habits.first.experience, 10);

      await box.close();
    });

    test('Can store and retrieve Task', () async {
      final box = await Hive.openBox<Task>('test_tasks');
      await box.clear();

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

      await box.add(task);

      final tasks = box.values.toList();
      expect(tasks, hasLength(1));
      expect(tasks.first.title, 'Test Task');
      expect(tasks.first.experience, 25);

      await box.close();
    });
  });
}
