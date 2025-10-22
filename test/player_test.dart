import 'package:flutter_test/flutter_test.dart';
import 'package:habit_to_do_some_level_up/models/player.dart';

void main() {
  late Player player;

  setUp(() {
    player = Player(
      id: 'test-char',
      goal: 'Test Goal',
      experience: 0,
      level: 1,
      createdDate: DateTime.now(),
      curveExponent: 1.5,
      experienceMultiplier: 100.0,
    );
  });

  group('Player Model Tests', () {
    test('Player initializes with correct default values', () {
      expect(player.id, 'test-char');
      expect(player.goal, 'Test Goal');
      expect(player.experience, 0);
      expect(player.level, 1);
      expect(player.curveExponent, 1.5);
      expect(player.experienceMultiplier, 100.0);
    });

    test('Add experience increases experience and updates level', () {
      player.addExperience(50);
      expect(player.experience, 50);

      // With default curve, level should still be 1
      expect(player.level, 1);

      player.addExperience(100);
      expect(player.experience, 150);
    });

    test('Remove experience decreases experience but not below zero', () {
      player.addExperience(100);
      player.removeExperience(50);
      expect(player.experience, 50);

      player.removeExperience(100);
      expect(player.experience, 0);
    });

    test('Level calculation with different curve exponents', () {
      // Test with linear curve
      player.updateCurveParameters(1.0, 100.0);
      player.addExperience(100);
      expect(player.level, 2);

      // Test with quadratic curve
      player.updateCurveParameters(2.0, 100.0);
      player.experience = 400; // 100 * (2^2)
      player.updateLevel();
      expect(player.level, 3);
    });

    test('Experience to next level calculation', () {
      player.updateCurveParameters(1.0, 100.0);
      expect(player.experienceToNextLevel, 100);

      player.addExperience(50);
      expect(player.experienceToNextLevel, 50);

      player.addExperience(50);
      expect(player.experienceToNextLevel, 100); // Next level
    });

    test('Level progress calculation', () {
      player.updateCurveParameters(1.0, 100.0);
      expect(player.levelProgress, 0.0);

      player.addExperience(50);
      expect(player.levelProgress, 0.5);

      player.addExperience(50);
      expect(player.levelProgress, 0.0); // Level up, progress resets
      expect(player.level, 2);
    });

    test('Get experience for target level', () {
      player.updateCurveParameters(1.0, 100.0);
      expect(player.getExperienceForLevel(2), 100);
      expect(player.getExperienceForLevel(3), 200);
      expect(player.getExperienceForLevel(1), 0);
    });

    test('Level up detection', () {
      // We can't directly test print, but we can test the level change
      final oldLevel = player.level;
      player.addExperience(1000); // Enough to level up multiple times

      expect(player.level, greaterThan(oldLevel));
    });
  });
}
