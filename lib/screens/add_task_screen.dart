import 'package:flutter/material.dart';
import 'package:habit_to_do_some_level_up/extensions/localization_extension.dart';
import 'package:habit_to_do_some_level_up/styles.dart';
import '../widgets/task_form.dart';
import '../models/task.dart';

class AddTaskScreen extends StatelessWidget {
  final Task? task; // Для редактирования

  const AddTaskScreen({super.key, this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(task != null ? context.l10n.editTask : context.l10n.addTask),
        backgroundColor: Styles.taskAccentColor,
      ),
      body: TaskForm(task: task),
    );
  }
}
