import 'package:flutter/material.dart';
import '../widgets/task_form.dart';
import '../models/task.dart';

class AddTaskScreen extends StatelessWidget {
  final Task? task; // Для редактирования

  const AddTaskScreen({super.key, this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(task != null ? 'Edit Task' : 'Add New Task'),
        backgroundColor: Colors.orange,
      ),
      body: TaskForm(task: task),
    );
  }
}
