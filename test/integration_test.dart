import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/material.dart';
import 'package:todo_rpg_app/models/player.dart';
import 'package:todo_rpg_app/models/habit.dart';
import 'package:todo_rpg_app/models/task.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Basic App Tests', () {
    testWidgets('Basic widget structure works', (WidgetTester tester) async {
      // Простой тест виджета без запуска всего приложения
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: AppBar(title: Text('Test App')),
            body: Center(
              child: Column(
                children: [
                  Text('Test Widget 1'),
                  Text('Test Widget 2'),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.text('Test App'), findsOneWidget);
      expect(find.text('Test Widget 1'), findsOneWidget);
      expect(find.text('Test Widget 2'), findsOneWidget);
    });

    testWidgets('Button tap works', (WidgetTester tester) async {
      var tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: ElevatedButton(
                onPressed: () => tapped = true,
                child: Text('Test Button'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Test Button'));
      await tester.pump();

      expect(tapped, true);
    });
  });

  group('Model Logic Tests', () {
    test('Player experience system', () {
      final player = Player(
        id: 'test',
        goal: 'Test Goal',
        experience: 0,
        level: 1,
        createdDate: DateTime.now(),
        curveExponent: 1.0,
        experienceMultiplier: 100.0,
      );

      // Test level progression
      expect(player.level, 1);
      player.addExperience(100);
      expect(player.level, 2);
      expect(player.experience, 100);
    });

    test('Habit completion system', () {
      final habit = Habit(
        id: 'test',
        title: 'Test Habit',
        description: 'Test',
        experience: 10,
        scheduleType: 'daily',
        createdDate: DateTime.now(),
        minCompletionCount: 1,
      );

      expect(habit.isCompletedToday, false);
      habit.incrementCompletion();
      expect(habit.isCompletedToday, true);
      expect(habit.getTodayCompletionCount(), 1);
    });

    test('Task completion system', () {
      final task = Task(
        id: 'test',
        title: 'Test Task',
        description: 'Test',
        experience: 25,
        createdDate: DateTime.now(),
        dueDate: DateTime.now().add(Duration(days: 1)),
        priority: 3,
        category: 'general',
      );

      expect(task.completed, false);
      task.completed = true;
      task.completedDate = DateTime.now();
      expect(task.completed, true);
      expect(task.completedDate, isNotNull);
    });
  });
}
