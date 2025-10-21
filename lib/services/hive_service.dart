import 'package:hive/hive.dart';
import '../models/character.dart';
import '../models/habit.dart';
import '../models/task.dart';

class HiveService {
  Box<Character> get charactersBox => Hive.box<Character>('characters');
  Box<Habit> get habitsBox => Hive.box<Habit>('habits');
  Box<Task> get tasksBox => Hive.box<Task>('tasks');

  // Автоматически создаем персонажа при первом доступе
  Character getFirstCharacter() {
    final characters = getCharacters();
    if (characters.isEmpty) {
      createDefaultCharacter();
      return getCharacters().first;
    }
    return characters.first;
  }

  void createDefaultCharacter() {
    final character = Character(
      id: Character.defaultId,
      goal: Character.defaultGoal,
      createdDate: DateTime.now(),
      curveExponent: Character.defaultCurveExponent,
      experienceMultiplier: Character.defaultExperienceMultiplier,
    );
    charactersBox.add(character);
  }

  // Метод для сброса прогресса персонажа и привычек
  void resetCharacterProgress() {
    final character = getFirstCharacter();

    // Сбрасываем персонажа
    final resetCharacter = Character(
      id: character.id,
      goal: character.goal,
      experience: Character.startingExperience,
      level: Character.startingLevel,
      createdDate: character.createdDate,
      curveExponent: character.curveExponent,
      experienceMultiplier: character.experienceMultiplier,
    );
    updateCharacter(resetCharacter);

    // Сбрасываем все привычки
    final habits = getHabits();
    for (final habit in habits) {
      final resetHabit = Habit(
        id: habit.id,
        title: habit.title,
        description: habit.description,
        experience: habit.experience,
        scheduleType: habit.scheduleType,
        daysOfWeek: habit.daysOfWeek,
        daysOfMonth: habit.daysOfMonth,
        intervalDays: habit.intervalDays,
        createdDate: habit.createdDate,
        completionHistory: {}, // Очищаем историю выполнений
        minCompletionCount: habit.minCompletionCount,
        karmaLevel: Habit.defaultKarma, // Сбрасываем карму
      );
      updateHabit(resetHabit);
    }
  }

  // Остальные методы остаются без изменений
  List<Character> getCharacters() {
    return charactersBox.values.toList();
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
