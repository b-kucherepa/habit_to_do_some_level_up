import 'package:flutter/material.dart';
import 'package:todo_rpg_app/extensions/localization_extension.dart';
import 'package:todo_rpg_app/services/hive_service.dart';
import 'package:todo_rpg_app/styles.dart';

class LevelUpDialog extends StatelessWidget {
  final HiveService _hiveService = HiveService();
  final int newLevel;

  LevelUpDialog({super.key, required this.newLevel});

  @override
  Widget build(BuildContext context) {
    final goal = _hiveService.getFirstPlayer().goal;

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(Styles.gap['giant'] ?? Styles.fallbackGap),
      ),
      backgroundColor: Styles.levelUpBorderColor,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Styles.levelUpLargeIcon,
          SizedBox(height: Styles.gap['large']),
          Text(
            context.l10n.congratulations,
            style: Styles.levelUpDetails,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: Styles.gap['large']),
          Container(
            padding: EdgeInsets.all(Styles.gap['large'] ?? Styles.fallbackGap),
            decoration: BoxDecoration(
              color: Styles.levelUpLabelBackColor,
              borderRadius: BorderRadius.circular(
                  Styles.gap['large'] ?? Styles.fallbackGap),
              border: Border.all(
                  color: Styles.levelUpBorderColor,
                  width: Styles.border['tiny'] ?? Styles.fallbackGap),
            ),
            child: Text(
              context.l10n.levelReached(newLevel),
              style: Styles.levelUpLabel,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: Styles.gap['large']),
          Text(
            context.l10n.dontForgetToUseAchievenents(goal),
            style: Styles.levelUpDetails,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: Styles.gap['giant']),
          ElevatedButton.icon(
            onPressed: () => Navigator.of(context).pop(),
            icon: Styles.levelUpButtonIcon,
            label: Text(context.l10n.continueButton),
            style: ElevatedButton.styleFrom(
              backgroundColor: Styles.levelUpAccentColor,
              foregroundColor: Styles.levelUpButtonFontColor,
              padding: EdgeInsets.symmetric(
                  horizontal: Styles.gap['giant'] ?? Styles.fallbackGap,
                  vertical: Styles.gap['medium'] ?? Styles.fallbackGap),
            ),
          ),
        ],
      ),
    );
  }
}
