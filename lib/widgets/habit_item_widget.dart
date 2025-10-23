import 'package:flutter/material.dart';
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
      shadowColor: habit.karmaColor,
      margin: EdgeInsets.symmetric(vertical: 4),
      color: backgroundColor ??
          (isCompleted ? Colors.green.shade50 : Colors.white),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (showKarmaIndicator) _buildKarmaIndicator(),
            Expanded(
              child: _buildCardContent(context, isDueToday),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardContent(BuildContext context, bool isDueToday) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Counter controls
          _buildCounterControls(isDueToday),
          SizedBox(width: 16),
          // Title and subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  habit.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: isDueToday ? Colors.black : Colors.grey,
                  ),
                ),
                SizedBox(height: 4),
                _buildSubtitle(isDueToday),
              ],
            ),
          ),
          // Trailing actions
          _buildTrailing(context, isDueToday),
        ],
      ),
    );
  }

  Widget _buildCounterControls(bool isDueToday) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(Icons.remove, size: 20),
          onPressed:
              isEditable && isDueToday && currentCount > 0 ? onDecrement : null,
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(minWidth: 36, minHeight: 36),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            '$currentCount',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isDueToday ? Colors.black : Colors.grey,
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.add, size: 20),
          onPressed: isEditable && isDueToday ? onIncrement : null,
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(minWidth: 36, minHeight: 36),
        ),
      ],
    );
  }

  Widget _buildSubtitle(bool isDueToday) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (habit.description.isNotEmpty)
          Text(
            habit.description,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
          ),
        if (habit.description.isNotEmpty) SizedBox(height: 4),
        Row(
          children: [
            Icon(Icons.star, size: 14, color: Colors.amber),
            SizedBox(width: 4),
            Text('${habit.experience} XP', style: TextStyle(fontSize: 12)),
            SizedBox(width: 8),
            Icon(Icons.repeat, size: 14, color: Colors.blue),
            SizedBox(width: 2),
            Text('min ${habit.minCompletionCount}',
                style: TextStyle(fontSize: 12)),
            if (showScheduleInfo) ...[
              SizedBox(width: 8),
              _buildScheduleBadge(),
            ],
            if (currentCount > 0 && isDueToday) ...[
              SizedBox(width: 16),
              Text(
                '$currentCount today',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }

  Widget _buildTrailing(BuildContext context, bool isDueToday) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (!isDueToday)
          Text(
            'Not today',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        if (onEdit != null) ...[
          SizedBox(height: 8),
          IconButton(
            icon: Icon(Icons.edit_note_outlined, color: Colors.grey, size: 20),
            onPressed: onEdit,
            tooltip: 'Edit habit',
          ),
        ],
        if (onDelete != null) ...[
          SizedBox(height: 8),
          IconButton(
            icon: Icon(Icons.delete_outline, color: Colors.grey, size: 20),
            onPressed: () => _showDeleteConfirmation(context),
            tooltip: 'Delete habit',
          ),
        ],
      ],
    );
  }

  Widget _buildScheduleBadge() {
    Color color;
    String text;

    switch (habit.scheduleType) {
      case 'daily':
        color = Colors.blue;
        text = 'Daily';
        break;
      case 'weekly':
        color = Colors.green;
        text = 'Weekly';
        break;
      case 'monthly':
        color = Colors.orange;
        text = 'Monthly';
        break;
      case 'custom':
        color = Colors.purple;
        text = 'Custom';
        break;
      default:
        color = Colors.grey;
        text = habit.scheduleType;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        text,
        style:
            TextStyle(fontSize: 10, color: color, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildKarmaIndicator() {
    return Container(
      width: 6,
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: habit.karmaColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4),
          bottomLeft: Radius.circular(4),
        ),
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context) {
    if (onDelete != null) {
      showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: Text('Delete Habit'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Are you sure you want to delete "${habit.title}"?'),
                if (currentCount > 0)
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Text(
                      '⚠️ This will remove ${habit.experience * currentCount} XP from your character!',
                      style: TextStyle(color: Colors.orange, fontSize: 12),
                    ),
                  ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                  onDelete!();
                },
                child: Text('Delete', style: TextStyle(color: Colors.red)),
              ),
            ],
          );
        },
      );
    }
  }
}
