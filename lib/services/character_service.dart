// character_service.dart
import 'package:flutter/material.dart';
import 'package:todo_rpg_app/extensions/localization_extension.dart';
import 'package:todo_rpg_app/models/character.dart';
import 'hive_service.dart';

class CharacterService {
  final HiveService _hiveService;
  bool _isInitialized = false;

  CharacterService(this._hiveService);

  Future<void> ensureCharacterInitialized(BuildContext context) async {
    if (_isInitialized) return;

    final characters = _hiveService.getCharacters();
    if (characters.isEmpty) {
      final character = Character(
        id: Character.defaultId,
        goal: context.l10n.defaultGoal,
        createdDate: DateTime.now(),
        curveExponent: Character.defaultCurveExponent,
        experienceMultiplier: Character.defaultExperienceMultiplier,
      );
      _hiveService.charactersBox.add(character);
    }
    _isInitialized = true;
  }
}
