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
      borderOnForeground: true,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(Styles.entryCardRadius), // Радиус скругления
      ),
      shadowColor: Styles.shadowColor.withValues(alpha: 0.5),
      margin: EdgeInsets.only(bottom: Styles.getGap('S')),
      color: backgroundColor ??
          (isCompleted
              ? Styles.entryCompletedBackColor
              : Styles.entryUncompletedBackColor),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Левая колонка: Counter на фоне karma цвета
            _buildLeftCounterColumn(isDueToday),

            // Средняя часть: контент
            Expanded(
              child: _buildContentColumn(context, isDueToday),
            ),

            // Правая колонка: действия
            _buildRightActionsColumn(context),
          ],
        ),
      ),
    );
  }

  Widget _buildLeftCounterColumn(bool isDueToday) {
    return Container(
      width: Styles.entryCardSidesWidth,
      decoration: BoxDecoration(
        color: habit.karmaColor,
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(Styles.entryCardRadius),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Верхняя кнопка: +
          IconButton(
            icon: Styles.habitCounterIncreaseIcon,
            onPressed: isEditable && isDueToday ? onIncrement : null,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
          ),

          // Счетчик
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: Styles.getGap('M'), vertical: Styles.getGap('M')),
            decoration: BoxDecoration(
              color: Styles.habitCounterBackColor,
              borderRadius: BorderRadius.circular(Styles.entryCardRadius),
            ),
            child: Text(
              '$currentCount',
              style: isDueToday
                  ? Styles.counterActiveFont
                  : Styles.counterInactiveFont,
              textAlign: TextAlign.center,
            ),
          ),

          // Нижняя кнопка: -
          IconButton(
            icon: Styles.habitCounterDecreaseIcon,
            onPressed: isEditable && isDueToday && currentCount > 0
                ? onDecrement
                : null,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
          ),
        ],
      ),
    );
  }

  Widget _buildContentColumn(BuildContext context, bool isDueToday) {
    final titleStyle = _getTitleStyle(isDueToday);

    return Padding(
      padding: EdgeInsets.all(Styles.getGap('M')),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Первый ряд: название привычки
          Text(
            habit.title,
            style: titleStyle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          // Второй ряд: описание (если есть)
          if (habit.description.isNotEmpty) ...[
            SizedBox(height: Styles.getGap('S')),
            Text(
              habit.description,
              style: Styles.entryDescriptionFont,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],

          // Третий ряд: exp, min
          SizedBox(height: Styles.getGap('S')),
          _buildMetaInfoRow(context),

          SizedBox(height: Styles.getGap('S')),
          _buildRepeatRow(context),
        ],
      ),
    );
  }

  Widget _buildMetaInfoRow(BuildContext context) {
    return Row(
      children: [
        // Experience
        Styles.entryExperienceIcon,
        SizedBox(width: Styles.getGap('XS')),
        Text(
          context.l10n.habitItemExperience(habit.experience),
          style: Styles.entrySubtextFont,
        ),

        SizedBox(width: Styles.getGap('M')),

        // Minimum completion
        Styles.habitCompletionMinIcon,
        SizedBox(width: Styles.getGap('XS')),
        Text(
          context.l10n.habitItemMinCompletion(habit.minCompletionCount),
          style: Styles.entrySubtextFont,
        ),
      ],
    );
  }

  Widget _buildRepeatRow(BuildContext context) {
    return Row(
      children: [
        if (showScheduleInfo) ...[
          _buildScheduleBadge(context),
        ],
      ],
    );
  }

  Widget _buildRightActionsColumn(BuildContext context) {
    return Container(
      width: Styles.entryCardSidesWidth,
      decoration: BoxDecoration(
        color: Styles.shadowColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(Styles.entryCardRadius),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Верхняя кнопка: Edit
          if (onEdit != null) ...[
            IconButton(
              icon: Styles.editEntryIcon,
              onPressed: onEdit,
              tooltip: context.l10n.habitItemEditTooltip,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
            ),
          ],

          // Нижняя кнопка: Delete
          if (onDelete != null) ...[
            IconButton(
              icon: Styles.deleteEntryIcon,
              onPressed: () => _showDeleteConfirmation(context),
              tooltip: context.l10n.habitItemDeleteTooltip,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildScheduleBadge(BuildContext context) {
    final color = Styles.getHabitScheduleColor(habit.scheduleType);
    final icon = Styles.getHabitScheduleIcon(habit.scheduleType);
    final textStyle = Styles.getHabitScheduleFont(habit.scheduleType);
    final text = switch (habit.scheduleType) {
      'daily' => context.l10n.habitItemScheduleDaily,
      'weekly' => context.l10n.habitItemScheduleWeekly,
      'monthly' => context.l10n.habitItemScheduleMonthly,
      'custom' => context.l10n.habitItemScheduleCustom,
      _ => habit.scheduleType,
    };

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Styles.getGap('S'),
        vertical: Styles.getGap('XXS'),
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(Styles.getRadius('M')),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          SizedBox(width: Styles.getGap('XS')),
          Text(text, style: textStyle),
        ],
      ),
    );
  }

  TextStyle _getTitleStyle(bool isDueToday) {
    if (habit.isCompletedToday) {
      return Styles.entryCompletedFont;
    } else if (isDueToday) {
      return Styles.entryUncompletedFont;
    } else {
      return Styles.entryInactiveFont;
    }
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
                    padding: EdgeInsets.only(top: Styles.getGap('S')),
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
              ),
            ],
          );
        },
      );
    }
  }
}
