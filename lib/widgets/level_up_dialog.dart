import 'package:flutter/material.dart';
import 'package:habit_to_do_some_level_up/extensions/localization_extension.dart';
import 'package:habit_to_do_some_level_up/services/hive_service.dart';
import 'package:habit_to_do_some_level_up/styles.dart';

class LevelUpDialog extends StatelessWidget {
  final HiveService _hiveService = HiveService();
  final int newLevel;

  LevelUpDialog({super.key, required this.newLevel});

  @override
  Widget build(BuildContext context) {
    final goal = _hiveService.getPlayer().goal;

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Styles.getGap('XL')),
      ),
      backgroundColor: Styles.levelUpBackColor,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Styles.levelUpLargeIcon,
          SizedBox(height: Styles.getGap('L')),
          Text(
            context.l10n.congratulations,
            style: Styles.levelUpDetails,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: Styles.getGap('L')),
          Container(
            padding: EdgeInsets.all(Styles.getGap('L')),
            decoration: BoxDecoration(
              color: Styles.levelUpLabelBackColor,
              borderRadius: BorderRadius.circular(Styles.getRadius('L')),
              border: Border.all(
                  color: Styles.levelUpBackColor, width: Styles.getGap('XS')),
            ),
            child: Text(
              context.l10n.levelReached(newLevel),
              style: Styles.levelUpLabel,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: Styles.getGap('L')),
          Text(
            context.l10n.dontForgetToUseAchievenents(goal),
            style: Styles.levelUpDetails,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: Styles.getGap('XL')),
          ElevatedButton.icon(
            onPressed: () => Navigator.of(context).pop(),
            icon: Styles.levelUpButtonIcon,
            label: Text(context.l10n.continueButton),
            style: ElevatedButton.styleFrom(
              backgroundColor: Styles.levelUpButtonBackColor,
              foregroundColor: Styles.levelUpButtonFontColor,
              padding: EdgeInsets.symmetric(
                  horizontal: Styles.getGap('XL'),
                  vertical: Styles.getGap('M')),
            ),
          ),
        ],
      ),
    );
  }
}
