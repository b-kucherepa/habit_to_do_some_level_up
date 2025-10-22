import 'package:flutter/material.dart';

abstract class Styles {
  static const Color fallbackColor = Colors.grey;
  static const Color fallbackFontColor = Colors.black;
  static final Icon fallbackIcon = Icon(
    Icons.square_outlined,
    color: Colors.grey,
  );
  static const Color badAccent = Colors.red;
  static const Color warningAccent = Colors.orange;
  static const Color goodAccent = Colors.green;
  static const Color neutralAccent = Colors.blue;
  static const Color noAccent = Colors.blue;

  //static Color getKarmaLevelColor(String index) =>
  //    karmaLevelColor[index] ?? fallbackColor;

  static const Map<int, Color> karmaLevelColor = {
    -4: Colors.red,
    -3: Colors.redAccent,
    -2: Colors.orangeAccent,
    -1: Colors.yellowAccent,
    0: Colors.grey,
    1: Colors.limeAccent,
    2: Colors.lightGreenAccent,
    3: Colors.greenAccent,
    4: Colors.cyanAccent,
    5: Colors.lightBlueAccent,
    6: Colors.blueAccent,
    7: Colors.deepPurpleAccent
  };

  static const Color characterAccentColor = Colors.blue;
  static const Color habitAccentColor = Colors.green;
  static const Color taskAccentColor = Colors.orange;
  static const Color levelUpAccentColor = Color.fromARGB(255, 255, 102, 0);

  static const Map<int, Color> appBarColor = {
    0: characterAccentColor,
    1: habitAccentColor,
    2: taskAccentColor,
  };

  static const Map<int, Color> taskPriorityColor = {
    1: Colors.green,
    2: Colors.blue,
    3: Colors.orange,
    4: Colors.red,
    5: Colors.purple
  };

  static final Map<int, TextStyle> taskPriorityFont = {
    1: TextStyle(
        fontSize: 10, color: taskPriorityColor[1], fontWeight: FontWeight.bold),
    2: TextStyle(
        fontSize: 10, color: taskPriorityColor[2], fontWeight: FontWeight.bold),
    3: TextStyle(
        fontSize: 10, color: taskPriorityColor[3], fontWeight: FontWeight.bold),
    4: TextStyle(
        fontSize: 10, color: taskPriorityColor[4], fontWeight: FontWeight.bold),
    5: TextStyle(
        fontSize: 10, color: taskPriorityColor[5], fontWeight: FontWeight.bold)
  };

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

  static const tasksCompletedHeaderFont =
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green);
  static const tasksCompletedPendingFont =
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

  static final Map<String, Color> taskScheduleColor = {
    'daily': Colors.blue,
    'weekly': Colors.green,
    'monthly': Colors.orange,
    'custom': Colors.purple
  };

  static final Map<String, TextStyle> taskScheduleFont = {
    'daily': TextStyle(
        fontSize: 10,
        color: taskScheduleColor['daily'],
        fontWeight: FontWeight.bold),
    'weekly': TextStyle(
        fontSize: 10,
        color: taskScheduleColor['weekly'],
        fontWeight: FontWeight.bold),
    'monthly': TextStyle(
        fontSize: 10,
        color: taskScheduleColor['monthly'],
        fontWeight: FontWeight.bold),
    'custom': TextStyle(
        fontSize: 10,
        color: taskScheduleColor['custom'],
        fontWeight: FontWeight.bold)
  };

  static final Map<String, TextStyle> scheduleSelectorTitleFont = {
    'daily': TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    'weekly': TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    'monthly': TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    'custom': TextStyle(fontSize: 14, fontWeight: FontWeight.bold)
  };

  static const TextStyle characterStatItemCountFont =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  static const TextStyle characterStatItemLabelFont =
      TextStyle(fontSize: 12, color: Colors.grey);
  static const Color characterStatItemBackColor =
      Color.fromARGB(255, 192, 192, 192);

  static const Color taskCompletedBackColor =
      Color.fromARGB(255, 173, 255, 179);
  static const Color taskUncompletedBackColor = Colors.white;
  static const Color taskCategoryBackColor = Colors.grey;

  static const Color habitCounterBackColor = Color.fromARGB(255, 195, 195, 195);

  static const Color completeDayBackColor = Colors.blue;
  static const Color completeDayButtonColor = Colors.blue;
  static const Color completedHabitColor = Color.fromARGB(255, 188, 255, 191);

  static const Color expPreviewChartBackColor =
      Color.fromARGB(255, 241, 241, 241);

  static const Color levelUpButtonFontColor = levelUpAccentColor;
  static const Color levelUpLabelBackColor = Color.fromARGB(255, 255, 242, 223);
  static const Color contrastHeaderFontColor = Colors.grey;
  static const Color levelUpBorderColor = levelUpAccentColor;

  static const TextStyle characterGoal = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 20, 107, 179),
  );
  static const TextStyle completeDayHint =
      TextStyle(fontSize: 14, color: Styles.contrastHeaderFontColor);
  static const TextStyle markCompletedHeader =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  static const TextStyle expPreviewTitle =
      TextStyle(fontWeight: FontWeight.bold);
  static const TextStyle expPreviewFormula =
      TextStyle(fontSize: 12, fontStyle: FontStyle.italic);
  static const TextStyle expPreviewSliderDescription =
      TextStyle(fontSize: 12, color: Colors.grey);
  static const TextStyle expPreviewSliderExtremities =
      TextStyle(fontSize: 12, color: Colors.grey);
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
  static const TextStyle habitsEmptyHint = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.grey,
  );
  static const TextStyle levelUpDetails = TextStyle(
    fontSize: 14,
    color: Color.fromARGB(255, 108, 108, 108),
    fontStyle: FontStyle.italic,
  );

  static const Icon characterTabSmallIcon = Icon(Icons.person);
  static const Icon habitsTabSmallIcon = Icon(Icons.auto_awesome);
  static const Icon tasksTabSmallIcon = Icon(Icons.task);

  static const Icon settingsIcon = Icon(Icons.settings, color: Colors.blue);
  static const Icon habitsTabLargeIcon =
      Icon(Icons.auto_awesome, size: 64, color: Colors.grey);
  static const Icon tasksTabLargeIcon =
      Icon(Icons.task, size: 64, color: Colors.grey);
  static const Icon levelUpLargeIcon = Icon(
    Icons.auto_awesome,
    size: 64,
    color: Colors.amber,
  );

  static const Icon addButtonLargeIcon = Icon(Icons.add);

  static const Icon counterIncreaseIcon = Icon(Icons.add, size: 20);
  static const Icon counterDecreaseIcon = Icon(Icons.remove, size: 20);

  static const Icon editEntryIcon =
      Icon(Icons.edit_note_outlined, color: Colors.grey, size: 20);
  static const Icon deleteEntryIcon =
      Icon(Icons.delete_outline, color: Colors.grey, size: 20);
  static const Icon entryExperienceIcon =
      Icon(Icons.star, size: 16, color: Colors.amber);
  static const Icon habitCompletionMinIcon =
      Icon(Icons.upload_outlined, size: 14, color: Colors.blue);
  static const Icon habitRepetitionIcon =
      Icon(Icons.repeat, size: 14, color: Colors.black);

  static const TextStyle entrySubtextFont = TextStyle(fontSize: 12);
  static const TextStyle addFormButtonFont =
      TextStyle(fontSize: 18, color: Colors.white);
  static const TextStyle addFormFont = TextStyle(fontSize: 16);

  static const TextStyle activeCountFont = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle inactiveCountFont = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.grey,
  );

  static const TextStyle habitNotTodayFont = TextStyle(
    fontSize: 12,
    color: Colors.grey,
  );

  static const TextStyle habitDescriptionFont = TextStyle(
    fontSize: 12,
    color: Color.fromARGB(255, 100, 100, 100),
  );

  static const TextStyle habitTodayCountFont = TextStyle(
    color: Colors.green,
    fontWeight: FontWeight.bold,
    fontSize: 12,
  );

  static const TextStyle taskStatLabelDesctiptionFont =
      TextStyle(fontSize: 12, color: Colors.grey);

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

  static const TextStyle taskCategory = TextStyle(fontSize: 10);

  static const Icon characterTabSettingsIcon =
      Icon(Icons.settings, color: Colors.grey);
  static const Icon characterTabLevelIcon =
      Icon(Icons.star, size: 20, color: Color.fromARGB(255, 25, 118, 210));
  static const Icon characterTabExperienceIcon = Icon(Icons.auto_awesome,
      size: 20, color: Color.fromARGB(255, 25, 118, 210));
  static const Icon characterTabToNextLevelIcon =
      Icon(Icons.flag, size: 20, color: Color.fromARGB(255, 25, 118, 210));

  static const Icon habitsDoneCountIcon =
      Icon(Icons.auto_awesome, color: goodAccent);

  static const Icon overviewTasksDueIcon =
      Icon(Icons.task, color: warningAccent);
  static const Icon overviewTasksDoneIcon =
      Icon(Icons.check_circle, color: goodAccent);
  static const Icon overviewOverdueIcon = Icon(Icons.warning, color: badAccent);
  static const Icon characterTabExpCurveLabelIcon =
      Icon(Icons.trending_up, size: 16, color: Colors.blue);
  static const Icon languageOptionIcon =
      Icon(Icons.language, size: 20, color: Colors.grey);

  static const TextStyle characterOverviewCountFont =
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  static const TextStyle characterOverviewLabelFont =
      TextStyle(fontSize: 12, color: Colors.grey);
  static const TextStyle characterStatItemDetailsFont =
      TextStyle(fontSize: 10, color: Color.fromARGB(255, 199, 199, 199));

  static const TextStyle characterTodayProgressFont =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  static const Color characterTabExpCurveLabelColor = Colors.blue;
  static const TextStyle characterTabExpCurveLabelFont = TextStyle(
      fontSize: 12,
      color: characterTabExpCurveLabelColor,
      fontWeight: FontWeight.bold);

  static const Icon levelUpButtonIcon = Icon(Icons.celebration);

  static final Map<String, Color> taskStateColor = {
    'completed': goodAccent,
    'overdue': badAccent,
    "today": warningAccent,
    'soon': neutralAccent
  };

  static final Map<String, Icon> taskStateIcon = {
    'completed': Icon(Icons.calendar_today,
        size: 16, color: taskStateColor['completed']),
    'overdue':
        Icon(Icons.calendar_today, size: 16, color: taskStateColor['overdue']),
    "today":
        Icon(Icons.calendar_today, size: 16, color: taskStateColor['today']),
    'soon': Icon(Icons.calendar_today, size: 16, color: taskStateColor['soon'])
  };

  static final Map<String, TextStyle> taskStateFont = {
    'completed': TextStyle(color: taskStateColor['completed']),
    'overdue': TextStyle(color: taskStateColor['overdue']),
    "today": TextStyle(color: taskStateColor['today']),
    'soon': TextStyle(color: taskStateColor['soon'])
  };

  static const Color characterProgressIndicatorBackColor =
      Color.fromARGB(255, 182, 182, 182);
  static const Color characterProgressIndicatorFrontColor = Colors.blue;

  static const bool isExpPreviewLineHueInverted = true;

  static const int expPreviewMinExp = 0;
  static const int expPreviewMinLevel = 2;
  static const int expPreviewMaxLevel = 20;

  static const double expPreviewXReservedSize = 30;
  static const double expPreviewXInterval = 2;

  static const double expPreviewYReservedSize = 60;
  //static const double expPreviewYInterval = 2;
  static const double expPreviewWidth = 500;
  static const double expPreviewHeight = 200;
  static const double expPreviewMinLineHue = 0;
  static const double expPreviewMaxLineHue = 210;
  static const double expPreviewLineSaturation = 0.7;
  static const double expPreviewLineLightness = 0.6;
  static const double expPreviewLineWidth = 3;

  static const Map<String, double> border = {
    'tiny': 2,
    'small': 4,
    'medium': 8,
  };

  static const double fallbackBorder = 4;

  static const Map<String, double> gap = {
    'minimum': 2,
    'tiny': 4,
    'small': 8,
    'medium': 12,
    'large': 16,
    'giant': 24,
    'titanic': 32,
  };

  static const double fallbackGap = 4;

  static const Map<String, double> radius = {
    'tiny': 4,
    'small': 8,
    'medium': 10,
    'large': 16,
    'giant': 20
  };

  static const double fallbackRadius = 4;
}
