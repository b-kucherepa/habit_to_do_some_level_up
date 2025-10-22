import 'package:flutter/material.dart';
import 'package:todo_rpg_app/extensions/localization_extension.dart';
import 'package:todo_rpg_app/styles.dart';
import '../models/habit.dart';

class HabitItemWidget extends StatelessWidget {
  final Habit habit;
  final int currentCount;
  final bool isEditable;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;
  final bool showScheduleInfo;
  final bool showKarmaIndicator;
  final Color? backgroundColor;

  const HabitItemWidget({
    super.key,
    required this.habit,
    required this.currentCount,
    required this.isEditable,
    this.onIncrement,
    this.onDecrement,
    this.onDelete,
    this.onEdit,
    this.showScheduleInfo = true,
    this.showKarmaIndicator = true,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final isCompleted = currentCount >= habit.minCompletionCount;
    final isDueToday = habit.isDueToday();

    return Card(
      shadowColor: habit.karmaColor,
      margin: EdgeInsets.symmetric(vertical: 4),
      color: backgroundColor ??
          (isCompleted
              ? Styles.taskCompletedBackColor
              : Styles.taskUncompletedBackColor),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (showKarmaIndicator) _buildKarmaIndicator(),
            Expanded(
              child: _buildCardContent(context, isDueToday),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardContent(BuildContext context, bool isDueToday) {
    TextStyle titleFontStyle;

    if (habit.isCompletedToday) {
      titleFontStyle = Styles.entryCompletedFont;
    } else if (isDueToday) {
      titleFontStyle = Styles.entryUncompletedFont;
    } else {
      titleFontStyle = Styles.entryInactiveFont;
    }

    return Padding(
      padding: EdgeInsets.all(Styles.gap['large'] ?? Styles.fallbackGap),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Counter controls
          _buildCounterControls(isDueToday),
          SizedBox(width: Styles.gap['large']),
          // Title and subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(habit.title, style: titleFontStyle),
                SizedBox(height: Styles.gap['tiny']),
                _buildSubtitle(context, isDueToday),
              ],
            ),
          ),
          // Trailing actions
          _buildTrailing(context, isDueToday),
        ],
      ),
    );
  }

  Widget _buildCounterControls(bool isDueToday) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Styles.counterDecreaseIcon,
          onPressed:
              isEditable && isDueToday && currentCount > 0 ? onDecrement : null,
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(
              minWidth: Styles.gap['titanict'] ?? Styles.fallbackGap,
              minHeight: Styles.gap['titanict'] ?? Styles.fallbackGap),
        ),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: Styles.gap['large'] ?? Styles.fallbackGap,
              vertical: Styles.gap['tiny'] ?? Styles.fallbackGap),
          decoration: BoxDecoration(
            color: Styles.habitCounterBackColor,
            borderRadius: BorderRadius.circular(
                Styles.radius['large'] ?? Styles.fallbackRadius),
          ),
          child: Text(
            '$currentCount',
            style:
                isDueToday ? Styles.activeCountFont : Styles.inactiveCountFont,
          ),
        ),
        IconButton(
          icon: Styles.counterIncreaseIcon,
          onPressed: isEditable && isDueToday ? onIncrement : null,
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(minWidth: 36, minHeight: 36),
        ),
      ],
    );
  }

  Widget _buildSubtitle(BuildContext context, bool isDueToday) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (habit.description.isNotEmpty)
          Text(
            habit.description,
            style: Styles.habitDescriptionFont,
          ),
        if (habit.description.isNotEmpty) SizedBox(height: Styles.gap['tiny']),
        Row(
          children: [
            Styles.entryExperienceIcon,
            SizedBox(width: Styles.gap['tiny']),
            Text(context.l10n.habitItemExperience(habit.experience),
                style: Styles.entrySubtextFont),
            SizedBox(width: Styles.gap['small']),
            Styles.habitCompletionMinIcon,
            SizedBox(width: Styles.gap['tiny']),
            Text(context.l10n.habitItemMinCompletion(habit.minCompletionCount),
                style: Styles.entrySubtextFont),
            SizedBox(width: Styles.gap['small']),
            if (showScheduleInfo) ...[
              _buildScheduleBadge(context),
            ],
            if (currentCount > 0 && isDueToday) ...[
              SizedBox(width: Styles.gap['large']),
              Text(
                context.l10n.habitItemTodayCount(currentCount),
                style: Styles.habitTodayCountFont,
              ),
            ],
          ],
        ),
      ],
    );
  }

  Widget _buildTrailing(BuildContext context, bool isDueToday) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (!isDueToday)
          Text(
            context.l10n.habitItemNotToday,
            style: Styles.habitNotTodayFont,
          ),
        if (onEdit != null) ...[
          SizedBox(height: Styles.gap['small']),
          IconButton(
            icon: Styles.editEntryIcon,
            onPressed: onEdit,
            tooltip: context.l10n.habitItemEditTooltip,
          ),
        ],
        if (onDelete != null) ...[
          SizedBox(height: Styles.gap['small']),
          IconButton(
            icon: Styles.deleteEntryIcon,
            onPressed: () => _showDeleteConfirmation(context),
            tooltip: context.l10n.habitItemDeleteTooltip,
          ),
        ],
      ],
    );
  }

  Widget _buildScheduleBadge(BuildContext context) {
    Color color =
        Styles.taskScheduleColor[habit.scheduleType] ?? Styles.fallbackColor;
    TextStyle? textStyle = Styles.taskScheduleFont[habit.scheduleType];
    String text = switch (habit.scheduleType) {
      'daily' => context.l10n.habitItemScheduleDaily,
      'weekly' => context.l10n.habitItemScheduleWeekly,
      'monthly' => context.l10n.habitItemScheduleMonthly,
      'custom' => context.l10n.habitItemScheduleCustom,
      _ => habit.scheduleType,
    };

    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: Styles.gap['small'] ?? Styles.fallbackGap,
            vertical: Styles.gap['minimum'] ?? Styles.fallbackGap),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius:
              BorderRadius.circular(Styles.gap['medium'] ?? Styles.fallbackGap),
          border: Border.all(color: color.withValues(alpha: 0.3)),
        ),
        child: Row(children: [
          Styles.habitRepetitionIcon,
          SizedBox(width: Styles.gap['small']),
          Text(
            text,
            style: textStyle,
          ),
        ]));
  }

  Widget _buildKarmaIndicator() {
    return Container(
      width: Styles.gap['tiny'],
      margin: EdgeInsets.only(right: Styles.gap['small'] ?? Styles.fallbackGap),
      decoration: BoxDecoration(
        color: habit.karmaColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Styles.gap['tiny'] ?? Styles.fallbackGap),
          bottomLeft: Radius.circular(Styles.gap['tiny'] ?? Styles.fallbackGap),
        ),
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context) {
    if (onDelete != null) {
      final xpAmount = habit.experience * currentCount;

      showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: Text(context.l10n.habitItemDeleteConfirmationTitle),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(context.l10n
                    .habitItemDeleteConfirmationMessage(habit.title)),
                if (currentCount > 0)
                  Padding(
                    padding: EdgeInsets.only(
                        top: Styles.gap['small'] ?? Styles.fallbackGap),
                    child: Text(
                      context.l10n.habitItemDeleteConfirmationWarning(xpAmount),
                      style: Styles.entryDeleteConfirmationMessageFont,
                    ),
                  ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: Text(context.l10n.habitItemDeleteConfirmationCancel),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                  onDelete!();
                },
                child: Text(
                  context.l10n.habitItemDeleteConfirmationDelete,
                  style: Styles.entryDeleteConfirmationButtonFont,
                ),
              )
            ],
          );
        },
      );
    }
  }
}
