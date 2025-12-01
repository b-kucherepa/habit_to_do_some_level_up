import 'package:flutter/material.dart';
import 'package:habit_to_do_some_level_up/extensions/localization_extension.dart';
import 'package:habit_to_do_some_level_up/services/experience_service.dart';
import 'package:habit_to_do_some_level_up/styles.dart';
import '../screens/add_task_screen.dart';
import '../services/hive_service.dart';
import '../models/task.dart';
import '../widgets/task_item_widget.dart';

class TasksTab extends StatefulWidget {
  final Function(Task, bool) onTaskToggle;
  final Function(Task) onTaskDelete;
  final ExperienceService experienceService;

  const TasksTab({
    super.key,
    required this.onTaskToggle,
    required this.onTaskDelete,
    required this.experienceService,
  });

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  final HiveService _hiveService = HiveService();
  bool _isCompletedTasksExpanded = false;

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
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(Styles.getGap('L')),
                children: [
                  if (pendingTasks.isNotEmpty) ...[
                    ...pendingTasks
                        .map((task) => _buildTaskItem(task, context)),
                  ],
                  if (completedTasks.isNotEmpty) ...[
                    ExpansionTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      initiallyExpanded: _isCompletedTasksExpanded,
                      shape: Border.all(style: BorderStyle.none),
                      collapsedShape: Border.all(style: BorderStyle.none),
                      backgroundColor: Styles.fargroundColor,
                      collapsedBackgroundColor: Styles.fargroundColor,
                      title: Text(
                        context.l10n.tasksTabCompletedHeader,
                        style: Styles.entryExpansionTileHeaderFont,
                      ),
                      textColor: Styles.taskAccentColor,
                      collapsedTextColor: Styles.taskFormBorderColor,
                      iconColor: Styles.taskAccentColor,
                      collapsedIconColor: Styles.taskFormBorderColor,
                      children: [
                        ...completedTasks
                            .map((task) => _buildTaskItem(task, context)),
                      ],
                      onExpansionChanged: (value) {
                        setState(() {
                          _isCompletedTasksExpanded = value;
                        });
                      },
                    ),
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
      onToggle: widget.onTaskToggle,
      onDelete: () => widget.onTaskDelete(task),
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
}
