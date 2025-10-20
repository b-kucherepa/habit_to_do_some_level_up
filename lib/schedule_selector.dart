import 'package:flutter/material.dart';
import 'package:todo_rpg_app/extensions/localization_extension.dart';

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
        Text(context.l10n.scheduleSelectorTitle,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        _buildScheduleTypeDropdown(context),
        SizedBox(height: 16),
        _buildScheduleOptions(context),
      ],
    );
  }

  Widget _buildScheduleTypeDropdown(BuildContext context) {
    return DropdownButtonFormField<String>(
      initialValue: scheduleType,
      items: [
        DropdownMenuItem(
            value: 'daily', child: Text(context.l10n.scheduleTypeDaily)),
        DropdownMenuItem(
            value: 'weekly', child: Text(context.l10n.scheduleTypeWeekly)),
        DropdownMenuItem(
            value: 'monthly', child: Text(context.l10n.scheduleTypeMonthly)),
        DropdownMenuItem(
            value: 'custom', child: Text(context.l10n.scheduleTypeCustom)),
      ],
      onChanged: (value) => onScheduleTypeChanged(value!),
      decoration: InputDecoration(border: OutlineInputBorder()),
    );
  }

  Widget _buildScheduleOptions(BuildContext context) {
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
    final weekDays = [
      context.l10n.weekdayMonday,
      context.l10n.weekdayTuesday,
      context.l10n.weekdayWednesday,
      context.l10n.weekdayThursday,
      context.l10n.weekdayFriday,
      context.l10n.weekdaySaturday,
      context.l10n.weekdaySunday,
    ];
    final weekDayNumbers = [1, 2, 3, 4, 5, 6, 7];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.l10n.scheduleWeeklyTitle,
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
        Text(context.l10n.scheduleMonthlyTitle,
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
        Text(context.l10n.scheduleCustomTitle,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        DropdownButtonFormField<int>(
          initialValue: interval,
          items: [1, 2, 3, 4, 5, 6, 7].map((days) {
            return DropdownMenuItem(
              value: days,
              child: Text(context.l10n.scheduleCustomInterval(days)),
            );
          }).toList(),
          onChanged: onIntervalChanged,
          decoration: InputDecoration(border: OutlineInputBorder()),
          validator: (value) {
            if (value == null) return context.l10n.scheduleCustomError;
            return null;
          },
        ),
      ],
    );
  }
}
