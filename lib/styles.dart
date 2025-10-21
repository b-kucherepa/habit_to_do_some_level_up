import 'package:flutter/material.dart';

abstract class Styles {
  static const Color fallbackColor = Colors.grey;
  static const Color badAccent = Colors.red;
  static const Color warningAccent = Colors.orange;
  static const Color goodAccent = Colors.green;
  static const Color neutralAccent = Colors.blue;
  static const Color noAccent = Colors.blue;

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

  static const Icon overviewHabitsCountIcon =
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

  static const Icon levelUpButtonIcon = Icon(Icons.celebration);

  static const Color taskDueCompletedColor = goodAccent;
  static const Color taskDueOverdueColor = badAccent;
  static const Color taskDueTodayColor = warningAccent;
  static const Color taskDueSoonColor = neutralAccent;

  static const Icon taskDueCompletedIcon =
      Icon(Icons.calendar_today, size: 16, color: taskDueCompletedColor);
  static const Icon taskDueOverdueIcon =
      Icon(Icons.calendar_today, size: 16, color: taskDueOverdueColor);
  static const Icon taskDueTodayIcon =
      Icon(Icons.calendar_today, size: 16, color: taskDueTodayColor);
  static const Icon taskDueSoonIcon =
      Icon(Icons.calendar_today, size: 16, color: taskDueSoonColor);

  static const TextStyle taskDueCompletedFont =
      TextStyle(color: taskDueCompletedColor);
  static const TextStyle taskDueOverdueFont =
      TextStyle(color: taskDueOverdueColor);
  static const TextStyle taskDueTodayFont = TextStyle(color: taskDueTodayColor);
  static const TextStyle taskDueSoonFont = TextStyle(color: taskDueSoonColor);

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

  static const double tinyBorder = 2.0;

  static const double minimumGap = 2;
  static const double tinyGap = 4;
  static const double smallGap = 8;
  static const double mediumGap = 12;
  static const double largeGap = 16;
  static const double giantGap = 24;
  static const double titanicGap = 32;

  static const double tinyRadius = 4;
  static const double smallRadius = 8;
  static const double mediumRadius = 10;
  static const double largeRadius = 16;
  static const double giantRadius = 20;

  //static const
}
