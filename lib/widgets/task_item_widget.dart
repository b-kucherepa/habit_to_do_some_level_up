import 'package:flutter/material.dart';
import 'package:todo_rpg_app/extensions/localization_extension.dart';
import 'package:todo_rpg_app/styles.dart';
import '../models/task.dart';

class TaskItemWidget extends StatelessWidget {
  final Task task;
  final bool isEditable;
  final Function(Task, bool) onToggle;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;
  final Color? backgroundColor;

  const TaskItemWidget({
    super.key,
    required this.task,
    required this.isEditable,
    required this.onToggle,
    this.onDelete,
    this.onEdit,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final priorityColor = Styles.getTaskPriorityColor(task.priority);

    return Card(
      borderOnForeground: true,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(Styles.entryCardRadius), // Радиус скругления
      ),
      shadowColor: Styles.shadowColor.withValues(alpha: 0.5),
      margin: EdgeInsets.only(bottom: Styles.getGap('S')),
      color: backgroundColor ??
          (task.completed
              ? Styles.entryCompletedBackColor
              : Styles.entryUncompletedBackColor),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Левая колонка: Checkbox на фоне цвета приоритета
            _buildLeftCheckboxColumn(context, priorityColor),

            // Средняя колонка: контент
            Expanded(
              child: _buildContentColumn(context),
            ),

            // Правая колонка: действия
            _buildRightActionsColumn(context),
          ],
        ),
      ),
    );
  }

  Widget _buildLeftCheckboxColumn(BuildContext context, Color priorityColor) {
    return Container(
      width: Styles.entryCardSidesWidth,
      decoration: BoxDecoration(
        color: priorityColor,
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(Styles.entryCardRadius),
        ),
      ),
      child: Center(
        child: Checkbox(
          value: task.completed,
          onChanged: isEditable
              ? (value) {
                  onToggle(task, value ?? false);
                }
              : null,
        ),
      ),
    );
  }

  Widget _buildContentColumn(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Styles.getGap('M')),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Первый ряд: заголовок
          Text(
            task.title,
            style: task.completed
                ? Styles.entryCompletedFont
                : Styles.entryUncompletedFont,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          // Второй ряд: описание (если есть)
          if (task.description.isNotEmpty) ...[
            SizedBox(height: Styles.getGap('S')),
            Text(
              task.description,
              style: Styles.entryDescriptionFont,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],

          SizedBox(height: Styles.getGap('S')),

          // Третий ряд: XP и Due
          _buildThirdRow(context),

          // Четвертый ряд: Category
          if (task.category.isNotEmpty) ...[
            SizedBox(height: Styles.getGap('S')),
            _buildCategoryRow(context),
          ],
        ],
      ),
    );
  }

  Widget _buildThirdRow(BuildContext context) {
    return Row(
      children: [
        // Experience
        Styles.entryExperienceIcon,
        SizedBox(width: Styles.getGap('XS')),
        Text(
          context.l10n.tasksTabExperience(task.experience),
          style: Styles.entrySubtextFont,
        ),

        SizedBox(width: Styles.getGap('M')),

        // Due date
        Styles.getTaskStateIcon(task.primaryState),
        SizedBox(width: Styles.getGap('XS')),
        Text(
          _formatDueDate(context, task.dueDate),
          style: Styles.getTaskStateFont(task.primaryState),
        ),
      ],
    );
  }

  Widget _buildCategoryRow(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: Styles.getGap('S'),
            vertical: Styles.getGap('XS'),
          ),
          decoration: BoxDecoration(
            color: Styles.taskCategoryBackColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(Styles.getRadius('S')),
            border: Border.all(
                color: Styles.taskCategoryBackColor.withOpacity(0.3)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.label_outline,
                size: 16,
                color: Styles.taskCategoryBackColor,
              ),
              SizedBox(width: Styles.getGap('XS')),
              Text(
                _getLocalizedCategory(context, task.category),
                style: Styles.taskCategory,
              ),
            ],
          ),
        ),
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
              tooltip: context.l10n.tasksTabEditTooltip,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
            ),
          ],

          // Нижняя кнопка: Delete
          if (onDelete != null) ...[
            IconButton(
              icon: Styles.deleteEntryIcon,
              onPressed: () => _showDeleteConfirmation(context, task),
              tooltip: context.l10n.tasksTabDeleteTooltip,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
            ),
          ],
        ],
      ),
    );
  }

  String _formatDueDate(BuildContext context, DateTime dueDate) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final due = DateTime(dueDate.year, dueDate.month, dueDate.day);

    final difference = due.difference(today).inDays;

    if (difference == 0) return context.l10n.tasksTabDueToday;
    if (difference == 1) return context.l10n.tasksTabDueTomorrow;
    if (difference == -1) return context.l10n.tasksTabDueYesterday;
    if (difference < 0) {
      return context.l10n.tasksTabDueDaysAgo(difference.abs());
    }
    if (difference < 7) return context.l10n.tasksTabDueInDays(difference);

    return '${dueDate.day}/${dueDate.month}/${dueDate.year}';
  }

  String _getLocalizedCategory(BuildContext context, String category) =>
      switch (category) {
        'work' => context.l10n.taskCategoryWork,
        'personal' => context.l10n.taskCategoryPersonal,
        'health' => context.l10n.taskCategoryHealth,
        'learning' => context.l10n.taskCategoryLearning,
        'other' => context.l10n.taskCategoryOther,
        _ => _capitalizeFirstLetter(category),
      };

  String _capitalizeFirstLetter(String text) {
    return text[0].toUpperCase() + text.substring(1);
  }

  Future<void> _showDeleteConfirmation(BuildContext context, Task task) async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(context.l10n.tasksTabDeleteConfirmationTitle),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(context.l10n.tasksTabDeleteConfirmationMessage(task.title)),
              if (task.completed)
                Padding(
                  padding: EdgeInsets.only(top: Styles.getGap('S')),
                  child: Text(
                    context.l10n
                        .tasksTabDeleteConfirmationWarning(task.experience),
                    style: Styles.entryDeleteConfirmationMessageFont,
                  ),
                ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: Text(context.l10n.tasksTabDeleteConfirmationCancel),
            ),
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              child: Text(
                context.l10n.tasksTabDeleteConfirmationDelete,
                style: Styles.entryDeleteConfirmationButtonFont,
              ),
            ),
          ],
        );
      },
    );

    if (shouldDelete == true) {
      onDelete?.call();
    }
  }
}
