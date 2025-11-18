// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Abitudine per Migliorarsi!';

  @override
  String get home => 'Home';

  @override
  String get settings => 'Impostazioni';

  @override
  String get addHabit => 'Aggiungi Abitudine';

  @override
  String get addTask => 'Aggiungi Compito';

  @override
  String get editHabit => 'Modifica Abitudine';

  @override
  String get editTask => 'Modifica Compito';

  @override
  String get toNext => 'Prossimo';

  @override
  String get completeDayHint => 'Completa Giorno Saltato';

  @override
  String get markCompletedHabitsHint => 'Segna le abitudini completate per questo giorno:';

  @override
  String get skipDayButton => 'Salta Questo Giorno';

  @override
  String get completeDayButton => 'Completa Giorno';

  @override
  String get scheduleType => 'Tipo di Programmazione';

  @override
  String get habits => 'Abitudini';

  @override
  String get habitsDone => 'Abitudini Completate';

  @override
  String get tasks => 'Compiti';

  @override
  String get tasksDue => 'Compiti in Scadenza';

  @override
  String get tasksDone => 'Compiti Completati';

  @override
  String get level => 'Livello';

  @override
  String get todaysProgress => 'Progresso di Oggi';

  @override
  String get experienceShort => 'EXP';

  @override
  String get congratulations => 'Congratulazioni!';

  @override
  String levelReached(Object level) {
    return 'Livello $level raggiunto!';
  }

  @override
  String get continueButton => 'Continua';

  @override
  String dontForgetToUseAchievenents(Object goal) {
    return 'Non dimenticare di usare i tuoi successi per... $goal!';
  }

  @override
  String get goal => 'Obiettivo';

  @override
  String get defaultGoal => 'Migliora la tua vita!';

  @override
  String playerProgressToLevel(Object level) {
    return 'Progresso verso Livello';
  }

  @override
  String get overdue => 'In Ritardo';

  @override
  String get goalMotivation => 'Motivazione Obiettivo';

  @override
  String get goalMotivationHint => 'Per cosa stai accumulando esperienza?';

  @override
  String get language => 'Lingua';

  @override
  String get english => 'Inglese';

  @override
  String get russian => 'Russo';

  @override
  String get german => 'Tedesco';

  @override
  String get french => 'Francese';

  @override
  String get spanish => 'Spagnolo';

  @override
  String get portuguese => 'Portoghese';

  @override
  String get polish => 'Polacco';

  @override
  String get italian => 'Italiano';

  @override
  String get dutch => 'Olandese';

  @override
  String get swedish => 'Svedese';

  @override
  String get norwegian => 'Norvegese';

  @override
  String get finnish => 'Finlandese';

  @override
  String get armenian => 'Armeno';

  @override
  String get turkish => 'Turco';

  @override
  String get chinese => 'Cinese';

  @override
  String get japanese => 'Giapponese';

  @override
  String get korean => 'Coreano';

  @override
  String get hindi => 'Hindi';

  @override
  String get arabic => 'Arabo';

  @override
  String get hebrew => 'Ebraico';

  @override
  String get curveExponent => 'Esponente della Curva';

  @override
  String curveExponentDescription(Object exponent) {
    return 'Esponente della curva: $exponent. Valori <1 rendono i primi livelli più facili, >1 rendono i livelli successivi più facili';
  }

  @override
  String get experienceMultiplier => 'Moltiplicatore Esperienza';

  @override
  String experienceMultiplierDescription(Object multiplier) {
    return 'Moltiplicatore esperienza: $multiplier. Valori più alti rendono il salire di livello più lento';
  }

  @override
  String get levelProgressionPreview => 'Anteprima Progresso Livelli:';

  @override
  String levelFormula(Object exponent, Object multiplier) {
    return 'Formula: EXP = $multiplier × (Livello-1)^$exponent';
  }

  @override
  String get cancel => 'Annulla';

  @override
  String get save => 'Salva';

  @override
  String get habitFormTitle => 'Titolo Abitudine';

  @override
  String get habitFormTitleError => 'Inserisci un titolo';

  @override
  String get habitFormDescription => 'Descrizione';

  @override
  String get habitFormExperience => 'Punti Esperienza';

  @override
  String get habitFormExperienceError => 'Inserisci l\'esperienza';

  @override
  String get habitFormNumberError => 'Inserisci un numero valido';

  @override
  String get habitFormMinCompletion => 'Completamento Minimo';

  @override
  String get habitFormMinCompletionError => 'Inserisci il conteggio minimo';

  @override
  String get habitFormMinCountError => 'Almeno 1';

  @override
  String get habitFormUpdate => 'Aggiorna Abitudine';

  @override
  String get habitFormSave => 'Salva Abitudine';

  @override
  String get habitFormWeeklyError => 'Seleziona almeno un giorno per la programmazione settimanale';

  @override
  String get habitFormMonthlyError => 'Seleziona almeno un giorno per la programmazione mensile';

  @override
  String get habitFormCustomError => 'Seleziona l\'intervallo per la programmazione personalizzata';

  @override
  String habitItemExperience(Object experience) {
    return '$experience EXP';
  }

  @override
  String habitItemMinCompletion(Object minCompletionCount) {
    return 'min $minCompletionCount';
  }

  @override
  String habitItemDoneSequence(Object karma) {
    return 'serie di $karma';
  }

  @override
  String get habitItemEditTooltip => 'Modifica abitudine';

  @override
  String get habitItemDeleteTooltip => 'Elimina abitudine';

  @override
  String get habitItemScheduleDaily => 'giornaliero';

  @override
  String get habitItemScheduleWeekly => 'settimanale';

  @override
  String get habitItemScheduleMonthly => 'mensile';

  @override
  String get habitItemScheduleCustom => 'personalizzato';

  @override
  String get habitItemDeleteConfirmationTitle => 'Elimina Abitudine';

  @override
  String habitItemDeleteConfirmationMessage(Object habitTitle) {
    return 'Sei sicuro di voler eliminare \"$habitTitle\"?';
  }

  @override
  String habitItemDeleteConfirmationWarning(Object xpAmount) {
    return '⚠️ Questo rimuoverà $xpAmount EXP dal tuo personaggio!';
  }

  @override
  String get habitItemDeleteConfirmationCancel => 'Annulla';

  @override
  String get habitItemDeleteConfirmationDelete => 'Elimina';

  @override
  String get habitsTabEmptyTitle => 'Nessuna abitudine ancora!';

  @override
  String get habitsTabEmptySubtitle => 'Tocca il pulsante + per aggiungere la tua prima abitudine';

  @override
  String get habitsTabOnOtherDaysHeader => 'On other days';

  @override
  String get taskFormTitle => 'Titolo Compito';

  @override
  String get taskFormTitleError => 'Inserisci un titolo';

  @override
  String get taskFormDescription => 'Descrizione';

  @override
  String get taskFormExperience => 'Punti Esperienza';

  @override
  String get taskFormExperienceError => 'Inserisci l\'esperienza';

  @override
  String get taskFormNumberError => 'Inserisci un numero valido';

  @override
  String taskFormDueDateLabel(Object date) {
    return 'Scadenza: $date';
  }

  @override
  String get taskFormSelectDate => 'Seleziona Data';

  @override
  String taskFormPriorityLabel(Object priority) {
    return 'Priorità: $priority';
  }

  @override
  String get taskFormCategory => 'Categoria';

  @override
  String get taskFormUpdate => 'Aggiorna Compito';

  @override
  String get taskFormSave => 'Salva Compito';

  @override
  String get taskCategoryWork => 'Lavoro';

  @override
  String get taskCategoryPersonal => 'Personale';

  @override
  String get taskCategoryHealth => 'Salute';

  @override
  String get taskCategoryLearning => 'Apprendimento';

  @override
  String get taskCategoryHome => 'Casa';

  @override
  String get taskCategorySocial => 'Sociale';

  @override
  String get taskCategoryOther => 'Altro';

  @override
  String get tasksTabEmptyTitle => 'Nessun compito ancora!';

  @override
  String get tasksTabEmptySubtitle => 'Tocca il pulsante + per aggiungere il tuo primo compito';

  @override
  String get tasksTabCompletedHeader => 'Compiti Completati';

  @override
  String tasksTabExperience(Object experience) {
    return '$experience EXP';
  }

  @override
  String get tasksTabEditTooltip => 'Modifica compito';

  @override
  String get tasksTabDeleteTooltip => 'Elimina compito';

  @override
  String get tasksTabDeleteConfirmationTitle => 'Elimina Compito';

  @override
  String tasksTabDeleteConfirmationMessage(Object taskTitle) {
    return 'Sei sicuro di voler eliminare \"$taskTitle\"?';
  }

  @override
  String tasksTabDeleteConfirmationWarning(Object xpAmount) {
    return '⚠️ Questo rimuoverà $xpAmount EXP dal tuo personaggio!';
  }

  @override
  String get tasksTabDeleteConfirmationCancel => 'Annulla';

  @override
  String get tasksTabDeleteConfirmationDelete => 'Elimina';

  @override
  String get tasksTabDueToday => 'Oggi';

  @override
  String get tasksTabDueTomorrow => 'Domani';

  @override
  String get tasksTabDueYesterday => 'Ieri';

  @override
  String tasksTabDueDaysAgo(num days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days giorni fa',
      one: '1 giorno fa',
    );
    return '$_temp0';
  }

  @override
  String tasksTabDueInDays(num days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days giorni',
      one: '1 giorno',
    );
    return 'Tra $_temp0';
  }

  @override
  String get scheduleSelectorTitle => 'Tipo di Programmazione';

  @override
  String get scheduleTypeDaily => 'Giornaliero';

  @override
  String get scheduleTypeWeekly => 'Settimanale';

  @override
  String get scheduleTypeMonthly => 'Mensile';

  @override
  String get scheduleTypeCustom => 'Intervallo Personalizzato';

  @override
  String get scheduleWeeklyTitle => 'Seleziona i giorni:';

  @override
  String get scheduleMonthlyTitle => 'Seleziona i giorni del mese:';

  @override
  String get scheduleCustomTitle => 'Ripeti ogni X giorni:';

  @override
  String scheduleCustomInterval(num days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days giorni',
      one: '1 giorno',
    );
    return '$_temp0';
  }

  @override
  String get scheduleCustomError => 'Seleziona un intervallo';

  @override
  String get weekdayMonday => 'Lun';

  @override
  String get weekdayTuesday => 'Mar';

  @override
  String get weekdayWednesday => 'Mer';

  @override
  String get weekdayThursday => 'Gio';

  @override
  String get weekdayFriday => 'Ven';

  @override
  String get weekdaySaturday => 'Sab';

  @override
  String get weekdaySunday => 'Dom';

  @override
  String get sortByTitle => 'By name';

  @override
  String get sortByExperience => 'By experience';

  @override
  String get sortByCompletionStatus => 'By completion status';

  @override
  String get sortByScheduleType => 'By schedule type';

  @override
  String get sortByKarma => 'By streak';

  @override
  String get sortByCompletionCount => 'By completion number';

  @override
  String get sortByMinCompletionCount => 'By min for completion';

  @override
  String get sortByPriority => 'By priority';

  @override
  String get sortByCategory => 'By category';

  @override
  String get sortByDueDate => 'By due date';

  @override
  String get sortAscending => 'Ascending sort';

  @override
  String get sortDescending => 'Descending sort';

  @override
  String get resetProgress => 'Azzera Progresso';

  @override
  String get resetConfirmationTitle => 'Azzera';

  @override
  String get resetConfirmationMessage => 'Sei sicuro di voler azzerare il tuo progresso? Questo reimposterà le impostazioni, l\'obiettivo, il livello e l\'esperienza e imposterà la data di creazione a ora. Le tue abitudini e compiti, tuttavia, non saranno influenzati. Questa azione non può essere annullata.';

  @override
  String get resetSuccess => 'I dati di progresso sono stati azzerati con successo!';
}
