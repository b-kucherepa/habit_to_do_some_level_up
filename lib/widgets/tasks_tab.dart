import 'package:flutter/material.dart';
import 'package:todo_rpg_app/extensions/localization_extension.dart';
import 'package:todo_rpg_app/services/experience_service.dart';
import 'package:todo_rpg_app/styles.dart';
import '../screens/add_task_screen.dart';
import '../services/hive_service.dart';
import '../models/task.dart';
import '../widgets/task_item_widget.dart';

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
                SizedBox(height: Styles.getGap('L')),
                Text(context.l10n.tasksTabEmptyTitle),
                SizedBox(height: Styles.getGap('S')),
                Text(
                  context.l10n.tasksTabEmptySubtitle,
                  style: Styles.habitsEmptyHint,
                  textAlign: TextAlign.center,
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
              padding: EdgeInsets.all(Styles.getGap('L')),
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
                padding: EdgeInsets.all(Styles.getGap('L')),
                children: [
                  if (pendingTasks.isNotEmpty) ...[
                    Text(
                      context.l10n.tasksTabPendingHeader(pendingTasks.length),
                      style: Styles.tasksCompletedPendingFont,
                    ),
                    SizedBox(height: Styles.getGap('S')),
                    ...pendingTasks
                        .map((task) => _buildTaskItem(task, context)),
                    SizedBox(height: Styles.getGap('L')),
                  ],
                  if (completedTasks.isNotEmpty) ...[
                    Text(
                        context.l10n
                            .tasksTabCompletedHeader(completedTasks.length),
                        style: Styles.tasksCompletedHeaderFont),
                    SizedBox(height: Styles.getGap('S')),
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
    return TaskItemWidget(
      task: task,
      isEditable: true,
      onToggle: onTaskToggle,
      onDelete: () => onTaskDelete(task),
      onEdit: () => _editTask(context, task),
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

  Widget _buildTaskStat(
      String label, int count, Color color, TextStyle textStyle) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(Styles.getGap('L')),
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
        Text(label, style: Styles.taskStatLabelDescriptionFont),
      ],
    );
  }
}
