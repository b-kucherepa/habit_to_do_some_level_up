import 'package:flutter_test/flutter_test.dart';
import 'package:todo_rpg_app/models/character.dart';

void main() {
  late Character character;

  setUp(() {
    character = Character(
      id: 'test-char',
      goal: 'Test Goal',
      experience: 0,
      level: 1,
      createdDate: DateTime.now(),
      curveExponent: 1.5,
      experienceMultiplier: 100.0,
    );
  });

  group('Character Model Tests', () {
    test('Character initializes with correct default values', () {
      expect(character.id, 'test-char');
      expect(character.goal, 'Test Goal');
      expect(character.experience, 0);
      expect(character.level, 1);
      expect(character.curveExponent, 1.5);
      expect(character.experienceMultiplier, 100.0);
    });

    test('Add experience increases experience and updates level', () {
      character.addExperience(50);
      expect(character.experience, 50);

      // With default curve, level should still be 1
      expect(character.level, 1);

      character.addExperience(100);
      expect(character.experience, 150);
    });

    test('Remove experience decreases experience but not below zero', () {
      character.addExperience(100);
      character.removeExperience(50);
      expect(character.experience, 50);

      character.removeExperience(100);
      expect(character.experience, 0);
    });

    test('Level calculation with different curve exponents', () {
      // Test with linear curve
      character.updateCurveParameters(1.0, 100.0);
      character.addExperience(100);
      expect(character.level, 2);

      // Test with quadratic curve
      character.updateCurveParameters(2.0, 100.0);
      character.experience = 400; // 100 * (2^2)
      character.updateLevel();
      expect(character.level, 3);
    });

    test('Experience to next level calculation', () {
      character.updateCurveParameters(1.0, 100.0);
      expect(character.experienceToNextLevel, 100);

      character.addExperience(50);
      expect(character.experienceToNextLevel, 50);

      character.addExperience(50);
      expect(character.experienceToNextLevel, 100); // Next level
    });

    test('Level progress calculation', () {
      character.updateCurveParameters(1.0, 100.0);
      expect(character.levelProgress, 0.0);

      character.addExperience(50);
      expect(character.levelProgress, 0.5);

      character.addExperience(50);
      expect(character.levelProgress, 0.0); // Level up, progress resets
      expect(character.level, 2);
    });

    test('Get experience for target level', () {
      character.updateCurveParameters(1.0, 100.0);
      expect(character.getExperienceForLevel(2), 100);
      expect(character.getExperienceForLevel(3), 200);
      expect(character.getExperienceForLevel(1), 0);
    });

    test('Level up detection', () {
      // We can't directly test print, but we can test the level change
      final oldLevel = character.level;
      character.addExperience(1000); // Enough to level up multiple times

      expect(character.level, greaterThan(oldLevel));
    });
  });
}
