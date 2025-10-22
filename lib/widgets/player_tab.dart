import 'package:flutter/material.dart';
import 'package:todo_rpg_app/extensions/localization_extension.dart';
import 'package:todo_rpg_app/styles.dart';
import '../models/player.dart';
import '../services/hive_service.dart';
import 'player_settings_dialog.dart';

class PlayerTab extends StatefulWidget {
  const PlayerTab({super.key});

  @override
  _PlayerTabState createState() => _PlayerTabState();
}

class _PlayerTabState extends State<PlayerTab> {
  final HiveService _hiveService = HiveService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _hiveService.playersBox.watch(),
      builder: (context, snapshot) {
        final players = _hiveService.getPlayers();

        final player = players.first;
        return Column(
          children: [
            _buildStatsCard(player),
            SizedBox(height: Styles.gap['large']),
            Expanded(child: _buildTodaysOverview()),
          ],
        );
      },
    );
  }

  Widget _buildStatsCard(Player player) {
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
                    player.goal == Player.defaultGoal
                        ? context.l10n.defaultGoal
                        : player.goal,
                    style: Styles.playerGoal,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  icon: Styles.playerTabSettingsIcon,
                  onPressed: () => _showSettingsDialog(player),
                  tooltip: context.l10n.settings,
                ),
              ],
            ),
            SizedBox(height: Styles.gap['large']),
            Row(
              children: [
                _buildStatItem(context.l10n.level, '${player.level}',
                    Styles.playerTabLevelIcon),
                SizedBox(width: Styles.gap['large']),
                _buildStatItem(context.l10n.experienceShort,
                    '${player.experience}', Styles.playerTabExperienceIcon),
                SizedBox(width: Styles.gap['large']),
                _buildStatItem(
                    context.l10n.toNext,
                    '${player.experienceToNextLevel}',
                    Styles.playerTabToNextLevelIcon),
              ],
            ),
            SizedBox(height: Styles.gap['large']),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${context.l10n.progressToLevel} ${player.level + 1}'),
                    Text('${(player.levelProgress * 100).toStringAsFixed(1)}%'),
                  ],
                ),
                SizedBox(height: Styles.gap['small']),
                LinearProgressIndicator(
                  value: player.levelProgress,
                  backgroundColor: Styles.playerProgressIndicatorBackColor,
                  color: Styles.playerProgressIndicatorFrontColor,
                  minHeight: Styles.gap['small'],
                ),
              ],
            ),
            SizedBox(height: Styles.gap['small']),
            _buildLevelSystemInfo(player),
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
              color: Styles.playerStatItemBackColor,
              shape: BoxShape.circle,
            ),
            child: icon,
          ),
          SizedBox(height: Styles.gap['tiny'] ?? Styles.fallbackGap),
          Text(value, style: Styles.playerStatItemCountFont),
          Text(label, style: Styles.playerStatItemLabelFont),
        ],
      ),
    );
  }

  Widget _buildLevelSystemInfo(Player player) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Styles.gap['medium'] ?? Styles.fallbackGap,
          vertical: Styles.gap['small'] ?? Styles.fallbackGap),
      decoration: BoxDecoration(
        color: Styles.playerTabExpCurveLabelColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(
            Styles.radius['small'] ?? Styles.fallbackRadius),
        border: Border.all(
            color: Styles.playerTabExpCurveLabelColor.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Styles.playerTabExpCurveLabelIcon,
          SizedBox(width: Styles.gap['small']),
          Text(
              context.l10n.expCurveLabel(
                  player.curveExponent.toStringAsFixed(1),
                  player.experienceMultiplier.toInt()),
              style: Styles.playerTabExpCurveLabelFont),
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
                    style: Styles.playerTodayProgressFont,
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
                style: Styles.playerOverviewCountFont,
              ),
              Text(
                title,
                style: Styles.playerOverviewLabelFont,
              ),
              if (details != null)
                Text(
                  details,
                  style: Styles.playerStatItemDetailsFont,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showSettingsDialog(Player player) async {
    final result = await showDialog<Player>(
      context: context,
      builder: (context) => PlayerSettingsDialog(player: player),
    );

    if (result != null && mounted) {
      _hiveService.updatePlayer(result);
    }
  }
}
