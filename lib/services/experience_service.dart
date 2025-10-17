import '../models/character.dart';
import '../models/habit.dart';
import '../models/task.dart';
import 'hive_service.dart';

class ExperienceService {
  final HiveService _hiveService = HiveService();

  void toggleHabitCompletion(Habit habit, bool completed) {
    final habits = _hiveService.getHabits();
    final habitIndex = habits.indexWhere((h) => h.id == habit.id);

    if (habitIndex != -1) {
      final wasCompleted = habit.isCompletedToday();
      final updatedHabit = Habit(
        id: habit.id,
        title: habit.title,
        description: habit.description,
        experience: habit.experience,
        scheduleType: habit.scheduleType,
        daysOfWeek: habit.daysOfWeek,
        daysOfMonth: habit.daysOfMonth,
        intervalDays: habit.intervalDays,
        createdDate: habit.createdDate,
        completionHistory: {...habit.completionHistory},
      );

      updatedHabit.markComplete(completed);
      _hiveService.updateHabit(updatedHabit);

      // Update character experience
      if (completed && !wasCompleted) {
        _updateCharacterExperience(habit.experience);
      } else if (!completed && wasCompleted) {
        _updateCharacterExperience(-habit.experience);
      }
    }
  }

  void toggleTaskCompletion(Task task, bool completed) {
    final tasks = _hiveService.getTasks();
    final taskIndex = tasks.indexWhere((t) => t.id == task.id);

    if (taskIndex != -1) {
      final wasCompleted = task.completed;
      final updatedTask = Task(
        id: task.id,
        title: task.title,
        description: task.description,
        experience: task.experience,
        completed: completed,
        completedDate: completed ? DateTime.now() : null,
        createdDate: task.createdDate,
        dueDate: task.dueDate,
        priority: task.priority,
        category: task.category,
      );

      _hiveService.updateTask(updatedTask);

      // Update character experience
      if (completed && !wasCompleted) {
        _updateCharacterExperience(task.experience);
      } else if (!completed && wasCompleted) {
        _updateCharacterExperience(-task.experience);
      }
    }
  }

  void deleteHabit(Habit habit) {
    // Remove experience if habit was completed today
    if (habit.isCompletedToday()) {
      _updateCharacterExperience(-habit.experience);
    }
    _hiveService.deleteHabit(habit);
  }

  void deleteTask(Task task) {
    // Remove experience if task was completed
    if (task.completed) {
      _updateCharacterExperience(-task.experience);
    }
    _hiveService.deleteTask(task);
  }

  void _updateCharacterExperience(int experience) {
    final character = _hiveService.getFirstCharacter();
    if (character != null) {
      final updatedCharacter = Character(
        id: character.id,
        name: character.name,
        experience: character.experience,
        level: character.level,
        createdDate: character.createdDate,
      );

      // Update level with new experience
      if (experience > 0) {
        updatedCharacter.addExperience(experience);
      } else {
        updatedCharacter.removeExperience(-experience);
      }

      _hiveService.updateCharacter(updatedCharacter);
    }
  }
}
