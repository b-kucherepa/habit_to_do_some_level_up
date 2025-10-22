import 'package:flutter/material.dart';
import 'package:todo_rpg_app/extensions/localization_extension.dart';
import 'package:todo_rpg_app/styles.dart';
import '../models/character.dart';
import '../services/hive_service.dart';
import '../widgets/character_settings_dialog.dart';

class CharacterTab extends StatefulWidget {
  const CharacterTab({super.key});

  @override
  _CharacterTabState createState() => _CharacterTabState();
}

class _CharacterTabState extends State<CharacterTab> {
  final HiveService _hiveService = HiveService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _hiveService.charactersBox.watch(),
      builder: (context, snapshot) {
        final characters = _hiveService.getCharacters();

        final character = characters.first;
        return Column(
          children: [
            _buildStatsCard(character),
            SizedBox(height: Styles.gap['large']),
            Expanded(child: _buildTodaysOverview()),
          ],
        );
      },
    );
  }

  Widget _buildStatsCard(Character character) {
    return Card(
      margin: EdgeInsets.all(Styles.gap['large'] ?? Styles.fallbackGap),
      child: Padding(
        padding: EdgeInsets.all(Styles.gap['large'] ?? Styles.fallbackGap),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    character.goal == Character.defaultGoal
                        ? context.l10n.defaultGoal
                        : character.goal,
                    style: Styles.characterGoal,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  icon: Styles.characterTabSettingsIcon,
                  onPressed: () => _showSettingsDialog(character),
                  tooltip: context.l10n.settings,
                ),
              ],
            ),
            SizedBox(height: Styles.gap['large']),
            Row(
              children: [
                _buildStatItem(context.l10n.level, '${character.level}',
                    Styles.characterTabLevelIcon),
                SizedBox(width: Styles.gap['large']),
                _buildStatItem(
                    context.l10n.experienceShort,
                    '${character.experience}',
                    Styles.characterTabExperienceIcon),
                SizedBox(width: Styles.gap['large']),
                _buildStatItem(
                    context.l10n.toNext,
                    '${character.experienceToNextLevel}',
                    Styles.characterTabToNextLevelIcon),
              ],
            ),
            SizedBox(height: Styles.gap['large']),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        '${context.l10n.progressToLevel} ${character.level + 1}'),
                    Text(
                        '${(character.levelProgress * 100).toStringAsFixed(1)}%'),
                  ],
                ),
                SizedBox(height: Styles.gap['small']),
                LinearProgressIndicator(
                  value: character.levelProgress,
                  backgroundColor: Styles.characterProgressIndicatorBackColor,
                  color: Styles.characterProgressIndicatorFrontColor,
                  minHeight: Styles.gap['small'],
                ),
              ],
            ),
            SizedBox(height: Styles.gap['small']),
            _buildLevelSystemInfo(character),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value, Icon icon) {
    return Expanded(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(Styles.gap['small'] ?? Styles.fallbackGap),
            decoration: BoxDecoration(
              color: Styles.characterStatItemBackColor,
              shape: BoxShape.circle,
            ),
            child: icon,
          ),
          SizedBox(height: Styles.gap['tiny'] ?? Styles.fallbackGap),
          Text(value, style: Styles.characterStatItemCountFont),
          Text(label, style: Styles.characterStatItemLabelFont),
        ],
      ),
    );
  }

  Widget _buildLevelSystemInfo(Character character) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Styles.gap['medium'] ?? Styles.fallbackGap,
          vertical: Styles.gap['small'] ?? Styles.fallbackGap),
      decoration: BoxDecoration(
        color: Styles.characterTabExpCurveLabelColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(
            Styles.radius['small'] ?? Styles.fallbackRadius),
        border: Border.all(
            color:
                Styles.characterTabExpCurveLabelColor.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Styles.characterTabExpCurveLabelIcon,
          SizedBox(width: Styles.gap['small']),
          Text(
              context.l10n.expCurveLabel(
                  character.curveExponent.toStringAsFixed(1),
                  character.experienceMultiplier.toInt()),
              style: Styles.characterTabExpCurveLabelFont),
        ],
      ),
    );
  }

  Widget _buildTodaysOverview() {
    return StreamBuilder(
      stream: _hiveService.habitsBox.watch(),
      builder: (context, snapshot) {
        final habits = _hiveService.getHabits();
        final todaysHabits =
            habits.where((habit) => habit.isDueToday()).toList();
        final completedHabitsCount = todaysHabits.fold<int>(
            0, (sum, habit) => sum + habit.getTodayCompletionCount());

        return StreamBuilder(
          stream: _hiveService.tasksBox.watch(),
          builder: (context, snapshot) {
            final tasks = _hiveService.getTasks();
            final todaysTasks = tasks
                .where((task) => task.isDueToday && !task.completed)
                .length;
            final overdueTasks = tasks.where((task) => task.isOverdue).length;
            final completedTasks = tasks.where((task) => task.completed).length;

            return Padding(
              padding:
                  EdgeInsets.all(Styles.gap['large'] ?? Styles.fallbackGap),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.todaysProgress,
                    style: Styles.characterTodayProgressFont,
                  ),
                  SizedBox(height: Styles.gap['large'] ?? Styles.fallbackGap),
                  Row(
                    children: [
                      _buildOverviewCard(context.l10n.habitsDone,
                          '$completedHabitsCount', Styles.habitsDoneCountIcon,
                          details: context.l10n
                              .habitsNumberToday(todaysHabits.length)),
                      SizedBox(
                          width: Styles.gap['medium'] ?? Styles.fallbackGap),
                      _buildOverviewCard(context.l10n.tasksDue, '$todaysTasks',
                          Styles.overviewTasksDueIcon),
                    ],
                  ),
                  SizedBox(height: Styles.gap['medium'] ?? Styles.fallbackGap),
                  Row(
                    children: [
                      _buildOverviewCard(
                        context.l10n.tasksDone,
                        '$completedTasks',
                        Styles.overviewTasksDoneIcon,
                      ),
                      SizedBox(
                          height: Styles.gap['medium'] ?? Styles.fallbackGap),
                      _buildOverviewCard(
                        context.l10n.overdue,
                        '$overdueTasks',
                        Styles.overviewOverdueIcon,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildOverviewCard(String title, String value, Icon icon,
      {String? details}) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(Styles.gap['medium'] ?? Styles.fallbackGap),
          child: Column(
            children: [
              icon,
              SizedBox(height: Styles.gap['small'] ?? Styles.fallbackGap),
              Text(
                value,
                style: Styles.characterOverviewCountFont,
              ),
              Text(
                title,
                style: Styles.characterOverviewLabelFont,
              ),
              if (details != null)
                Text(
                  details,
                  style: Styles.characterStatItemDetailsFont,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showSettingsDialog(Character character) async {
    final result = await showDialog<Character>(
      context: context,
      builder: (context) => CharacterSettingsDialog(character: character),
    );

    if (result != null && mounted) {
      _hiveService.updateCharacter(result);
    }
  }
}
