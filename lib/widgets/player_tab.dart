import 'package:flutter/material.dart';
import 'package:habit_to_do_some_level_up/extensions/localization_extension.dart';
import 'package:habit_to_do_some_level_up/services/day_completion_service.dart';
import 'package:habit_to_do_some_level_up/styles.dart';
import '../models/player.dart';
import '../services/hive_service.dart';
import 'settings_dialog.dart';

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

        return Styles.isWideScreen(context)
            ? _buildDesktopLayout(player)
            : _buildMobileLayout(player);
      },
    );
  }

  Widget _buildMobileLayout(Player player) {
    return Column(
      children: [
        _buildStatsCard(player),
        SizedBox(height: Styles.getGap('L')),
        Expanded(child: _buildTodaysOverview(false)),
      ],
    );
  }

  Widget _buildDesktopLayout(Player player) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Styles.getGap('L')),
      child: Column(
        children: [
          _buildStatsCard(player),
          SizedBox(height: Styles.getGap('L')),
          Expanded(child: _buildTodaysOverview(true)),
        ],
      ),
    );
  }

  Widget _buildStatsCard(Player player) {
    return Card(
      margin: EdgeInsets.all(Styles.getGap('L')),
      color: Styles.playerTitleCardBackColor,
      child: Padding(
        padding: EdgeInsets.all(Styles.getGap('L')),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Заголовок с настройками
            Row(
              children: [
                Expanded(
                  child: Text(
                    player.goal == Player.defaultGoal
                        ? context.l10n.defaultGoal
                        : player.goal,
                    style: Styles.getPlayerGoalFont(player.level),
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

            SizedBox(height: Styles.getGap('L')),

            // Статистика в строку
            _buildStatsRow(player, context),

            SizedBox(height: Styles.getGap('L')),

            // Прогресс уровня
            _buildLevelProgress(player, context),

            SizedBox(height: Styles.getGap('L')),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsRow(Player player, BuildContext context) {
    return Row(
      children: [
        _buildStatItem(
          context.l10n.level,
          '${player.level}',
          Styles.getPlayerLevelIcon(player.level),
        ),
        SizedBox(width: Styles.getGap('M')),
        _buildStatItem(
          context.l10n.experienceShort,
          '${player.experience}',
          Styles.getPlayerExperienceIcon(player.level),
        ),
        SizedBox(width: Styles.getGap('M')),
        _buildStatItem(
          context.l10n.toNext,
          '${player.experienceToNextLevel}',
          Styles.getPlayerNextLevelIcon(player.level),
        ),
      ],
    );
  }

  Widget _buildStatItem(String label, String value, Icon icon) {
    return Expanded(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(Styles.getGap('S')),
            decoration: BoxDecoration(
              color: Styles.playerStatItemBackColor,
              shape: BoxShape.circle,
            ),
            child: icon,
          ),
          SizedBox(height: Styles.getGap('XS')),
          Text(value, style: Styles.playerStatItemCountFont),
          Text(label,
              style: Styles.playerStatItemLabelFont,
              textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _buildLevelProgress(Player player, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${context.l10n.progressToLevel} ${player.level + 1}',
              style: Styles.playerBarFont,
            ),
            Text('${(player.levelProgress * 100).toStringAsFixed(1)}%',
                style: Styles.playerBarFont),
          ],
        ),
        SizedBox(height: Styles.getGap('S')),
        LinearProgressIndicator(
          borderRadius:
              BorderRadius.all(Radius.circular(Styles.getRadius('XS'))),
          value: player.levelProgress,
          backgroundColor: Styles.getPlayerBackColor(player.level),
          color: Styles.getPlayerFrontColor(player.level),
          minHeight: Styles.getGap('S'),
        ),
      ],
    );
  }

  Widget _buildTodaysOverview(bool isHorizontal) {
    return StreamBuilder(
      stream: _hiveService.habitsBox.watch(),
      builder: (context, snapshot) {
        final habits = _hiveService.getHabits();
        final habitsDueToday =
            habits.where((habit) => habit.isDueToday()).toList().length;
        final completedTodayHabits =
            habits.where((habit) => habit.isCompletedToday).toList().length;

        return StreamBuilder(
          stream: _hiveService.tasksBox.watch(),
          builder: (context, snapshot) {
            final tasks = _hiveService.getTasks();
            final tasksOverall = tasks.toList().length;
            final todaysTasks = tasks
                .where((task) => task.isDueToday && !task.completed)
                .length;
            final overdueTasks = tasks.where((task) => task.isOverdue).length;
            final completedTasks = tasks.where((task) => task.completed).length;

            return Padding(
              padding: EdgeInsets.all(Styles.getGap('L')),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(context.l10n.todaysProgress,
                      style: Styles.playerTodayProgressFont),
                  SizedBox(height: Styles.getGap('L')),
                  Expanded(
                    child: isHorizontal
                        ? Row(
                            children: [
                              Expanded(
                                  child: _buildOverviewCard(
                                context.l10n.habitsDone,
                                '$completedTodayHabits/$habitsDueToday',
                                Styles.playerHabitsCountIcon,
                              )),
                              SizedBox(width: Styles.getGap('M')),
                              Expanded(
                                  child: _buildOverviewCard(
                                context.l10n.tasksDue,
                                '$todaysTasks',
                                Styles.playerTasksDueIcon,
                              )),
                              SizedBox(width: Styles.getGap('M')),
                              Expanded(
                                  child: _buildOverviewCard(
                                context.l10n.tasksDone,
                                '$completedTasks/$tasksOverall',
                                Styles.playerTasksDoneIcon,
                              )),
                              SizedBox(width: Styles.getGap('M')),
                              Expanded(
                                  child: _buildOverviewCard(
                                context.l10n.overdue,
                                '$overdueTasks',
                                Styles.playerOverdueIcon,
                              )),
                            ],
                          )
                        : GridView.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: Styles.getGap('M'),
                            mainAxisSpacing: Styles.getGap('M'),
                            childAspectRatio: 1.2,
                            children: [
                              _buildOverviewCard(
                                context.l10n.habitsDone,
                                '$completedTodayHabits/$habitsDueToday',
                                Styles.playerHabitsCountIcon,
                              ),
                              _buildOverviewCard(
                                context.l10n.tasksDue,
                                '$todaysTasks',
                                Styles.playerTasksDueIcon,
                              ),
                              _buildOverviewCard(
                                context.l10n.tasksDone,
                                '$todaysTasks/$tasksOverall',
                                Styles.playerTasksDoneIcon,
                              ),
                              _buildOverviewCard(
                                context.l10n.overdue,
                                '$todaysTasks',
                                Styles.playerOverdueIcon,
                              ),
                            ],
                          ),
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
    return Card(
      color: Styles.playerOverviewBackColor,
      child: Padding(
        padding: EdgeInsets.all(Styles.getGap('M')),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(height: Styles.getGap('S')),
            Text(value, style: Styles.playerOverviewCountFont),
            Text(title,
                style: Styles.playerOverviewLabelFont,
                textAlign: TextAlign.center),
            if (details != null) ...[
              SizedBox(height: Styles.getGap('XS')),
              Text(details, style: Styles.playerStatItemDetailsFont),
            ],
          ],
        ),
      ),
    );
  }

  Future<void> _showSettingsDialog(Player player) async {
    final result = await showDialog<Player>(
      context: context,
      builder: (context) => SettingsDialog(player: player),
    );

    if (result != null && mounted) {
      _hiveService.updatePlayer(result);
    }
  }
}
