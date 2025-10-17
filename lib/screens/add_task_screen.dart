import 'package:flutter/material.dart';
import '../widgets/task_form.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Task'),
        backgroundColor: Colors.orange,
      ),
      body: TaskForm(),
    );
  }
}