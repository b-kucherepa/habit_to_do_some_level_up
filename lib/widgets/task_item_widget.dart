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
    return Card(
      margin: EdgeInsets.only(bottom: Styles.getGap('S')),
      color: backgroundColor ??
          (task.completed
              ? Styles.entryCompletedBackColor
              : Styles.entryUncompletedBackColor),
      child: ListTile(
        leading: Checkbox(
          value: task.completed,
          onChanged: isEditable
              ? (value) {
                  onToggle(task, value ?? false);
                }
              : null,
        ),
        title: Text(
          task.title,
          style: task.completed
              ? Styles.entryCompletedFont
              : Styles.entryUncompletedFont,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (task.description.isNotEmpty) Text(task.description),
            SizedBox(height: Styles.getGap('XS')),
            Row(
              children: [
                Styles.entryExperienceIcon,
                SizedBox(width: Styles.getGap('XS')),
                Text(context.l10n.tasksTabExperience(task.experience)),
                SizedBox(width: Styles.getGap('M')),
                Styles.getTaskStateIcon(task.primaryState),
                SizedBox(width: Styles.getGap('XS')),
                Text(
                  _formatDueDate(context, task.dueDate),
                  style: Styles.getTaskStateFont(task.primaryState),
                ),
                SizedBox(width: Styles.getGap('M')),
                _buildPriorityBadge(task.priority),
              ],
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildCategoryChip(context, task.category),
            SizedBox(width: Styles.getGap('S')),
            if (onEdit != null) ...[
              IconButton(
                icon: Styles.editEntryIcon,
                onPressed: onEdit,
                tooltip: context.l10n.tasksTabEditTooltip,
              ),
            ],
            if (onDelete != null) ...[
              IconButton(
                icon: Styles.deleteEntryIcon,
                onPressed: () => _showDeleteConfirmation(context, task),
                tooltip: context.l10n.tasksTabDeleteTooltip,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildPriorityBadge(int priority) {
    Color color = Styles.getTaskPriorityColor(priority);
    String text = 'P$priority';

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Styles.getGap('S'), vertical: Styles.getGap('S')),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(Styles.getRadius('S')),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        text,
        style: Styles.getTaskPriorityFont(priority),
      ),
    );
  }

  Widget _buildCategoryChip(BuildContext context, String category) {
    return Chip(
      label: Text(
        _getLocalizedCategory(context, category),
        style: Styles.taskCategory,
      ),
      backgroundColor: Styles.taskCategoryBackColor.withValues(alpha: 0.1),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
              child: Text(context.l10n.tasksTabDeleteConfirmationDelete,
                  style: Styles.entryDeleteConfirmationButtonFont),
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
