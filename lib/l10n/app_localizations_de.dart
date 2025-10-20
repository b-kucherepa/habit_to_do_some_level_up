// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'RPG Todo & Gewohnheiten';

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
  String get save => 'Speichern';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get delete => 'Löschen';

  @override
  String get edit => 'Bearbeiten';

  @override
  String get toNext => 'Zum Nächsten';

  @override
  String get habitTitle => 'Gewohnheitstitel';

  @override
  String get completeDayHint => 'Verpassten Tag abschließen';

  @override
  String get markCompletedHabitsHint => 'Erledigte Gewohnheiten für diesen Tag markieren:';

  @override
  String get skipDayButton => 'Diesen Tag überspringen';

  @override
  String get completeDayButton => 'Tag abschließen';

  @override
  String get habitDescription => 'Beschreibung';

  @override
  String get experiencePoints => 'Erfahrungspunkte';

  @override
  String get minCompletionCount => 'Mindestabsolvierungsanzahl';

  @override
  String get scheduleType => 'Zeitplantyp';

  @override
  String get daily => 'Täglich';

  @override
  String get weekly => 'Wöchentlich';

  @override
  String get monthly => 'Monatlich';

  @override
  String get custom => 'Benutzerdefiniert';

  @override
  String get selectDays => 'Tage auswählen';

  @override
  String get monday => 'Montag';

  @override
  String get tuesday => 'Dienstag';

  @override
  String get wednesday => 'Mittwoch';

  @override
  String get thursday => 'Donnerstag';

  @override
  String get friday => 'Freitag';

  @override
  String get saturday => 'Samstag';

  @override
  String get sunday => 'Sonntag';

  @override
  String get character => 'Charakter';

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
  String habitsNumberToday(Object habitsNumber) {
    return '$habitsNumber heute';
  }

  @override
  String get todaysProgress => 'Heutiger Fortschritt';

  @override
  String get experience => 'Erfahrung';

  @override
  String get experienceShort => 'EP';

  @override
  String get congratulations => 'Glückwunsch!';

  @override
  String levelReached(Object level) {
    return 'Level $level erreicht!';
  }

  @override
  String get continueButton => 'Weiter';

  @override
  String dontForgetToUseAchievenents(Object goal) {
    return 'Vergiss nicht, deine Erfolge zu nutzen, um $goal!';
  }

  @override
  String expCurveLabel(Object exponent, Object multiplier) {
    return 'Kurvenexponent: $exponent, Multiplikator: $multiplier';
  }

  @override
  String get goal => 'Ziel';

  @override
  String get defaultGoal => 'Sammle Erfahrung für deine RPG-Reise!';

  @override
  String get progress => 'Fortschritt';

  @override
  String get progressToLevel => 'Fortschritt zu Level';

  @override
  String get completed => 'Abgeschlossen';

  @override
  String get pending => 'Ausstehend';

  @override
  String get overdue => 'Überfällig';

  @override
  String get dueToday => 'Heute fällig';

  @override
  String get dueSoon => 'Demnächst fällig';

  @override
  String get karma => 'Karma';

  @override
  String get karmaLevel => 'Karma-Level';

  @override
  String get karmaDescription => 'Dein Karma-Level spiegelt deine Beständigkeit wider.';

  @override
  String get resetProgress => 'Fortschritt zurücksetzen';

  @override
  String get resetProgressTitle => 'Fortschritt zurücksetzen?';

  @override
  String get resetProgressDescription => 'Diese Aktion setzt dauerhaft zurück:';

  @override
  String get resetWarningExperience => 'Alle Charaktererfahrung und Level';

  @override
  String get resetWarningHabits => 'Absolvierungshistorie aller Gewohnheiten';

  @override
  String get resetWarningKarma => 'Karma-Levels aller Gewohnheiten';

  @override
  String get resetTasksUnaffected => 'Aufgaben sind nicht betroffen.';

  @override
  String get resetCannotUndone => 'Diese Aktion kann nicht rückgängig gemacht werden!';

  @override
  String get resetCancel => 'Abbrechen';

  @override
  String get resetConfirm => 'Fortschritt zurücksetzen';

  @override
  String get resetSuccess => 'Fortschritt wurde erfolgreich zurückgesetzt!';

  @override
  String get progressSettings => 'Fortschritts-Einstellungen';

  @override
  String get goalMotivation => 'Zielmotivation';

  @override
  String get goalMotivationHint => 'Wofür sammelst du Erfahrung?';

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
  String get chinese => 'Chinesisch';

  @override
  String get japanese => 'Japanisch';

  @override
  String get korean => 'Koreanisch';

  @override
  String get hindi => 'Hindi';

  @override
  String get arabic => 'Arabish';

  @override
  String get hebrew => 'Hebräisch';

  @override
  String get curveExponent => 'Kurvenexponent';

  @override
  String curveExponentDescription(Object exponent) {
    return 'Kurvenexponent: $exponent. Werte <1 erleichtern frühe Level, >1 erleichtern spätere Level';
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
  String levelFormula(Object multiplier, Object exponent) {
    return 'Formel: EP = $multiplier × (Level-1)^$exponent';
  }

  @override
  String get habitFormTitle => 'Gewohnheitstitel';

  @override
  String get habitFormTitleError => 'Bitte gib einen Titel ein';

  @override
  String get habitFormDescription => 'Beschreibung';

  @override
  String get habitFormExperience => 'Erfahrungspunkte';

  @override
  String get habitFormExperienceError => 'Bitte Erfahrung eingeben';

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
  String get habitFormCustomError => 'Bitte Intervall für benutzerdefinierten Zeitplan auswählen';

  @override
  String habitItemExperience(Object experience) {
    return '$experience EP';
  }

  @override
  String habitItemMinCompletion(Object minCompletionCount) {
    return 'min $minCompletionCount';
  }

  @override
  String habitItemTodayCount(Object currentCount) {
    return '$currentCount heute';
  }

  @override
  String get habitItemNotToday => 'Nicht heute';

  @override
  String get habitItemEditTooltip => 'Gewohnheit bearbeiten';

  @override
  String get habitItemDeleteTooltip => 'Gewohnheit löschen';

  @override
  String get habitItemScheduleDaily => 'Täglich';

  @override
  String get habitItemScheduleWeekly => 'Wöchentlich';

  @override
  String get habitItemScheduleMonthly => 'Monatlich';

  @override
  String get habitItemScheduleCustom => 'Benutzerdefiniert';

  @override
  String get habitItemDeleteConfirmationTitle => 'Gewohnheit löschen';

  @override
  String habitItemDeleteConfirmationMessage(Object habitTitle) {
    return 'Bist du sicher, dass du \"$habitTitle\" löschen möchtest?';
  }

  @override
  String habitItemDeleteConfirmationWarning(Object xpAmount) {
    return '⚠️ Dies entfernt $xpAmount EP von deinem Charakter!';
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
  String get taskFormTitleError => 'Bitte gib einen Titel ein';

  @override
  String get taskFormDescription => 'Beschreibung';

  @override
  String get taskFormExperience => 'Erfahrungspunkte';

  @override
  String get taskFormExperienceError => 'Bitte Erfahrung eingeben';

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
  String get taskCategoryPersonal => 'Persönlich';

  @override
  String get taskCategoryHealth => 'Gesundheit';

  @override
  String get taskCategoryLearning => 'Lernen';

  @override
  String get taskCategoryOther => 'Andere';

  @override
  String get tasksTabEmptyTitle => 'Noch keine Aufgaben!';

  @override
  String get tasksTabEmptySubtitle => 'Tippe auf den + Button, um deine erste Aufgabe hinzuzufügen';

  @override
  String get tasksTabTotal => 'Gesamt';

  @override
  String get tasksTabPending => 'Ausstehend';

  @override
  String get tasksTabDone => 'Erledigt';

  @override
  String tasksTabPendingHeader(Object count) {
    return 'Ausstehende Aufgaben ($count)';
  }

  @override
  String tasksTabCompletedHeader(Object count) {
    return 'Abgeschlossene Aufgaben ($count)';
  }

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
    return '⚠️ Dies entfernt $xpAmount EP von deinem Charakter!';
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
  String tasksTabDueDaysAgo(Object days) {
    return 'Vor $days Tagen';
  }

  @override
  String tasksTabDueInDays(Object days) {
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
}
