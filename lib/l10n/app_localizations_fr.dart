// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Habitude À Faire Pour Progresser !';

  @override
  String get home => 'Accueil';

  @override
  String get settings => 'Paramètres';

  @override
  String get addHabit => 'Ajouter une habitude';

  @override
  String get addTask => 'Ajouter une tâche';

  @override
  String get editHabit => 'Modifier l\'habitude';

  @override
  String get editTask => 'Modifier la tâche';

  @override
  String get toNext => 'Vers le suivant';

  @override
  String get completeDayHint => 'Compléter un jour manqué';

  @override
  String get markCompletedHabitsHint => 'Marquer les habitudes complétées pour ce jour :';

  @override
  String get skipDayButton => 'Sauter ce jour';

  @override
  String get completeDayButton => 'Terminer le jour';

  @override
  String get scheduleType => 'Type de planning';

  @override
  String get habits => 'Habitudes';

  @override
  String get habitsDone => 'Habitudes terminées';

  @override
  String get tasks => 'Tâches';

  @override
  String get tasksDue => 'Tâches dues';

  @override
  String get tasksDone => 'Tâches terminées';

  @override
  String get level => 'Niveau';

  @override
  String get todaysProgress => 'Progrès du jour';

  @override
  String get experienceShort => 'EXP';

  @override
  String get congratulations => 'Félicitations !';

  @override
  String levelReached(Object level) {
    return 'Niveau $level atteint !';
  }

  @override
  String get continueButton => 'Continuer';

  @override
  String dontForgetToUseAchievenents(Object goal) {
    return 'N\'oubliez pas d\'utiliser vos accomplissements pour... $goal !';
  }

  @override
  String get goal => 'Objectif';

  @override
  String get defaultGoal => 'Faites évoluer votre vie !';

  @override
  String playerProgressToLevel(Object level) {
    return 'Progression vers le niveau';
  }

  @override
  String get overdue => 'En retard';

  @override
  String get goalMotivation => 'Motivation de l\'objectif';

  @override
  String get goalMotivationHint => 'Pour quoi accumulez-vous de l\'expérience ?';

  @override
  String get language => 'Langue';

  @override
  String get english => 'Anglais';

  @override
  String get russian => 'Russe';

  @override
  String get german => 'Allemand';

  @override
  String get french => 'Français';

  @override
  String get spanish => 'Espagnol';

  @override
  String get portuguese => 'Portugais';

  @override
  String get polish => 'Polonais';

  @override
  String get italian => 'Italien';

  @override
  String get dutch => 'Néerlandais';

  @override
  String get swedish => 'Suédois';

  @override
  String get norwegian => 'Norvégien';

  @override
  String get finnish => 'Finnois';

  @override
  String get armenian => 'Arménien';

  @override
  String get turkish => 'Turc';

  @override
  String get chinese => 'Chinois';

  @override
  String get japanese => 'Japonais';

  @override
  String get korean => 'Coréen';

  @override
  String get hindi => 'Hindi';

  @override
  String get arabic => 'Arabe';

  @override
  String get hebrew => 'Hébreu';

  @override
  String get curveExponent => 'Exposant de la courbe';

  @override
  String curveExponentDescription(Object exponent) {
    return 'Exposant de la courbe : $exponent. Les valeurs <1 rendent les premiers niveaux plus faciles, >1 rendent les niveaux suivants plus faciles';
  }

  @override
  String get experienceMultiplier => 'Multiplicateur d\'expérience';

  @override
  String experienceMultiplierDescription(Object multiplier) {
    return 'Multiplicateur d\'expérience : $multiplier. Des valeurs plus élevées ralentissent la progression de niveau';
  }

  @override
  String get levelProgressionPreview => 'Aperçu de la progression :';

  @override
  String levelFormula(Object exponent, Object multiplier) {
    return 'Formule : EXP = $multiplier × (Niveau-1)^$exponent';
  }

  @override
  String get cancel => 'Annuler';

  @override
  String get save => 'Enregistrer';

  @override
  String get habitFormTitle => 'Titre de l\'habitude';

  @override
  String get habitFormTitleError => 'Veuillez saisir un titre';

  @override
  String get habitFormDescription => 'Description';

  @override
  String get habitFormExperience => 'Points d\'expérience';

  @override
  String get habitFormExperienceError => 'Veuillez saisir l\'expérience';

  @override
  String get habitFormNumberError => 'Veuillez saisir un nombre valide';

  @override
  String get habitFormMinCompletion => 'Complétion minimale';

  @override
  String get habitFormMinCompletionError => 'Veuillez saisir le nombre minimum';

  @override
  String get habitFormMinCountError => 'Au moins 1';

  @override
  String get habitFormUpdate => 'Mettre à jour l\'habitude';

  @override
  String get habitFormSave => 'Enregistrer l\'habitude';

  @override
  String get habitFormWeeklyError => 'Veuillez sélectionner au moins un jour pour le planning hebdomadaire';

  @override
  String get habitFormMonthlyError => 'Veuillez sélectionner au moins un jour pour le planning mensuel';

  @override
  String get habitFormCustomError => 'Veuillez sélectionner un intervalle pour le planning personnalisé';

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
    return 'Série de $karma';
  }

  @override
  String get habitItemEditTooltip => 'Modifier l\'habitude';

  @override
  String get habitItemDeleteTooltip => 'Supprimer l\'habitude';

  @override
  String get habitItemScheduleDaily => 'quotidien';

  @override
  String get habitItemScheduleWeekly => 'hebdomadaire';

  @override
  String get habitItemScheduleMonthly => 'mensuel';

  @override
  String get habitItemScheduleCustom => 'personnalisé';

  @override
  String get habitItemDeleteConfirmationTitle => 'Supprimer l\'habitude';

  @override
  String habitItemDeleteConfirmationMessage(Object habitTitle) {
    return 'Êtes-vous sûr de vouloir supprimer \"$habitTitle\" ?';
  }

  @override
  String habitItemDeleteConfirmationWarning(Object xpAmount) {
    return '⚠️ Cela retirera $xpAmount EXP de votre joueur !';
  }

  @override
  String get habitItemDeleteConfirmationCancel => 'Annuler';

  @override
  String get habitItemDeleteConfirmationDelete => 'Supprimer';

  @override
  String get habitsTabEmptyTitle => 'Aucune habitude pour le moment !';

  @override
  String get habitsTabEmptySubtitle => 'Appuyez sur le bouton + pour ajouter votre première habitude';

  @override
  String get taskFormTitle => 'Titre de la tâche';

  @override
  String get taskFormTitleError => 'Veuillez saisir un titre';

  @override
  String get taskFormDescription => 'Description';

  @override
  String get taskFormExperience => 'Points d\'expérience';

  @override
  String get taskFormExperienceError => 'Veuillez saisir l\'expérience';

  @override
  String get taskFormNumberError => 'Veuillez saisir un nombre valide';

  @override
  String taskFormDueDateLabel(Object date) {
    return 'Date d\'échéance : $date';
  }

  @override
  String get taskFormSelectDate => 'Sélectionner une date';

  @override
  String taskFormPriorityLabel(Object priority) {
    return 'Priorité : $priority';
  }

  @override
  String get taskFormCategory => 'Catégorie';

  @override
  String get taskFormUpdate => 'Mettre à jour la tâche';

  @override
  String get taskFormSave => 'Enregistrer la tâche';

  @override
  String get taskCategoryWork => 'Travail';

  @override
  String get taskCategoryPersonal => 'Personnel';

  @override
  String get taskCategoryHealth => 'Santé';

  @override
  String get taskCategoryLearning => 'Apprentissage';

  @override
  String get taskCategoryHome => 'Maison';

  @override
  String get taskCategorySocial => 'Social';

  @override
  String get taskCategoryOther => 'Autre';

  @override
  String get tasksTabEmptyTitle => 'Aucune tâche pour le moment !';

  @override
  String get tasksTabEmptySubtitle => 'Appuyez sur le bouton + pour ajouter votre première tâche';

  @override
  String get tasksTabCompletedHeader => 'Tâches terminées';

  @override
  String tasksTabExperience(Object experience) {
    return '$experience EXP';
  }

  @override
  String get tasksTabEditTooltip => 'Modifier la tâche';

  @override
  String get tasksTabDeleteTooltip => 'Supprimer la tâche';

  @override
  String get tasksTabDeleteConfirmationTitle => 'Supprimer la tâche';

  @override
  String tasksTabDeleteConfirmationMessage(Object taskTitle) {
    return 'Êtes-vous sûr de vouloir supprimer \"$taskTitle\" ?';
  }

  @override
  String tasksTabDeleteConfirmationWarning(Object xpAmount) {
    return '⚠️ Cela retirera $xpAmount EXP de votre joueur !';
  }

  @override
  String get tasksTabDeleteConfirmationCancel => 'Annuler';

  @override
  String get tasksTabDeleteConfirmationDelete => 'Supprimer';

  @override
  String get tasksTabDueToday => 'Aujourd\'hui';

  @override
  String get tasksTabDueTomorrow => 'Demain';

  @override
  String get tasksTabDueYesterday => 'Hier';

  @override
  String tasksTabDueDaysAgo(num days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days jours',
      one: '1 jour',
    );
    return 'Il y a $_temp0';
  }

  @override
  String tasksTabDueInDays(num days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days jours',
      one: '1 jour',
    );
    return 'Dans $_temp0';
  }

  @override
  String get scheduleSelectorTitle => 'Type de planning';

  @override
  String get scheduleTypeDaily => 'Quotidien';

  @override
  String get scheduleTypeWeekly => 'Hebdomadaire';

  @override
  String get scheduleTypeMonthly => 'Mensuel';

  @override
  String get scheduleTypeCustom => 'Intervalle personnalisé';

  @override
  String get scheduleWeeklyTitle => 'Sélectionnez les jours :';

  @override
  String get scheduleMonthlyTitle => 'Sélectionnez les jours du mois :';

  @override
  String get scheduleCustomTitle => 'Répéter tous les X jours :';

  @override
  String scheduleCustomInterval(num days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days jours',
      one: '1 jour',
    );
    return '$_temp0';
  }

  @override
  String get scheduleCustomError => 'Veuillez sélectionner un intervalle';

  @override
  String get weekdayMonday => 'Lun';

  @override
  String get weekdayTuesday => 'Mar';

  @override
  String get weekdayWednesday => 'Mer';

  @override
  String get weekdayThursday => 'Jeu';

  @override
  String get weekdayFriday => 'Ven';

  @override
  String get weekdaySaturday => 'Sam';

  @override
  String get weekdaySunday => 'Dim';

  @override
  String get resetProgress => 'Réinitialiser la progression';

  @override
  String get resetConfirmationTitle => 'Réinitialiser';

  @override
  String get resetConfirmationMessage => 'Êtes-vous sûr de vouloir réinitialiser votre progression ? Cela réinitialisera les paramètres, l\'objectif, le niveau et l\'expérience, et définira la date de création sur maintenant. Vos habitudes et tâches, cependant, ne sont pas affectées. Cette action ne peut pas être annulée.';

  @override
  String get resetSuccess => 'Les données de progression ont été réinitialisées avec succès !';
}
