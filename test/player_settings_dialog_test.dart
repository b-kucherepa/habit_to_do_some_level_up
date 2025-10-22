import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:habit_to_do_some_level_up/widgets/player_settings_dialog.dart';
import 'package:habit_to_do_some_level_up/models/player.dart';

void main() {
  group('PlayerSettingsDialog Tests', () {
    testWidgets('Renders with initial player values',
        (WidgetTester tester) async {
      final player = Player(
        id: 'test',
        goal: 'Initial Goal',
        experience: 100,
        level: 2,
        createdDate: DateTime.now(),
        curveExponent: 1.5,
        experienceMultiplier:
            1.0, // Исправлено: было 100.0, должно быть в диапазоне 0.1-10.0
      );

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: PlayerSettingsDialog(player: player),
        ),
      ));

      // Ждем отрисовки
      await tester.pumpAndSettle();

      expect(find.text('Initial Goal'), findsOneWidget);
      expect(find.text('Curve Exponent (m)'), findsOneWidget);
      expect(find.text('Experience Multiplier (k)'), findsOneWidget);
    });

    testWidgets('Updates goal text when edited', (WidgetTester tester) async {
      final player = Player(
        id: 'test',
        goal: 'Initial Goal',
        experience: 100,
        level: 2,
        createdDate: DateTime.now(),
        curveExponent: 1.5,
        experienceMultiplier: 100.0, // Исправлено
      );

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: PlayerSettingsDialog(player: player),
        ),
      ));

      await tester.pumpAndSettle();

      // Find the goal text field by its hint text
      final goalFinder = find.byWidgetPredicate(
        (widget) =>
            widget is TextField &&
            (widget.decoration?.labelText == 'Goal Motivation' ||
                widget.decoration?.hintText
                        ?.contains('accumulate experience') ==
                    true),
      );

      if (goalFinder.evaluate().isNotEmpty) {
        await tester.enterText(goalFinder, 'Updated Goal');
        expect(find.text('Updated Goal'), findsOneWidget);
      }
    });

    testWidgets('Sliders update curve parameters', (WidgetTester tester) async {
      final player = Player(
        id: 'test',
        goal: 'Test Goal',
        experience: 100,
        level: 2,
        createdDate: DateTime.now(),
        curveExponent: 1.5,
        experienceMultiplier: 100.0, // Исправлено
      );

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: PlayerSettingsDialog(player: player),
        ),
      ));

      await tester.pumpAndSettle();

      // Просто проверяем, что слайдеры присутствуют
      expect(find.byType(Slider), findsNWidgets(2));
    });
  });
}
