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

  // Сортировка
  String _sortBy = 'title';
  bool _ascending = true;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _hiveService.habitsBox.watch(),
      builder: (context, snapshot) {
        final habits = _hiveService.getHabits();

        if (habits.isEmpty) {
          return _buildEmptyState(context);
        }

        // Сортируем привычки
        final sortedHabits = _sortHabits(habits);

        final todayHabits =
            sortedHabits.where((habit) => habit.isDueToday()).toList();
        final otherHabits =
            sortedHabits.where((habit) => !habit.isDueToday()).toList();

        return Column(
          children: [
            // Панель сортировки
            _buildSortPanel(context),
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

  // Виджет панели сортировки
  Widget _buildSortPanel(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Styles.getGap('M')),
      decoration: BoxDecoration(
        color: Styles.fargroundColor,
        border: Border(
          bottom: BorderSide(color: Styles.habitFormBorderColor, width: 1),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: DropdownButton<String>(
              value: _sortBy,
              isExpanded: true,
              underline: Container(),
              items: [
                DropdownMenuItem(
                  value: 'title',
                  child: Text(context.l10n.sortByTitle),
                ),
                DropdownMenuItem(
                  value: 'experience',
                  child: Text(context.l10n.sortByExperience),
                ),
                DropdownMenuItem(
                  value: 'completionStatus',
                  child: Text(context.l10n.sortByCompletionStatus),
                ),
                DropdownMenuItem(
                  value: 'scheduleType',
                  child: Text(context.l10n.sortByScheduleType),
                ),
                DropdownMenuItem(
                  value: 'karmaLevel',
                  child: Text(context.l10n.sortByKarma),
                ),
                DropdownMenuItem(
                  value: 'completionCount',
                  child: Text(context.l10n.sortByCompletionCount),
                ),
                DropdownMenuItem(
                  value: 'minCompletionCount',
                  child: Text(context.l10n.sortByMinCompletionCount),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _sortBy = value!;
                });
              },
            ),
          ),
          SizedBox(width: Styles.getGap('M')),
          IconButton(
            icon: Icon(
              _ascending ? Icons.arrow_upward : Icons.arrow_downward,
              color: Styles.habitAccentColor,
            ),
            onPressed: () {
              setState(() {
                _ascending = !_ascending;
              });
            },
            tooltip: _ascending
                ? context.l10n.sortAscending
                : context.l10n.sortDescending,
          ),
        ],
      ),
    );
  }

  // Функция сортировки привычек
  List<Habit> _sortHabits(List<Habit> habits) {
    List<Habit> sortedList = List.from(habits);

    sortedList.sort((a, b) {
      int comparison = 0;

      switch (_sortBy) {
        case 'title':
          comparison = a.title.compareTo(b.title);
          break;
        case 'experience':
          comparison = a.experience.compareTo(b.experience);
          break;
        case 'scheduleType':
          comparison = a.scheduleType.compareTo(b.scheduleType);
          break;
        case 'karmaLevel':
          comparison = a.karmaLevel.compareTo(b.karmaLevel);
          break;
        case 'completionCount':
          comparison = a.completionCount.compareTo(b.completionCount);
          break;
        case 'minCompletionCount':
          comparison = a.minCompletionCount.compareTo(b.minCompletionCount);
          break;
        case 'completionStatus':
          // Сначала сравниваем по статусу выполнения
          final aCompleted = a.isCompletedToday;
          final bCompleted = b.isCompletedToday;
          if (aCompleted != bCompleted) {
            comparison = aCompleted ? 1 : -1;
          } else {
            // Если статус одинаковый, сортируем по названию
            comparison = a.title.compareTo(b.title);
          }
          break;
      }

      return _ascending ? comparison : -comparison;
    });

    return sortedList;
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
