import 'package:flutter_test/flutter_test.dart';
import 'package:todo_rpg_app/models/task.dart';

void main() {
  late Task task;

  setUp(() {
    task = Task(
      id: 'test-task',
      title: 'Test Task',
      description: 'Test Description',
      experience: 25,
      createdDate: DateTime.now(),
      dueDate: DateTime.now().add(Duration(days: 1)),
      priority: 3,
      category: 'work',
    );
  });

  group('Task Model Tests', () {
    test('Task initializes with correct values', () {
      expect(task.id, 'test-task');
      expect(task.title, 'Test Task');
      expect(task.experience, 25);
      expect(task.completed, false);
      expect(task.priority, 3);
      expect(task.category, 'work');
      expect(task.completedDate, isNull);
    });

    test('Task status checks', () {
      // Not overdue when due in future
      expect(task.isOverdue, false);
      expect(task.isDueToday, false);
      expect(task.isDueSoon, true);

      // Due today
      final todayTask = Task(
        id: 'today',
        title: 'Today',
        description: 'Test',
        experience: 10,
        createdDate: DateTime.now(),
        dueDate: DateTime.now(),
        priority: 3,
        category: 'general',
      );
      expect(todayTask.isDueToday, true);
      expect(todayTask.isDueSoon, false);

      // Overdue
      final overdueTask = Task(
        id: 'overdue',
        title: 'Overdue',
        description: 'Test',
        experience: 10,
        createdDate: DateTime.now(),
        dueDate: DateTime.now().subtract(Duration(days: 1)),
        priority: 3,
        category: 'general',
      );
      expect(overdueTask.isOverdue, true);
      expect(overdueTask.isDueToday, false);
      expect(overdueTask.isDueSoon, false);
    });

    test('Task completion', () {
      expect(task.completed, false);
      expect(task.completedDate, isNull);

      task.completed = true;
      task.completedDate = DateTime.now();

      expect(task.completed, true);
      expect(task.completedDate, isNotNull);
    });
  });
}
