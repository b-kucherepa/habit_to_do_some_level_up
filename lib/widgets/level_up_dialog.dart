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
    final _goal = _hiveService.getFirstCharacter().goal;

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Styles.giantRadius),
      ),
      backgroundColor: Styles.levelUpBorderColor,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Styles.levelUpLargeIcon,
          SizedBox(height: Styles.largeGap),
          Text(
            context.l10n.congratulations,
            style: Styles.levelUpDetails,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: Styles.largeGap),
          Container(
            padding: EdgeInsets.all(Styles.largeGap),
            decoration: BoxDecoration(
              color: Styles.levelUpLabelBackColor,
              borderRadius: BorderRadius.circular(Styles.largeRadius),
              border: Border.all(
                  color: Styles.levelUpBorderColor, width: Styles.tinyBorder),
            ),
            child: Text(
              context.l10n.levelReached(newLevel),
              style: Styles.levelUpLabel,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: Styles.largeGap),
          Text(
            context.l10n.dontForgetToUseAchievenents(_goal),
            style: Styles.levelUpDetails,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: Styles.giantGap),
          ElevatedButton.icon(
            onPressed: () => Navigator.of(context).pop(),
            icon: Styles.levelUpButtonIcon,
            label: Text(context.l10n.continueButton),
            style: ElevatedButton.styleFrom(
              backgroundColor: Styles.levelUpAccentColor,
              foregroundColor: Styles.levelUpButtonFontColor,
              padding: EdgeInsets.symmetric(
                  horizontal: Styles.giantGap, vertical: Styles.mediumGap),
            ),
          ),
        ],
      ),
    );
  }
}
