// player_service.dart
import 'package:flutter/material.dart';
import 'package:todo_rpg_app/extensions/localization_extension.dart';
import 'package:todo_rpg_app/models/player.dart';
import 'hive_service.dart';

class PlayerService {
  final HiveService _hiveService;
  bool _isInitialized = false;

  PlayerService(this._hiveService);

  Future<void> ensurePlayerInitialized(BuildContext context) async {
    if (_isInitialized) return;

    final players = _hiveService.getPlayers();
    if (players.isEmpty) {
      final player = Player(
        id: Player.defaultId,
        goal: context.l10n.defaultGoal,
        createdDate: DateTime.now(),
        curveExponent: Player.defaultCurveExponent,
        experienceMultiplier: Player.defaultExperienceMultiplier,
      );
      _hiveService.playersBox.add(player);
    }
    _isInitialized = true;
  }
}
