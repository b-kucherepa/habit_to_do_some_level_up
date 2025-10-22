import 'package:flutter/material.dart';

class Styles {
//Universal:
//Main:
  static const Color badAccent = Color.fromARGB(255, 255, 72, 72);
  static const Color warningAccent = Color.fromARGB(255, 255, 145, 0);
  static const Color goodAccent = Color.fromARGB(255, 0, 232, 8);
  static const Color neutralAccent = Color.fromARGB(255, 0, 140, 255);
  static const Color noAccent = Color.fromARGB(255, 0, 81, 255);
  static const Color fargroundColor = Color.fromARGB(255, 240, 240, 240);
  static const Color backgroundColor = Color.fromARGB(255, 251, 251, 251);
  static const Color foregroundColor = Colors.white;
  static const Color shadowColor = Colors.black;

  static const Color contrastHeaderFontColor = foregroundColor;

  //Fallbacks
  static const Color fallbackColor = Colors.grey;
  static const Color fallbackFontColor = Colors.black;

  static final Icon fallbackIcon = Icon(
    Icons.square_outlined,
    color: Colors.grey,
  );

  static final TextStyle fallbackFont = TextStyle(color: Colors.black);

  static const double fallbackBorderWidth = 4;
  static const double fallbackGap = 4;
  static const double fallbackRadius = 4;

  //Add buttons:
  static const Icon addButtonLargeIcon =
      Icon(Icons.add, color: foregroundColor);

  static const TextStyle addFormButtonFont =
      TextStyle(fontSize: 18, color: foregroundColor);
  static const TextStyle addFormFont = TextStyle(fontSize: 16);

  //Tabs:
  static const Color tabsBackColor = fargroundColor;
  static const Color navigatorBackColor = foregroundColor;
  static const Color playerAccentColor = Color.fromARGB(255, 0, 140, 255);
  static const Color habitAccentColor = Color.fromARGB(255, 0, 199, 7);
  static const Color taskAccentColor = Color.fromARGB(255, 131, 0, 231);
  static const Color levelUpAccentColor = Color.fromARGB(255, 255, 157, 0);

  static Color getAppBarColor(int index) =>
      _appBarColor[index] ?? fallbackColor;

  static const Map<int, Color> _appBarColor = {
    0: playerAccentColor,
    1: habitAccentColor,
    2: taskAccentColor,
  };

  static const Icon playerTabIcon = Icon(Icons.person_outline_outlined);
  static const Icon habitsTabIcon = Icon(Icons.auto_graph_outlined);
  static const Icon tasksTabIcon = Icon(Icons.assignment_turned_in_outlined);

  //Entries:
  static const Color entryUncompletedBackColor = foregroundColor;
  static const Color entryCompletedBackColor =
      Color.fromARGB(255, 219, 255, 221);

  static const Icon editEntryIcon =
      Icon(Icons.edit_note_outlined, color: Colors.grey, size: 20);
  static const Icon deleteEntryIcon =
      Icon(Icons.delete_outline, color: Colors.grey, size: 20);
  static const Icon entryExperienceIcon =
      Icon(Icons.star, size: 16, color: Colors.amber);

  static const TextStyle entrySubtextFont = TextStyle(fontSize: 12);
  static const TextStyle entryDeleteConfirmationMessageFont = TextStyle(
    fontSize: 12,
    color: Colors.deepOrange,
  );
  static const TextStyle entryDeleteConfirmationButtonFont = TextStyle(
    color: Colors.red,
  );
  static const TextStyle entryCompletedFont = TextStyle(
    decoration: TextDecoration.lineThrough,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle entryUncompletedFont = TextStyle(
    fontWeight: FontWeight.normal,
  );
  static const TextStyle entryInactiveFont = TextStyle(
    fontWeight: FontWeight.normal,
    color: Colors.grey,
  );

//Settings:
  static const Icon settingsIcon = Icon(Icons.settings, color: Colors.blue);
  static const Icon languageOptionIcon =
      Icon(Icons.language, size: 20, color: Colors.grey);

  //Experience preview:
  static const Color expPreviewChartBackColor = foregroundColor;

  static const TextStyle expPreviewTitle =
      TextStyle(fontWeight: FontWeight.bold);
  static const TextStyle expPreviewFormula =
      TextStyle(fontSize: 12, fontStyle: FontStyle.italic);
  static const TextStyle expPreviewSliderDescription =
      TextStyle(fontSize: 12, color: Colors.grey);
  static const TextStyle expPreviewSliderExtremities =
      TextStyle(fontSize: 12, color: Colors.grey);

  static const bool expPreviewLineIsHueInverted = true;

  static const int expPreviewMinExp = 0;
  static const int expPreviewMinLevel = 2;
  static const int expPreviewMaxLevel = 20;

  static const double expPreviewXReservedSize = 30;
  static const double expPreviewXInterval = 2;

  static const double expPreviewYReservedSize = 60;
  static const double expPreviewWidth = 500;
  static const double expPreviewHeight = 200;
  static const double expPreviewMinLineHue = 0;
  static const double expPreviewMaxLineHue = 210;
  static const double expPreviewLineSaturation = 0.7;
  static const double expPreviewLineLightness = 0.6;
  static const double expPreviewLineWidth = 3;

//Player:
  static const Color playerTitleCardBackColor = backgroundColor;

  static const TextStyle playerGoal = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 20, 107, 179),
  );

  static const TextStyle playerTodayProgressFont =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  //Experience curve label:
  static const Color playerTabExpCurveLabelColor = Colors.blue;

  static const Icon playerTabExpCurveLabelIcon =
      Icon(Icons.trending_up, size: 16, color: Colors.blue);

  static const TextStyle playerTabExpCurveLabelFont = TextStyle(
      fontSize: 12,
      color: playerTabExpCurveLabelColor,
      fontWeight: FontWeight.bold);

  //Experience bar:
  static const Color playerProgressIndicatorBackColor =
      Color.fromARGB(255, 182, 182, 182);
  static const Color playerProgressIndicatorFrontColor = neutralAccent;

  //Stats:
  static const Color playerStatItemBackColor = foregroundColor;

  static const Icon playerTabSettingsIcon =
      Icon(Icons.settings, color: Colors.grey);
  static const Icon playerTabLevelIcon =
      Icon(Icons.star, size: 20, color: Color.fromARGB(255, 25, 118, 210));
  static const Icon playerTabExperienceIcon = Icon(Icons.auto_awesome,
      size: 20, color: Color.fromARGB(255, 25, 118, 210));
  static const Icon playerTabToNextLevelIcon =
      Icon(Icons.flag, size: 20, color: Color.fromARGB(255, 25, 118, 210));

  static const TextStyle playerStatItemCountFont =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  static const TextStyle playerStatItemLabelFont =
      TextStyle(fontSize: 12, color: Colors.grey);
  static const TextStyle playerStatItemDetailsFont =
      TextStyle(fontSize: 14, color: Color.fromARGB(255, 199, 199, 199));

  //Overview:
  static const Color playerOverviewBackColor = backgroundColor;
  static const Icon playerHabitsCountIcon =
      Icon(Icons.auto_awesome, size: 24, color: habitAccentColor);
  static const Icon playerTasksDueIcon =
      Icon(Icons.task, size: 24, color: warningAccent);
  static const Icon playerTasksDoneIcon =
      Icon(Icons.check_circle, size: 24, color: taskAccentColor);
  static const Icon playerOverdueIcon =
      Icon(Icons.warning, size: 24, color: badAccent);

  static const TextStyle playerOverviewCountFont =
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static const TextStyle playerOverviewLabelFont =
      TextStyle(fontSize: 16, color: Colors.grey);

//Habits:
  static const Icon habitsTabLargeIcon =
      Icon(Icons.auto_graph_outlined, size: 64, color: Colors.grey);

  static const TextStyle habitDescriptionFont = TextStyle(
    fontSize: 12,
    color: Color.fromARGB(255, 100, 100, 100),
  );

  static const TextStyle habitsEmptyHint = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.grey,
  );

  //Habit entry bar:
  static const Icon habitCompletionMinIcon =
      Icon(Icons.check, size: 14, color: Colors.blue);

  static const Icon habitRepetitionIcon =
      Icon(Icons.repeat, size: 14, color: Colors.black);

  static const TextStyle habitNotTodayFont = TextStyle(
    fontSize: 12,
    color: Colors.grey,
  );

  //Counter:
  static const Color habitCounterBackColor = entryUncompletedBackColor;

  static const Icon habitCounterIncreaseIcon = Icon(Icons.add, size: 20);
  static const Icon habitCounterDecreaseIcon = Icon(Icons.remove, size: 20);

  static const TextStyle habitTodayCountFont = TextStyle(
    color: Colors.green,
    fontWeight: FontWeight.bold,
    fontSize: 12,
  );

  static const TextStyle counterActiveFont = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle counterInactiveFont = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.grey,
  );

  //Karma:
  static Color getKarmaLevelColor(int index) =>
      _karmaLevelColor[index] ?? fallbackColor;

  static const Map<int, Color> _karmaLevelColor = {
    -4: Color.fromARGB(255, 142, 9, 0),
    -3: Color.fromARGB(255, 231, 0, 0),
    -2: Color.fromARGB(255, 255, 145, 0),
    -1: Color.fromARGB(255, 255, 255, 0),
    0: Color.fromARGB(255, 255, 255, 255),
    1: Color.fromARGB(255, 191, 255, 0),
    2: Color.fromARGB(255, 0, 255, 4),
    3: Color.fromARGB(255, 0, 255, 153),
    4: Color.fromARGB(255, 0, 251, 255),
    5: Color.fromARGB(255, 0, 162, 255),
    6: Color.fromARGB(255, 0, 55, 255),
    7: Color.fromARGB(255, 140, 0, 255)
  };

//Tasks:
  static const Icon tasksTabLargeIcon =
      Icon(Icons.assignment_turned_in_outlined, size: 64, color: Colors.grey);

  //Tasks entry bar:
  static const Color taskCategoryBackColor = Colors.grey;

  static const tasksCompletedHeaderFont =
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green);
  static const tasksCompletedPendingFont =
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

//Tasks stats:
  static const Color taskStatLabelTotalColor = Colors.blue;
  static const Color taskStatLabelPendingColor = Colors.orange;
  static const Color taskStatLabelDoneColor = Colors.green;

  static const TextStyle taskStatLabelTotalFont = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: taskStatLabelTotalColor);
  static const TextStyle taskStatLabelPendingFont = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: taskStatLabelPendingColor);
  static const TextStyle taskStatLabelDoneFont = TextStyle(
      fontSize: 18, fontWeight: FontWeight.bold, color: taskStatLabelDoneColor);

  static const TextStyle taskStatLabelDescriptionFont =
      TextStyle(fontSize: 12, color: Colors.grey);
  static const TextStyle taskCategory = TextStyle(fontSize: 10);

  //Task schedule:
  static Color getHabitScheduleColor(String index) =>
      _habitScheduleColor[index] ?? fallbackColor;

  static const Map<String, Color> _habitScheduleColor = {
    'daily': Colors.blue,
    'weekly': Colors.green,
    'monthly': Colors.orange,
    'custom': Colors.purple
  };

  static TextStyle getHabitScheduleFont(String index) =>
      _habitScheduleFont[index] ?? fallbackFont;

  static final Map<String, TextStyle> _habitScheduleFont = {
    'daily': TextStyle(
        fontSize: 10,
        color: getHabitScheduleColor('daily'),
        fontWeight: FontWeight.bold),
    'weekly': TextStyle(
        fontSize: 10,
        color: getHabitScheduleColor('weekly'),
        fontWeight: FontWeight.bold),
    'monthly': TextStyle(
        fontSize: 10,
        color: getHabitScheduleColor('monthly'),
        fontWeight: FontWeight.bold),
    'custom': TextStyle(
        fontSize: 10,
        color: getHabitScheduleColor('custom'),
        fontWeight: FontWeight.bold)
  };

  static TextStyle getHabitSelectorTitleFont(String index) =>
      _habitSelectorTitleFont[index] ?? fallbackFont;

  static final Map<String, TextStyle> _habitSelectorTitleFont = {
    'daily': TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    'weekly': TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    'monthly': TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    'custom': TextStyle(fontSize: 14, fontWeight: FontWeight.bold)
  };

  //Tasks priority:
  static Color getTaskPriorityColor(int index) =>
      _taskPriorityColor[index] ?? fallbackColor;

  static const Map<int, Color> _taskPriorityColor = {
    1: Color.fromARGB(255, 0, 140, 255),
    2: Color.fromARGB(255, 38, 222, 44),
    3: Color.fromARGB(255, 255, 234, 0),
    4: Color.fromARGB(255, 255, 142, 28),
    5: Color.fromARGB(255, 231, 46, 46)
  };

  static TextStyle getTaskPriorityFont(int index) =>
      _taskPriorityFont[index] ?? fallbackFont;

  static final Map<int, TextStyle> _taskPriorityFont = {
    1: TextStyle(
        fontSize: 10,
        color: getTaskPriorityColor(1),
        fontWeight: FontWeight.bold),
    2: TextStyle(
        fontSize: 10,
        color: getTaskPriorityColor(2),
        fontWeight: FontWeight.bold),
    3: TextStyle(
        fontSize: 10,
        color: getTaskPriorityColor(3),
        fontWeight: FontWeight.bold),
    4: TextStyle(
        fontSize: 10,
        color: getTaskPriorityColor(4),
        fontWeight: FontWeight.bold),
    5: TextStyle(
        fontSize: 10,
        color: getTaskPriorityColor(5),
        fontWeight: FontWeight.bold)
  };

  //Tasks state:
  static Color getTaskStateColor(String index) =>
      _taskStateColor[index] ?? fallbackColor;

  static final Map<String, Color> _taskStateColor = {
    'completed': goodAccent,
    'overdue': badAccent,
    "today": warningAccent,
    'soon': neutralAccent
  };

  static Icon getTaskStateIcon(String index) =>
      _taskStateIcon[index] ?? fallbackIcon;

  static final Map<String, Icon> _taskStateIcon = {
    'completed': Icon(Icons.calendar_today,
        size: 16, color: getTaskStateColor('completed')),
    'overdue': Icon(Icons.calendar_today,
        size: 16, color: getTaskStateColor('overdue')),
    "today":
        Icon(Icons.calendar_today, size: 16, color: getTaskStateColor('today')),
    'soon':
        Icon(Icons.calendar_today, size: 16, color: getTaskStateColor('soon'))
  };

  static TextStyle getTaskStateFont(String index) =>
      _taskStateFont[index] ?? fallbackFont;

  static final Map<String, TextStyle> _taskStateFont = {
    'completed': TextStyle(color: getTaskStateColor('completed')),
    'overdue': TextStyle(color: getTaskStateColor('overdue')),
    "today": TextStyle(color: getTaskStateColor('today')),
    'soon': TextStyle(color: getTaskStateColor('soon'))
  };

//Level up:
  static const Color levelUpLabelBackColor = Color.fromARGB(255, 255, 242, 223);
  static const Color levelUpBorderColor = levelUpAccentColor;

  static const Icon levelUpLargeIcon = Icon(
    Icons.auto_awesome,
    size: 64,
    color: Colors.amber,
  );

  static const TextStyle levelUpCongratulations = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: levelUpAccentColor,
  );
  static const TextStyle levelUpLabel = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: levelUpAccentColor,
  );
  static const TextStyle levelUpDetails = TextStyle(
    fontSize: 14,
    color: Color.fromARGB(255, 108, 108, 108),
    fontStyle: FontStyle.italic,
  );

  //Level up button:
  static const Color levelUpButtonFontColor = levelUpAccentColor;
  static const Icon levelUpButtonIcon = Icon(Icons.celebration);

//Day completion:
  static const Color completeDayBackColor = Colors.blue;
  static const Color completeDayButtonColor = Colors.blue;

  static const TextStyle completeDayHint =
      TextStyle(fontSize: 14, color: Styles.contrastHeaderFontColor);
  static const TextStyle completeDayCompleteHeader =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

//Sizes:

  static double getBorderWidth(String index) =>
      _borderWidth[index] ?? fallbackBorderWidth;

  static const Map<String, double> _borderWidth = {
    'XS': 2,
    'S': 4,
    'M': 8,
  };

  static double getGap(String index) => _gap[index] ?? fallbackBorderWidth;

  static const Map<String, double> _gap = {
    'XXS': 2,
    'XS': 4,
    'S': 8,
    'M': 12,
    'L': 16,
    'XL': 24,
    'XXL': 32,
  };

  static double getRadius(String index) =>
      _radius[index] ?? fallbackBorderWidth;

  static const Map<String, double> _radius = {
    'XS': 4,
    'S': 8,
    'M': 12,
    'L': 16,
    'XL': 20
  };
}
