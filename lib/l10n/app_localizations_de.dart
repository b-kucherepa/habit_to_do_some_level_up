// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Gewohnheit: Level Up deines Lebens!';

  @override
  String get home => 'Startseite';

  @override
  String get settings => 'Einstellungen';

  @override
  String get addHabit => 'Gewohnheit hinzufügen';

  @override
  String get addTask => 'Aufgabe hinzufügen';

  @override
  String get editHabit => 'Gewohnheit bearbeiten';

  @override
  String get editTask => 'Aufgabe bearbeiten';

  @override
  String get toNext => 'Zum Nächsten';

  @override
  String get completeDayHint => 'Verpassten Tag abschließen';

  @override
  String get markCompletedHabitsHint => 'Erledigte Gewohnheiten für diesen Tag markieren:';

  @override
  String get skipDayButton => 'Diesen Tag überspringen';

  @override
  String get completeDayButton => 'Tag abschließen';

  @override
  String get scheduleType => 'Zeitplantyp';

  @override
  String get habits => 'Gewohnheiten';

  @override
  String get habitsDone => 'Gewohnheiten erledigt';

  @override
  String get tasks => 'Aufgaben';

  @override
  String get tasksDue => 'Fällige Aufgaben';

  @override
  String get tasksDone => 'Aufgaben erledigt';

  @override
  String get level => 'Level';

  @override
  String get todaysProgress => 'Heutiger Fortschritt';

  @override
  String get experienceShort => 'EP';

  @override
  String get congratulations => 'Herzlichen Glückwunsch!';

  @override
  String levelReached(Object level) {
    return 'Level $level erreicht!';
  }

  @override
  String get continueButton => 'Weiter';

  @override
  String dontForgetToUseAchievenents(Object goal) {
    return 'Vergiss nicht, deine Erfolge zu nutzen, um... $goal!';
  }

  @override
  String get goal => 'Ziel';

  @override
  String get defaultGoal => 'Level up deines Lebens!';

  @override
  String playerProgressToLevel(Object level) {
    return 'Fortschritt zu Level';
  }

  @override
  String get overdue => 'Überfällig';

  @override
  String get goalMotivation => 'Zielmotivation';

  @override
  String get goalMotivationHint => 'Wofür sammelst du Erfahrungspunkte?';

  @override
  String get language => 'Sprache';

  @override
  String get english => 'Englisch';

  @override
  String get russian => 'Russisch';

  @override
  String get german => 'Deutsch';

  @override
  String get french => 'Französisch';

  @override
  String get spanish => 'Spanisch';

  @override
  String get portuguese => 'Portugiesisch';

  @override
  String get polish => 'Polnisch';

  @override
  String get italian => 'Italienisch';

  @override
  String get dutch => 'Niederländisch';

  @override
  String get swedish => 'Schwedisch';

  @override
  String get norwegian => 'Norwegisch';

  @override
  String get finnish => 'Finnisch';

  @override
  String get armenian => 'Armenisch';

  @override
  String get turkish => 'Türkisch';

  @override
  String get chinese => 'Chinesisch';

  @override
  String get japanese => 'Japanisch';

  @override
  String get korean => 'Koreanisch';

  @override
  String get hindi => 'Hindi';

  @override
  String get arabic => 'Arabisch';

  @override
  String get hebrew => 'Hebräisch';

  @override
  String get curveExponent => 'Kurvenexponent';

  @override
  String curveExponentDescription(Object exponent) {
    return 'Kurvenexponent: $exponent. Werte <1 machen frühe Level einfacher, >1 machen spätere Level einfacher';
  }

  @override
  String get experienceMultiplier => 'Erfahrungsmultiplikator';

  @override
  String experienceMultiplierDescription(Object multiplier) {
    return 'Erfahrungsmultiplikator: $multiplier. Höhere Werte machen das Leveln langsamer';
  }

  @override
  String get levelProgressionPreview => 'Level-Fortschrittsvorschau:';

  @override
  String levelFormula(Object exponent, Object multiplier) {
    return 'Formel: EP = $multiplier × (Level-1)^$exponent';
  }

  @override
  String get cancel => 'Abbrechen';

  @override
  String get save => 'Speichern';

  @override
  String get habitFormTitle => 'Gewohnheitstitel';

  @override
  String get habitFormTitleError => 'Bitte einen Titel eingeben';

  @override
  String get habitFormDescription => 'Beschreibung';

  @override
  String get habitFormExperience => 'Erfahrungspunkte';

  @override
  String get habitFormExperienceError => 'Bitte Erfahrungspunkte eingeben';

  @override
  String get habitFormNumberError => 'Bitte eine gültige Zahl eingeben';

  @override
  String get habitFormMinCompletion => 'Mindestabsolvierung';

  @override
  String get habitFormMinCompletionError => 'Bitte Mindestanzahl eingeben';

  @override
  String get habitFormMinCountError => 'Mindestens 1';

  @override
  String get habitFormUpdate => 'Gewohnheit aktualisieren';

  @override
  String get habitFormSave => 'Gewohnheit speichern';

  @override
  String get habitFormWeeklyError => 'Bitte wähle mindestens einen Tag für wöchentlichen Zeitplan';

  @override
  String get habitFormMonthlyError => 'Bitte wähle mindestens einen Tag für monatlichen Zeitplan';

  @override
  String get habitFormCustomError => 'Bitte Intervall für benutzerdefinierten Zeitplan wählen';

  @override
  String habitItemExperience(Object experience) {
    return '$experience EP';
  }

  @override
  String habitItemMinCompletion(Object minCompletionCount) {
    return 'min. $minCompletionCount';
  }

  @override
  String habitItemDoneSequence(Object karma) {
    return '$karma Serie';
  }

  @override
  String get habitItemEditTooltip => 'Gewohnheit bearbeiten';

  @override
  String get habitItemDeleteTooltip => 'Gewohnheit löschen';

  @override
  String get habitItemScheduleDaily => 'täglich';

  @override
  String get habitItemScheduleWeekly => 'wöchentlich';

  @override
  String get habitItemScheduleMonthly => 'monatlich';

  @override
  String get habitItemScheduleCustom => 'benutzerdefiniert';

  @override
  String get habitItemDeleteConfirmationTitle => 'Gewohnheit löschen';

  @override
  String habitItemDeleteConfirmationMessage(Object habitTitle) {
    return 'Bist du sicher, dass du \"$habitTitle\" löschen möchtest?';
  }

  @override
  String habitItemDeleteConfirmationWarning(Object xpAmount) {
    return '⚠️ Dies entfernt $xpAmount EP von deinem Spieler!';
  }

  @override
  String get habitItemDeleteConfirmationCancel => 'Abbrechen';

  @override
  String get habitItemDeleteConfirmationDelete => 'Löschen';

  @override
  String get habitsTabEmptyTitle => 'Noch keine Gewohnheiten!';

  @override
  String get habitsTabEmptySubtitle => 'Tippe auf den + Button, um deine erste Gewohnheit hinzuzufügen';

  @override
  String get taskFormTitle => 'Aufgabentitel';

  @override
  String get taskFormTitleError => 'Bitte einen Titel eingeben';

  @override
  String get taskFormDescription => 'Beschreibung';

  @override
  String get taskFormExperience => 'Erfahrungspunkte';

  @override
  String get taskFormExperienceError => 'Bitte Erfahrungspunkte eingeben';

  @override
  String get taskFormNumberError => 'Bitte eine gültige Zahl eingeben';

  @override
  String taskFormDueDateLabel(Object date) {
    return 'Fälligkeitsdatum: $date';
  }

  @override
  String get taskFormSelectDate => 'Datum auswählen';

  @override
  String taskFormPriorityLabel(Object priority) {
    return 'Priorität: $priority';
  }

  @override
  String get taskFormCategory => 'Kategorie';

  @override
  String get taskFormUpdate => 'Aufgabe aktualisieren';

  @override
  String get taskFormSave => 'Aufgabe speichern';

  @override
  String get taskCategoryWork => 'Arbeit';

  @override
  String get taskCategoryPersonal => 'Privat';

  @override
  String get taskCategoryHealth => 'Gesundheit';

  @override
  String get taskCategoryLearning => 'Lernen';

  @override
  String get taskCategoryGeneral => 'Allgemein';

  @override
  String get taskCategoryHome => 'Haushalt';

  @override
  String get taskCategorySocial => 'Soziales';

  @override
  String get taskCategoryOther => 'Andere';

  @override
  String get tasksTabEmptyTitle => 'Noch keine Aufgaben!';

  @override
  String get tasksTabEmptySubtitle => 'Tippe auf den + Button, um deine erste Aufgabe hinzuzufügen';

  @override
  String get tasksTabCompletedHeader => 'Abgeschlossene Aufgaben';

  @override
  String tasksTabExperience(Object experience) {
    return '$experience EP';
  }

  @override
  String get tasksTabEditTooltip => 'Aufgabe bearbeiten';

  @override
  String get tasksTabDeleteTooltip => 'Aufgabe löschen';

  @override
  String get tasksTabDeleteConfirmationTitle => 'Aufgabe löschen';

  @override
  String tasksTabDeleteConfirmationMessage(Object taskTitle) {
    return 'Bist du sicher, dass du \"$taskTitle\" löschen möchtest?';
  }

  @override
  String tasksTabDeleteConfirmationWarning(Object xpAmount) {
    return '⚠️ Dies entfernt $xpAmount EP von deinem Spieler!';
  }

  @override
  String get tasksTabDeleteConfirmationCancel => 'Abbrechen';

  @override
  String get tasksTabDeleteConfirmationDelete => 'Löschen';

  @override
  String get tasksTabDueToday => 'Heute';

  @override
  String get tasksTabDueTomorrow => 'Morgen';

  @override
  String get tasksTabDueYesterday => 'Gestern';

  @override
  String tasksTabDueDaysAgo(num days) {
    return 'vor $days Tagen';
  }

  @override
  String tasksTabDueInDays(num days) {
    return 'In $days Tagen';
  }

  @override
  String get scheduleSelectorTitle => 'Zeitplantyp';

  @override
  String get scheduleTypeDaily => 'Täglich';

  @override
  String get scheduleTypeWeekly => 'Wöchentlich';

  @override
  String get scheduleTypeMonthly => 'Monatlich';

  @override
  String get scheduleTypeCustom => 'Benutzerdefiniertes Intervall';

  @override
  String get scheduleWeeklyTitle => 'Tage auswählen:';

  @override
  String get scheduleMonthlyTitle => 'Tage des Monats auswählen:';

  @override
  String get scheduleCustomTitle => 'Wiederhole alle X Tage:';

  @override
  String scheduleCustomInterval(num days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days Tage',
      one: '1 Tag',
    );
    return '$_temp0';
  }

  @override
  String get scheduleCustomError => 'Bitte Intervall auswählen';

  @override
  String get weekdayMonday => 'Mo';

  @override
  String get weekdayTuesday => 'Di';

  @override
  String get weekdayWednesday => 'Mi';

  @override
  String get weekdayThursday => 'Do';

  @override
  String get weekdayFriday => 'Fr';

  @override
  String get weekdaySaturday => 'Sa';

  @override
  String get weekdaySunday => 'So';

  @override
  String get resetProgress => 'Fortschritt zurücksetzen';

  @override
  String get resetConfirmationTitle => 'Zurücksetzen';

  @override
  String get resetConfirmationMessage => 'Bist du sicher, dass du deinen Fortschritt zurücksetzen möchtest? Dies setzt Einstellungen, Ziel, Level und Erfahrungspunkte zurück und setzt das Erstellungsdatum auf jetzt. Deine Gewohnheiten und Aufgaben werden jedoch nicht beeinflusst. Diese Aktion kann nicht rückgängig gemacht werden.';

  @override
  String get resetSuccess => 'Fortschrittsdaten wurden erfolgreich zurückgesetzt!';
}
