// hive_service.dart
import 'package:hive/hive.dart';
import '../models/player.dart';
import '../models/habit.dart';
import '../models/task.dart';

class HiveService {
  Box<Player> get playersBox => Hive.box<Player>('players');
  Box<Habit> get habitsBox => Hive.box<Habit>('habits');
  Box<Task> get tasksBox => Hive.box<Task>('tasks');

  // Получаем единственного персонажа или создаем нового
  Player getPlayer() {
    final players = getPlayers();

    if (players.isEmpty) {
      print('CREATE DEFAULT');
      return createDefaultPlayer();
    }

    print(players.first.dayResetHour);
    return players.first;
  }

  Player createDefaultPlayer() {
    final player = Player(
      id: Player.defaultId,
      goal: Player.defaultGoal,
      createdDate: DateTime.now(),
      curveExponent: Player.defaultCurveExponent,
      experienceMultiplier: Player.defaultExperienceMultiplier,
    );
    playersBox.add(player);
    return player;
  }

  // Обновляем единственного персонажа
  void updatePlayer(Player player) {
    final key = _getPlayerKeyById(player.id);
    if (key != null) {
      playersBox.put(key, player);
    } else {
      // Если персонаж не найден, создаем нового
      playersBox.add(player);
    }
  }

  // Метод для сброса прогресса персонажа и привычек
  void resetPlayerProgress() {
    final player = getPlayer();

    // Сбрасываем персонажа
    final resetPlayer = Player(
      id: player.id,
      goal: player.goal,
      experience: Player.startingExperience,
      level: Player.startingLevel,
      createdDate: player.createdDate,
      curveExponent: player.curveExponent,
      experienceMultiplier: player.experienceMultiplier,
    );
    updatePlayer(resetPlayer);

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

  // Получаем список персонажей (всегда должен содержать только одного)
  List<Player> getPlayers() {
    return playersBox.values.toList();
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
  int? _getPlayerKeyById(String id) {
    final players = playersBox.toMap();
    for (var entry in players.entries) {
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
