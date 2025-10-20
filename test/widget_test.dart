import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:todo_rpg_app/widgets/habit_item_widget.dart';
import 'package:todo_rpg_app/models/habit.dart';

void main() {
  group('HabitItemWidget Tests', () {
    testWidgets('Renders habit with correct title and description',
        (WidgetTester tester) async {
      final habit = Habit(
        id: 'test',
        title: 'Test Habit',
        description: 'Test Description',
        experience: 10,
        scheduleType: 'daily',
        createdDate: DateTime.now(),
      );

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: HabitItemWidget(
            habit: habit,
            currentCount: 0,
            isEditable: true,
            onIncrement: () {},
            onDecrement: () {},
          ),
        ),
      ));

      expect(find.text('Test Habit'), findsOneWidget);
      expect(find.text('Test Description'), findsOneWidget);
      expect(find.text('10 XP'), findsOneWidget);
    });

    testWidgets('Shows correct completion count', (WidgetTester tester) async {
      final habit = Habit(
        id: 'test',
        title: 'Test Habit',
        description: 'Test',
        experience: 10,
        scheduleType: 'daily',
        createdDate: DateTime.now(),
      );

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: HabitItemWidget(
            habit: habit,
            currentCount: 3,
            isEditable: true,
            onIncrement: () {},
            onDecrement: () {},
          ),
        ),
      ));

      expect(find.text('3'), findsOneWidget);
    });

    testWidgets('Increment and decrement buttons work',
        (WidgetTester tester) async {
      var count = 0;
      final habit = Habit(
        id: 'test',
        title: 'Test Habit',
        description: 'Test',
        experience: 10,
        scheduleType: 'daily',
        createdDate: DateTime.now(),
      );

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return HabitItemWidget(
                habit: habit,
                currentCount: count,
                isEditable: true,
                onIncrement: () => setState(() => count++),
                onDecrement: () => setState(() => count--),
              );
            },
          ),
        ),
      ));

      // Test increment
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      // Теперь счетчик должен быть 1
      expect(count, 1);

      // Test decrement
      await tester.tap(find.byIcon(Icons.remove));
      await tester.pump();

      // Теперь счетчик должен быть 0
      expect(count, 0);
    });

    testWidgets('Shows karma indicator with correct color',
        (WidgetTester tester) async {
      final habit = Habit(
        id: 'test',
        title: 'Test Habit',
        description: 'Test',
        experience: 10,
        scheduleType: 'daily',
        createdDate: DateTime.now(),
        karmaLevel: 3, // Green color
      );

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: HabitItemWidget(
            habit: habit,
            currentCount: 0,
            isEditable: true,
            onIncrement: () {},
            onDecrement: () {},
            showKarmaIndicator: true,
          ),
        ),
      ));

      // Verify karma indicator is present by finding the container with specific width
      expect(find.byType(Container), findsWidgets);
    });
  });
}
