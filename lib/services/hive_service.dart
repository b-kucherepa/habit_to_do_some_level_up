import 'package:hive/hive.dart';
import '../models/character.dart';
import '../models/habit.dart';
import '../models/task.dart';

class HiveService {
  Box<Character> get charactersBox => Hive.box<Character>('characters');
  Box<Habit> get habitsBox => Hive.box<Habit>('habits');
  Box<Task> get tasksBox => Hive.box<Task>('tasks');

  // Метод для миграции всех привычек
  void migrateAllHabits() {
    final habits = getHabits();
    for (final habit in habits) {
      // Просто обновляем привычку, конструктор сам выполнит миграцию
      updateHabit(habit);
    }
  }

  // Character methods
  List<Character> getCharacters() {
    return charactersBox.values.toList();
  }

  Character? getFirstCharacter() {
    final characters = getCharacters();
    return characters.isNotEmpty ? characters.first : null;
  }

  void createDefaultCharacter() {
    final character = Character(
      id: 'default',
      goal: 'Accumulate experience to create your RPG character!',
      createdDate: DateTime.now(),
      levelSystem: 'linear',
      multiplier: 1,
    );
    charactersBox.add(character);
  }

  void updateCharacter(Character character) {
    final key = _getCharacterKeyById(character.id);
    if (key != null) {
      charactersBox.put(key, character);
    }
  }

  // Habit methods
  List<Habit> getHabits() {
    return habitsBox.values.toList();
  }

  void updateHabit(Habit habit) {
    final key = _getHabitKeyById(habit.id);
    if (key != null) {
      habitsBox.put(key, habit);
    }
  }

  void deleteHabit(Habit habit) {
    final key = _getHabitKeyById(habit.id);
    if (key != null) {
      habitsBox.delete(key);
    }
  }

  // Task methods
  List<Task> getTasks() {
    return tasksBox.values.toList();
  }

  void updateTask(Task task) {
    final key = _getTaskKeyById(task.id);
    if (key != null) {
      tasksBox.put(key, task);
    }
  }

  void deleteTask(Task task) {
    final key = _getTaskKeyById(task.id);
    if (key != null) {
      tasksBox.delete(key);
    }
  }

  // Helper methods to find keys
  int? _getCharacterKeyById(String id) {
    final characters = charactersBox.toMap();
    for (var entry in characters.entries) {
      if (entry.value.id == id) {
        return entry.key;
      }
    }
    return null;
  }

  int? _getHabitKeyById(String id) {
    final habits = habitsBox.toMap();
    for (var entry in habits.entries) {
      if (entry.value.id == id) {
        return entry.key;
      }
    }
    return null;
  }

  int? _getTaskKeyById(String id) {
    final tasks = tasksBox.toMap();
    for (var entry in tasks.entries) {
      if (entry.value.id == id) {
        return entry.key;
      }
    }
    return null;
  }
}
