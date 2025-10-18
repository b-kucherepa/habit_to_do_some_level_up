import 'package:flutter/material.dart';

class ScheduleSelector extends StatelessWidget {
  final String scheduleType;
  final ValueChanged<String> onScheduleTypeChanged;
  final List<int> selectedDaysOfWeek;
  final List<int> selectedDaysOfMonth;
  final int? customInterval;
  final ValueChanged<List<int>> onDaysOfWeekChanged;
  final ValueChanged<List<int>> onDaysOfMonthChanged;
  final ValueChanged<int?> onCustomIntervalChanged;

  const ScheduleSelector({
    super.key,
    required this.scheduleType,
    required this.onScheduleTypeChanged,
    required this.selectedDaysOfWeek,
    required this.selectedDaysOfMonth,
    required this.customInterval,
    required this.onDaysOfWeekChanged,
    required this.onDaysOfMonthChanged,
    required this.onCustomIntervalChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Schedule Type',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        _buildScheduleTypeDropdown(),
        SizedBox(height: 16),
        _buildScheduleOptions(),
      ],
    );
  }

  Widget _buildScheduleTypeDropdown() {
    return DropdownButtonFormField<String>(
      initialValue: scheduleType,
      items: [
        DropdownMenuItem(value: 'daily', child: Text('Daily')),
        DropdownMenuItem(value: 'weekly', child: Text('Weekly')),
        DropdownMenuItem(value: 'monthly', child: Text('Monthly')),
        DropdownMenuItem(value: 'custom', child: Text('Custom Interval')),
      ],
      onChanged: (value) => onScheduleTypeChanged(value!),
      decoration: InputDecoration(border: OutlineInputBorder()),
    );
  }

  Widget _buildScheduleOptions() {
    switch (scheduleType) {
      case 'weekly':
        return _WeeklyScheduleSelector(
          selectedDays: selectedDaysOfWeek,
          onSelectionChanged: onDaysOfWeekChanged,
        );
      case 'monthly':
        return _MonthlyScheduleSelector(
          selectedDays: selectedDaysOfMonth,
          onSelectionChanged: onDaysOfMonthChanged,
        );
      case 'custom':
        return _CustomIntervalSelector(
          interval: customInterval,
          onIntervalChanged: onCustomIntervalChanged,
        );
      default:
        return SizedBox.shrink();
    }
  }
}

class _WeeklyScheduleSelector extends StatelessWidget {
  final List<int> selectedDays;
  final ValueChanged<List<int>> onSelectionChanged;

  const _WeeklyScheduleSelector({
    required this.selectedDays,
    required this.onSelectionChanged,
  });

  @override
  Widget build(BuildContext context) {
    final weekDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final weekDayNumbers = [1, 2, 3, 4, 5, 6, 7];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Select days:',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(7, (index) {
            return FilterChip(
              label: Text(weekDays[index]),
              selected: selectedDays.contains(weekDayNumbers[index]),
              onSelected: (selected) {
                final updatedDays = List<int>.from(selectedDays);
                if (selected) {
                  updatedDays.add(weekDayNumbers[index]);
                } else {
                  updatedDays.remove(weekDayNumbers[index]);
                }
                onSelectionChanged(updatedDays);
              },
            );
          }),
        ),
      ],
    );
  }
}

class _MonthlyScheduleSelector extends StatelessWidget {
  final List<int> selectedDays;
  final ValueChanged<List<int>> onSelectionChanged;

  const _MonthlyScheduleSelector({
    required this.selectedDays,
    required this.onSelectionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Select days of month:',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(31, (index) {
            final day = index + 1;
            return FilterChip(
              label: Text(day.toString()),
              selected: selectedDays.contains(day),
              onSelected: (selected) {
                final updatedDays = List<int>.from(selectedDays);
                if (selected) {
                  updatedDays.add(day);
                } else {
                  updatedDays.remove(day);
                }
                onSelectionChanged(updatedDays);
              },
            );
          }),
        ),
      ],
    );
  }
}

class _CustomIntervalSelector extends StatelessWidget {
  final int? interval;
  final ValueChanged<int?> onIntervalChanged;

  const _CustomIntervalSelector({
    required this.interval,
    required this.onIntervalChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Repeat every X days:',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        DropdownButtonFormField<int>(
          initialValue: interval,
          items: [1, 2, 3, 4, 5, 6, 7].map((days) {
            return DropdownMenuItem(
              value: days,
              child: Text('$days day${days > 1 ? 's' : ''}'),
            );
          }).toList(),
          onChanged: onIntervalChanged,
          decoration: InputDecoration(border: OutlineInputBorder()),
          validator: (value) {
            if (value == null) return 'Please select interval';
            return null;
          },
        ),
      ],
    );
  }
}
