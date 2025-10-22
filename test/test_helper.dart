import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:habit_to_do_some_level_up/models/player.dart';
import 'dart:io';

import 'package:habit_to_do_some_level_up/models/habit.dart';
import 'package:habit_to_do_some_level_up/models/task.dart';

// Helper functions for testing
Future<void> initTestHive() async {
  final directory = await Directory.systemTemp.createTemp();
  Hive.init(directory.path);
}

// Common test data generators
Player createTestPlayer({
  String id = 'test-player',
  String goal = 'Test Goal',
  int experience = 0,
  int level = 1,
  double curveExponent = 1.5,
  double experienceMultiplier = 100.0,
}) {
  return Player(
    id: id,
    goal: goal,
    experience: experience,
    level: level,
    createdDate: DateTime.now(),
    curveExponent: curveExponent,
    experienceMultiplier: experienceMultiplier,
  );
}

Habit createTestHabit({
  String id = 'test-habit',
  String title = 'Test Habit',
  String description = 'Test Description',
  int experience = 10,
  String scheduleType = 'daily',
  int minCompletionCount = 1,
  int karmaLevel = 0,
}) {
  return Habit(
    id: id,
    title: title,
    description: description,
    experience: experience,
    scheduleType: scheduleType,
    createdDate: DateTime.now(),
    minCompletionCount: minCompletionCount,
    karmaLevel: karmaLevel,
  );
}

Task createTestTask({
  String id = 'test-task',
  String title = 'Test Task',
  String description = 'Test Description',
  int experience = 25,
  bool completed = false,
  int priority = 3,
  String category = 'general',
}) {
  return Task(
    id: id,
    title: title,
    description: description,
    experience: experience,
    completed: completed,
    createdDate: DateTime.now(),
    dueDate: DateTime.now().add(Duration(days: 1)),
    priority: priority,
    category: category,
  );
}

// Test configuration
const slowTest = Timeout(Duration(seconds: 5));
const verySlowTest = Timeout(Duration(seconds: 10));
