// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'Nawyk Do Zrobienia - Awansuj na Wyższy Poziom!';

  @override
  String get home => 'Główna';

  @override
  String get settings => 'Ustawienia';

  @override
  String get addHabit => 'Dodaj Nawyk';

  @override
  String get addTask => 'Dodaj Zadanie';

  @override
  String get editHabit => 'Edytuj Nawyk';

  @override
  String get editTask => 'Edytuj Zadanie';

  @override
  String get toNext => 'Do Następnego';

  @override
  String get completeDayHint => 'Uzupełnij Pominięty Dzień';

  @override
  String get markCompletedHabitsHint => 'Oznacz ukończone nawyki na ten dzień:';

  @override
  String get skipDayButton => 'Pomiń Ten Dzień';

  @override
  String get completeDayButton => 'Ukończ Dzień';

  @override
  String get scheduleType => 'Typ Harmonogramu';

  @override
  String get habits => 'Nawyki';

  @override
  String get habitsDone => 'Wykonane Nawyków';

  @override
  String get tasks => 'Zadania';

  @override
  String get tasksDue => 'Zadania Terminowe';

  @override
  String get tasksDone => 'Wykonane Zadań';

  @override
  String get level => 'Poziom';

  @override
  String get todaysProgress => 'Dzisiejszy Postęp';

  @override
  String get experienceShort => 'PD';

  @override
  String get congratulations => 'Gratulacje!';

  @override
  String levelReached(Object level) {
    return 'Osiągnięto poziom $level!';
  }

  @override
  String get continueButton => 'Kontynuuj';

  @override
  String dontForgetToUseAchievenents(Object goal) {
    return 'Nie zapomnij wykorzystać swoich osiągnięć, aby... $goal!';
  }

  @override
  String get goal => 'Cel';

  @override
  String get defaultGoal => 'Awansuj swoje życie!';

  @override
  String playerProgressToLevel(Object level) {
    return 'Postęp do Poziomu';
  }

  @override
  String get overdue => 'Po Terminie';

  @override
  String get goalMotivation => 'Motywacja Celu';

  @override
  String get goalMotivationHint => 'Po co zdobywasz doświadczenie?';

  @override
  String get language => 'Język';

  @override
  String get english => 'Angielski';

  @override
  String get russian => 'Rosyjski';

  @override
  String get german => 'Niemiecki';

  @override
  String get french => 'Francuski';

  @override
  String get spanish => 'Hiszpański';

  @override
  String get portuguese => 'Portugalski';

  @override
  String get polish => 'Polski';

  @override
  String get italian => 'Włoski';

  @override
  String get dutch => 'Holenderski';

  @override
  String get swedish => 'Szwedzki';

  @override
  String get norwegian => 'Norweski';

  @override
  String get finnish => 'Fiński';

  @override
  String get armenian => 'Ormiański';

  @override
  String get turkish => 'Turecki';

  @override
  String get chinese => 'Chiński';

  @override
  String get japanese => 'Japoński';

  @override
  String get korean => 'Koreański';

  @override
  String get hindi => 'Hindi';

  @override
  String get arabic => 'Arabski';

  @override
  String get hebrew => 'Hebrajski';

  @override
  String get curveExponent => 'Wykładnik Krzywej';

  @override
  String curveExponentDescription(Object exponent) {
    return 'Wykładnik krzywej: $exponent. Wartości <1 ułatwiają wczesne poziomy, >1 ułatwiają późniejsze poziomy';
  }

  @override
  String get experienceMultiplier => 'Mnożnik Doświadczenia';

  @override
  String experienceMultiplierDescription(Object multiplier) {
    return 'Mnożnik doświadczenia: $multiplier. Wyższe wartości spowalniają awansowanie';
  }

  @override
  String get levelProgressionPreview => 'Podgląd Postępu Poziomów:';

  @override
  String levelFormula(Object exponent, Object multiplier) {
    return 'Wzór: PD = $multiplier × (Poziom-1)^$exponent';
  }

  @override
  String get cancel => 'Anuluj';

  @override
  String get save => 'Zapisz';

  @override
  String get habitFormTitle => 'Tytuł Nawyków';

  @override
  String get habitFormTitleError => 'Proszę podać tytuł';

  @override
  String get habitFormDescription => 'Opis';

  @override
  String get habitFormExperience => 'Punkty Doświadczenia';

  @override
  String get habitFormExperienceError => 'Proszę podać doświadczenie';

  @override
  String get habitFormNumberError => 'Proszę podać prawidłową liczbę';

  @override
  String get habitFormMinCompletion => 'Min. Wykonań';

  @override
  String get habitFormMinCompletionError => 'Proszę podać minimalną liczbę';

  @override
  String get habitFormMinCountError => 'Co najmniej 1';

  @override
  String get habitFormUpdate => 'Aktualizuj Nawyk';

  @override
  String get habitFormSave => 'Zapisz Nawyk';

  @override
  String get habitFormWeeklyError => 'Proszę wybrać co najmniej jeden dzień dla harmonogramu tygodniowego';

  @override
  String get habitFormMonthlyError => 'Proszę wybrać co najmniej jeden dzień dla harmonogramu miesięcznego';

  @override
  String get habitFormCustomError => 'Proszę wybrać interwał dla harmonogramu niestandardowego';

  @override
  String habitItemExperience(Object experience) {
    return '$experience PD';
  }

  @override
  String habitItemMinCompletion(Object minCompletionCount) {
    return 'min. $minCompletionCount';
  }

  @override
  String habitItemDoneSequence(Object karma) {
    return 'seria $karma';
  }

  @override
  String get habitItemEditTooltip => 'Edytuj nawyk';

  @override
  String get habitItemDeleteTooltip => 'Usuń nawyk';

  @override
  String get habitItemScheduleDaily => 'codziennie';

  @override
  String get habitItemScheduleWeekly => 'tygodniowo';

  @override
  String get habitItemScheduleMonthly => 'miesięcznie';

  @override
  String get habitItemScheduleCustom => 'niestandardowo';

  @override
  String get habitItemDeleteConfirmationTitle => 'Usuń Nawyk';

  @override
  String habitItemDeleteConfirmationMessage(Object habitTitle) {
    return 'Czy na pewno chcesz usunąć \"$habitTitle\"?';
  }

  @override
  String habitItemDeleteConfirmationWarning(Object xpAmount) {
    return '⚠️ To usunie $xpAmount PD z twojej postaci!';
  }

  @override
  String get habitItemDeleteConfirmationCancel => 'Anuluj';

  @override
  String get habitItemDeleteConfirmationDelete => 'Usuń';

  @override
  String get habitsTabEmptyTitle => 'Brak nawyków!';

  @override
  String get habitsTabEmptySubtitle => 'Kliknij przycisk +, aby dodać pierwszy nawyk';

  @override
  String get habitsTabOnOtherDaysHeader => 'On other days';

  @override
  String get taskFormTitle => 'Tytuł Zadania';

  @override
  String get taskFormTitleError => 'Proszę podać tytuł';

  @override
  String get taskFormDescription => 'Opis';

  @override
  String get taskFormExperience => 'Punkty Doświadczenia';

  @override
  String get taskFormExperienceError => 'Proszę podać doświadczenie';

  @override
  String get taskFormNumberError => 'Proszę podać prawidłową liczbę';

  @override
  String taskFormDueDateLabel(Object date) {
    return 'Termin: $date';
  }

  @override
  String get taskFormSelectDate => 'Wybierz Datę';

  @override
  String taskFormPriorityLabel(Object priority) {
    return 'Priorytet: $priority';
  }

  @override
  String get taskFormCategory => 'Kategoria';

  @override
  String get taskFormUpdate => 'Aktualizuj Zadanie';

  @override
  String get taskFormSave => 'Zapisz Zadanie';

  @override
  String get taskCategoryWork => 'Praca';

  @override
  String get taskCategoryPersonal => 'Osobiste';

  @override
  String get taskCategoryHealth => 'Zdrowie';

  @override
  String get taskCategoryLearning => 'Nauka';

  @override
  String get taskCategoryHome => 'Dom';

  @override
  String get taskCategorySocial => 'Społeczne';

  @override
  String get taskCategoryOther => 'Inne';

  @override
  String get tasksTabEmptyTitle => 'Brak zadań!';

  @override
  String get tasksTabEmptySubtitle => 'Kliknij przycisk +, aby dodać pierwsze zadanie';

  @override
  String get tasksTabCompletedHeader => 'Ukończone Zadania';

  @override
  String tasksTabExperience(Object experience) {
    return '$experience PD';
  }

  @override
  String get tasksTabEditTooltip => 'Edytuj zadanie';

  @override
  String get tasksTabDeleteTooltip => 'Usuń zadanie';

  @override
  String get tasksTabDeleteConfirmationTitle => 'Usuń Zadanie';

  @override
  String tasksTabDeleteConfirmationMessage(Object taskTitle) {
    return 'Czy na pewno chcesz usunąć \"$taskTitle\"?';
  }

  @override
  String tasksTabDeleteConfirmationWarning(Object xpAmount) {
    return '⚠️ To usunie $xpAmount PD z twojej postaci!';
  }

  @override
  String get tasksTabDeleteConfirmationCancel => 'Anuluj';

  @override
  String get tasksTabDeleteConfirmationDelete => 'Usuń';

  @override
  String get tasksTabDueToday => 'Dzisiaj';

  @override
  String get tasksTabDueTomorrow => 'Jutro';

  @override
  String get tasksTabDueYesterday => 'Wczoraj';

  @override
  String tasksTabDueDaysAgo(num days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '# dni temu',
      many: '# dni temu',
      few: '# dni temu',
      one: '# dzień temu',
    );
    return '$_temp0';
  }

  @override
  String tasksTabDueInDays(num days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '# dni',
      many: '# dni',
      few: '# dni',
      one: '# dzień',
    );
    return 'Za $_temp0';
  }

  @override
  String get scheduleSelectorTitle => 'Typ Harmonogramu';

  @override
  String get scheduleTypeDaily => 'Codziennie';

  @override
  String get scheduleTypeWeekly => 'Tygodniowo';

  @override
  String get scheduleTypeMonthly => 'Miesięcznie';

  @override
  String get scheduleTypeCustom => 'Niestandardowy Interwał';

  @override
  String get scheduleWeeklyTitle => 'Wybierz dni:';

  @override
  String get scheduleMonthlyTitle => 'Wybierz dni miesiąca:';

  @override
  String get scheduleCustomTitle => 'Powtarzaj co X dni:';

  @override
  String scheduleCustomInterval(num days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '# dni',
      many: '# dni',
      few: '# dni',
      one: '1 dzień',
    );
    return '$_temp0';
  }

  @override
  String get scheduleCustomError => 'Proszę wybrać interwał';

  @override
  String get weekdayMonday => 'Pon';

  @override
  String get weekdayTuesday => 'Wt';

  @override
  String get weekdayWednesday => 'Śr';

  @override
  String get weekdayThursday => 'Czw';

  @override
  String get weekdayFriday => 'Pt';

  @override
  String get weekdaySaturday => 'Sob';

  @override
  String get weekdaySunday => 'Niedz';

  @override
  String get resetProgress => 'Resetuj Postęp';

  @override
  String get resetConfirmationTitle => 'Resetuj';

  @override
  String get resetConfirmationMessage => 'Czy na pewno chcesz zresetować swój postęp? Spowoduje to zresetowanie ustawień, celu, poziomu i doświadczenia oraz ustawi datę utworzenia na teraz. Twoje nawyki i zadania nie zostaną jednak naruszone. Tej czynności nie można cofnąć.';

  @override
  String get resetSuccess => 'Dane postępu zostały pomyślnie zresetowane!';
}
