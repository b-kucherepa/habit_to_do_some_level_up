import 'package:flutter/material.dart';
import 'package:habit_to_do_some_level_up/extensions/localization_extension.dart';
import 'package:habit_to_do_some_level_up/services/experience_service.dart';
import 'package:habit_to_do_some_level_up/styles.dart';
import '../screens/add_habit_screen.dart';
import '../services/hive_service.dart';
import '../models/habit.dart';
import '../widgets/habit_item_widget.dart';

class HabitsTab extends StatefulWidget {
  final Function(Habit) onHabitIncrement;
  final Function(Habit) onHabitDecrement;
  final Function(Habit) onHabitDelete;
  final ExperienceService experienceService;

  const HabitsTab({
    super.key,
    required this.onHabitIncrement,
    required this.onHabitDecrement,
    required this.onHabitDelete,
    required this.experienceService,
  });

  @override
  State<HabitsTab> createState() => _HabitsTabState();
}

class _HabitsTabState extends State<HabitsTab> {
  final HiveService _hiveService = HiveService();
  bool _isOtherHabitsExpanded = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _hiveService.habitsBox.watch(),
      builder: (context, snapshot) {
        final habits = _hiveService.getHabits();

        if (habits.isEmpty) {
          return _buildEmptyState(context);
        }

        final todayHabits =
            habits.where((habit) => habit.isDueToday()).toList();
        final otherHabits =
            habits.where((habit) => !habit.isDueToday()).toList();

        return Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(Styles.getGap('L')),
                children: [
                  if (todayHabits.isNotEmpty) ...[
                    ...todayHabits
                        .map((habit) => _buildHabitItem(habit, context)),
                  ],
                  if (otherHabits.isNotEmpty) ...[
                    ExpansionTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      initiallyExpanded: _isOtherHabitsExpanded,
                      shape: Border.all(style: BorderStyle.none),
                      collapsedShape: Border.all(style: BorderStyle.none),
                      backgroundColor: Styles.fargroundColor,
                      collapsedBackgroundColor: Styles.fargroundColor,
                      title: Text(
                        context.l10n.habitsTabOnOtherDaysHeader,
                        style: Styles.entryExpansionTileHeaderFont,
                      ),
                      textColor: Styles.habitAccentColor,
                      collapsedTextColor: Styles.habitFormBorderColor,
                      iconColor: Styles.habitAccentColor,
                      collapsedIconColor: Styles.habitFormBorderColor,
                      children: [
                        ...otherHabits
                            .map((habit) => _buildHabitItem(habit, context)),
                      ],
                      onExpansionChanged: (value) {
                        setState(() {
                          _isOtherHabitsExpanded = value;
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

  Widget _buildHabitItem(Habit habit, BuildContext context) {
    return HabitItemWidget(
      habit: habit,
      currentCount: habit.completionCount,
      isEditable: true,
      onIncrement: () => widget.onHabitIncrement(habit),
      onDecrement: () => widget.onHabitDecrement(habit),
      onDelete: () => widget.onHabitDelete(habit),
      onEdit: () => _editHabit(context, habit),
      showScheduleInfo: true,
      showKarmaIndicator: true,
    );
  }

  void _editHabit(BuildContext context, Habit habit) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddHabitScreen(habit: habit),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Styles.habitsTabLargeIcon,
          SizedBox(height: Styles.getGap('L')),
          Text(context.l10n.habitsTabEmptyTitle),
          SizedBox(height: Styles.getGap('S')),
          Text(
            context.l10n.habitsTabEmptySubtitle,
            textAlign: TextAlign.center,
            style: Styles.habitsEmptyHint,
          ),
        ],
      ),
    );
  }
}
