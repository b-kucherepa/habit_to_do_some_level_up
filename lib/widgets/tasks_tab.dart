import 'package:flutter/material.dart';
import 'package:todo_rpg_app/extensions/localization_extension.dart';
import 'package:todo_rpg_app/services/experience_service.dart';
import 'package:todo_rpg_app/styles.dart';
import '../screens/add_task_screen.dart';
import '../services/hive_service.dart';
import '../models/task.dart';

class TasksTab extends StatelessWidget {
  final Function(Task, bool) onTaskToggle;
  final Function(Task) onTaskDelete;
  final HiveService _hiveService = HiveService();
  final ExperienceService experienceService;

  TasksTab({
    super.key,
    required this.onTaskToggle,
    required this.onTaskDelete,
    required this.experienceService,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _hiveService.tasksBox.watch(),
      builder: (context, snapshot) {
        final tasks = _hiveService.getTasks();

        if (tasks.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Styles.tasksTabLargeIcon,
                SizedBox(height: Styles.gap['large']),
                Text(context.l10n.tasksTabEmptyTitle),
                SizedBox(height: Styles.gap['small']),
                Text(
                  context.l10n.tasksTabEmptySubtitle,
                  style: Styles.habitsEmptyHint,
                ),
              ],
            ),
          );
        }

        final pendingTasks = tasks.where((task) => !task.completed).toList();
        final completedTasks = tasks.where((task) => task.completed).toList();

        return Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.all(Styles.gap['large'] ?? Styles.fallbackGap),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildTaskStat(
                      context.l10n.tasksTabTotal,
                      tasks.length,
                      Styles.taskStatLabelTotalColor,
                      Styles.taskStatLabelTotalFont),
                  _buildTaskStat(
                      context.l10n.tasksTabPending,
                      pendingTasks.length,
                      Styles.taskStatLabelPendingColor,
                      Styles.taskStatLabelPendingFont),
                  _buildTaskStat(
                      context.l10n.tasksTabDone,
                      completedTasks.length,
                      Styles.taskStatLabelDoneColor,
                      Styles.taskStatLabelDoneFont),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding:
                    EdgeInsets.all(Styles.gap['large'] ?? Styles.fallbackGap),
                children: [
                  if (pendingTasks.isNotEmpty) ...[
                    Text(
                      context.l10n.tasksTabPendingHeader(pendingTasks.length),
                      style: Styles.tasksCompletedPendingFont,
                    ),
                    SizedBox(height: Styles.gap['small']),
                    ...pendingTasks
                        .map((task) => _buildTaskItem(task, context)),
                    SizedBox(height: Styles.gap['large']),
                  ],
                  if (completedTasks.isNotEmpty) ...[
                    Text(
                        context.l10n
                            .tasksTabCompletedHeader(completedTasks.length),
                        style: Styles.tasksCompletedHeaderFont),
                    SizedBox(height: Styles.gap['small']),
                    ...completedTasks
                        .map((task) => _buildTaskItem(task, context)),
                  ],
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTaskItem(Task task, BuildContext context) {
    return Card(
      margin:
          EdgeInsets.only(bottom: Styles.gap['small'] ?? Styles.fallbackGap),
      color: task.completed
          ? Styles.taskCompletedBackColor
          : Styles.taskUncompletedBackColor,
      child: ListTile(
        leading: Checkbox(
          value: task.completed,
          onChanged: (value) {
            onTaskToggle(task, value ?? false);
          },
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
            SizedBox(height: Styles.gap['tiny']),
            Row(
              children: [
                Styles.entryExperienceIcon,
                SizedBox(width: Styles.gap['tiny']),
                Text(context.l10n.tasksTabExperience(task.experience)),
                SizedBox(width: Styles.gap['medium'] ?? Styles.fallbackGap),
                Styles.taskStateIcon[task.primaryState] ?? Styles.fallbackIcon,
                SizedBox(width: Styles.gap['tiny']),
                Text(
                  _formatDueDate(context, task.dueDate),
                  style: Styles.taskStateFont[task.primaryState],
                ),
                SizedBox(width: Styles.gap['medium'] ?? Styles.fallbackGap),
                _buildPriorityBadge(task.priority),
              ],
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildCategoryChip(context, task.category),
            SizedBox(width: Styles.gap['small']),
            IconButton(
              icon: Styles.editEntryIcon,
              onPressed: () => _editTask(context, task),
              tooltip: context.l10n.tasksTabEditTooltip,
            ),
            IconButton(
              icon: Styles.deleteEntryIcon,
              onPressed: () =>
                  _showDeleteConfirmation(task, task.completed, context),
              tooltip: context.l10n.tasksTabDeleteTooltip,
            ),
          ],
        ),
      ),
    );
  }

  void _editTask(BuildContext context, Task task) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddTaskScreen(task: task),
      ),
    );
  }

  Future<void> _showDeleteConfirmation(
      Task task, bool isCompleted, BuildContext context) async {
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
              if (isCompleted)
                Padding(
                  padding: EdgeInsets.only(
                      top: Styles.gap['small'] ?? Styles.fallbackGap),
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
      onTaskDelete(task);
    }
  }

  Widget _buildTaskStat(
      String label, int count, Color color, TextStyle textStyle) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(Styles.gap['medium'] ?? Styles.fallbackGap),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            shape: BoxShape.circle,
            border: Border.all(color: color.withValues(alpha: 0.3)),
          ),
          child: Text(
            count.toString(),
            style: textStyle,
          ),
        ),
        SizedBox(height: Styles.gap['tiny']),
        Text(label, style: Styles.taskStatLabelDesctiptionFont),
      ],
    );
  }

  Widget _buildPriorityBadge(int priority) {
    Color color = Styles.taskPriorityColor[priority] ?? Styles.fallbackColor;
    String text = 'P$priority';

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Styles.gap['small'] ?? Styles.fallbackGap,
          vertical: Styles.gap['tiny'] ?? Styles.fallbackGap),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(
            Styles.radius['small'] ?? Styles.fallbackRadius),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        text,
        style: Styles.taskPriorityFont[priority],
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
}
