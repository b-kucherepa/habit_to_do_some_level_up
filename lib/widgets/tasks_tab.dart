import 'package:flutter/material.dart';
import '../services/hive_service.dart';
import '../models/task.dart';

class TasksTab extends StatelessWidget {
  final Function(Task, bool) onTaskToggle;
  final Function(Task) onTaskDelete;
  final HiveService _hiveService = HiveService();

  TasksTab({
    super.key,
    required this.onTaskToggle,
    required this.onTaskDelete,
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
                Icon(Icons.task, size: 64, color: Colors.grey),
                SizedBox(height: 16),
                Text('No tasks yet!'),
                SizedBox(height: 8),
                Text('Tap the + button to add your first task',
                    style: TextStyle(color: Colors.grey)),
              ],
            ),
          );
        }

        final pendingTasks = tasks.where((task) => !task.completed).toList();
        final completedTasks = tasks.where((task) => task.completed).toList();

        return Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildTaskStat('Total', tasks.length, Colors.blue),
                  _buildTaskStat('Pending', pendingTasks.length, Colors.orange),
                  _buildTaskStat('Done', completedTasks.length, Colors.green),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16),
                children: [
                  if (pendingTasks.isNotEmpty) ...[
                    Text(
                      'Pending Tasks (${pendingTasks.length})',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    ...pendingTasks
                        .map((task) => _buildTaskItem(task, context)),
                    SizedBox(height: 16),
                  ],
                  if (completedTasks.isNotEmpty) ...[
                    Text(
                      'Completed Tasks (${completedTasks.length})',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                    SizedBox(height: 8),
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
      margin: EdgeInsets.only(bottom: 8),
      color: task.completed ? Colors.green.shade50 : Colors.white,
      child: ListTile(
        leading: Checkbox(
          value: task.completed,
          onChanged: (value) {
            onTaskToggle(task, value ?? false);
          },
        ),
        title: Text(
          task.title,
          style: TextStyle(
            decoration: task.completed
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            fontWeight: task.completed ? FontWeight.normal : FontWeight.w500,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (task.description.isNotEmpty) Text(task.description),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.star, size: 16, color: Colors.amber),
                SizedBox(width: 4),
                Text('${task.experience} XP'),
                SizedBox(width: 12),
                Icon(Icons.calendar_today,
                    size: 16, color: _getDueDateColor(task)),
                SizedBox(width: 4),
                Text(
                  _formatDueDate(task.dueDate),
                  style: TextStyle(color: _getDueDateColor(task)),
                ),
                SizedBox(width: 12),
                _buildPriorityBadge(task.priority),
              ],
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildCategoryChip(task.category),
            SizedBox(width: 8),
            IconButton(
              icon: Icon(Icons.delete_outline, color: Colors.grey),
              onPressed: () =>
                  _showDeleteConfirmation(task, task.completed, context),
              tooltip: 'Delete task',
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showDeleteConfirmation(
      Task task, bool isCompleted, BuildContext context) async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Delete Task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Are you sure you want to delete "${task.title}"?'),
              if (isCompleted)
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Text(
                    '⚠️ This will remove ${task.experience} XP from your character!',
                    style: TextStyle(color: Colors.orange, fontSize: 12),
                  ),
                ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              child: Text('Delete', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );

    if (shouldDelete == true) {
      onTaskDelete(task);
    }
  }

  Widget _buildTaskStat(String label, int count, Color color) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            shape: BoxShape.circle,
            border: Border.all(color: color.withValues(alpha: 0.3)),
          ),
          child: Text(
            count.toString(),
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: color),
          ),
        ),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }

  Widget _buildPriorityBadge(int priority) {
    Color color;
    String text;

    switch (priority) {
      case 1:
        color = Colors.green;
        text = 'P1';
        break;
      case 2:
        color = Colors.blue;
        text = 'P2';
        break;
      case 3:
        color = Colors.orange;
        text = 'P3';
        break;
      case 4:
        color = Colors.red;
        text = 'P4';
        break;
      case 5:
        color = Colors.purple;
        text = 'P5';
        break;
      default:
        color = Colors.grey;
        text = 'P$priority';
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        text,
        style:
            TextStyle(fontSize: 10, color: color, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildCategoryChip(String category) {
    return Chip(
      label: Text(
        _capitalizeFirstLetter(category),
        style: TextStyle(fontSize: 10),
      ),
      backgroundColor: Colors.grey.withValues(alpha: 0.1),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }

  Color _getDueDateColor(Task task) {
    if (task.completed) return Colors.green;
    if (task.isOverdue) return Colors.red;
    if (task.isDueToday) return Colors.orange;
    if (task.isDueSoon) return Colors.blue;
    return Colors.grey;
  }

  String _formatDueDate(DateTime dueDate) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final due = DateTime(dueDate.year, dueDate.month, dueDate.day);

    final difference = due.difference(today).inDays;

    if (difference == 0) return 'Today';
    if (difference == 1) return 'Tomorrow';
    if (difference == -1) return 'Yesterday';
    if (difference < 0) return '${difference.abs()} days ago';
    if (difference < 7) return 'In $difference days';

    return '${dueDate.day}/${dueDate.month}/${dueDate.year}';
  }

  String _capitalizeFirstLetter(String text) {
    return text[0].toUpperCase() + text.substring(1);
  }
}
