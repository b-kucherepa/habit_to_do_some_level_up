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
    final isWideScreen = MediaQuery.of(context).size.width > 800;

    return StreamBuilder(
      stream: _hiveService.playersBox.watch(),
      builder: (context, snapshot) {
        final players = _hiveService.getPlayers();
        final player = players.first;

        return isWideScreen
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

            SizedBox(height: Styles.getGap('L')),

            // Статистика в строку
            _buildStatsRow(player, context),

            SizedBox(height: Styles.getGap('L')),

            // Прогресс уровня
            _buildLevelProgress(player, context),

            SizedBox(height: Styles.getGap('L')),

            // Информация о системе уровней
            _buildLevelSystemInfo(player, context),
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
          Styles.playerTabLevelIcon,
        ),
        SizedBox(width: Styles.getGap('M')),
        _buildStatItem(
          context.l10n.experienceShort,
          '${player.experience}',
          Styles.playerTabExperienceIcon,
        ),
        SizedBox(width: Styles.getGap('M')),
        _buildStatItem(
          context.l10n.toNext,
          '${player.experienceToNextLevel}',
          Styles.playerTabToNextLevelIcon,
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
              style: Styles.playerProgressBarFont,
            ),
            Text('${(player.levelProgress * 100).toStringAsFixed(1)}%',
                style: Styles.playerProgressBarFont),
          ],
        ),
        SizedBox(height: Styles.getGap('S')),
        LinearProgressIndicator(
          value: player.levelProgress,
          backgroundColor: Styles.playerProgressIndicatorBackColor,
          color: Styles.playerProgressIndicatorFrontColor,
          minHeight: Styles.getGap('S'),
        ),
      ],
    );
  }

  Widget _buildLevelSystemInfo(Player player, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Styles.getGap('M'),
        vertical: Styles.getGap('S'),
      ),
      decoration: BoxDecoration(
        color: Styles.playerTabExpCurveLabelColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(Styles.getRadius('S')),
        border: Border.all(
            color: Styles.playerTabExpCurveLabelColor.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Styles.playerTabExpCurveLabelIcon,
          SizedBox(width: Styles.getGap('S')),
          Expanded(
            child: Text(
              context.l10n.expCurveLabel(
                player.curveExponent.toStringAsFixed(1),
                player.experienceMultiplier.toInt(),
              ),
              style: Styles.playerTabExpCurveLabelFont,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTodaysOverview(bool isHorizontal) {
    return StreamBuilder(
      stream: _hiveService.habitsBox.watch(),
      builder: (context, snapshot) {
        final habits = _hiveService.getHabits();
        final todaysHabits =
            habits.where((habit) => habit.isCompletedToday).toList();
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
                                '$completedHabitsCount',
                                Styles.playerHabitsCountIcon,
                                details: context.l10n
                                    .habitsNumberToday(todaysHabits.length),
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
                                '$completedTasks',
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
                                '$completedHabitsCount',
                                Styles.playerHabitsCountIcon,
                                details: context.l10n
                                    .habitsNumberToday(todaysHabits.length),
                              ),
                              _buildOverviewCard(
                                context.l10n.tasksDue,
                                '$todaysTasks',
                                Styles.playerTasksDueIcon,
                              ),
                              _buildOverviewCard(
                                context.l10n.tasksDone,
                                '$completedTasks',
                                Styles.playerTasksDoneIcon,
                              ),
                              _buildOverviewCard(
                                context.l10n.overdue,
                                '$overdueTasks',
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
      builder: (context) => PlayerSettingsDialog(player: player),
    );

    if (result != null && mounted) {
      _hiveService.updatePlayer(result);
    }
  }
}
