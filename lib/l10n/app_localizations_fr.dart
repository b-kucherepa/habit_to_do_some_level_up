// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'RPG Todo & Habitudes';

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
  String get save => 'Enregistrer';

  @override
  String get cancel => 'Annuler';

  @override
  String get delete => 'Supprimer';

  @override
  String get edit => 'Modifier';

  @override
  String get toNext => 'Au suivant';

  @override
  String get habitTitle => 'Titre de l\'habitude';

  @override
  String get completeDayHint => 'Terminer le jour manqué';

  @override
  String get markCompletedHabitsHint => 'Marquer les habitudes complétées pour ce jour :';

  @override
  String get skipDayButton => 'Sauter ce jour';

  @override
  String get completeDayButton => 'Terminer le jour';

  @override
  String get habitDescription => 'Description';

  @override
  String get experiencePoints => 'Points d\'expérience';

  @override
  String get minCompletionCount => 'Nombre min. de complétions';

  @override
  String get scheduleType => 'Type de planification';

  @override
  String get daily => 'Quotidien';

  @override
  String get weekly => 'Hebdomadaire';

  @override
  String get monthly => 'Mensuel';

  @override
  String get custom => 'Personnalisé';

  @override
  String get selectDays => 'Sélectionner les jours';

  @override
  String get monday => 'Lundi';

  @override
  String get tuesday => 'Mardi';

  @override
  String get wednesday => 'Mercredi';

  @override
  String get thursday => 'Jeudi';

  @override
  String get friday => 'Vendredi';

  @override
  String get saturday => 'Samedi';

  @override
  String get sunday => 'Dimanche';

  @override
  String get character => 'Personnage';

  @override
  String get habits => 'Habitudes';

  @override
  String get habitsDone => 'Habitudes terminées';

  @override
  String get tasks => 'Tâches';

  @override
  String get tasksDue => 'Tâches échues';

  @override
  String get tasksDone => 'Tâches terminées';

  @override
  String get level => 'Niveau';

  @override
  String habitsNumberToday(Object habitsNumber) {
    return '$habitsNumber aujourd\'hui';
  }

  @override
  String get todaysProgress => 'Progrès du jour';

  @override
  String get experience => 'Expérience';

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
    return 'N\'oubliez pas d\'utiliser vos réalisations pour $goal !';
  }

  @override
  String expCurveLabel(Object exponent, Object multiplier) {
    return 'Exposant de la courbe : $exponent, Multiplicateur : $multiplier';
  }

  @override
  String get goal => 'Objectif';

  @override
  String get defaultGoal => 'Accumulez de l\'expérience pour votre aventure RPG !';

  @override
  String get progress => 'Progression';

  @override
  String get progressToLevel => 'Progression vers le niveau';

  @override
  String get completed => 'Terminé';

  @override
  String get pending => 'En attente';

  @override
  String get overdue => 'En retard';

  @override
  String get dueToday => 'Échéance aujourd\'hui';

  @override
  String get dueSoon => 'Échéance proche';

  @override
  String get karma => 'Karma';

  @override
  String get karmaLevel => 'Niveau de Karma';

  @override
  String get karmaDescription => 'Votre niveau de karma reflète votre régularité.';

  @override
  String get resetProgress => 'Réinitialiser la progression';

  @override
  String get resetProgressTitle => 'Réinitialiser la progression ?';

  @override
  String get resetProgressDescription => 'Cette action réinitialisera définitivement :';

  @override
  String get resetWarningExperience => 'Toute l\'expérience et le niveau du personnage';

  @override
  String get resetWarningHabits => 'L\'historique de complétion de toutes les habitudes';

  @override
  String get resetWarningKarma => 'Les niveaux de karma de toutes les habitudes';

  @override
  String get resetTasksUnaffected => 'Les tâches ne seront pas affectées.';

  @override
  String get resetCannotUndone => 'Cette action ne peut pas être annulée !';

  @override
  String get resetCancel => 'Annuler';

  @override
  String get resetConfirm => 'Réinitialiser la progression';

  @override
  String get resetSuccess => 'La progression a été réinitialisée avec succès !';

  @override
  String get progressSettings => 'Paramètres de progression';

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
    return 'Multiplicateur d\'expérience : $multiplier. Des valeurs plus élevées ralentissent la montée de niveau';
  }

  @override
  String get levelProgressionPreview => 'Aperçu de la progression du niveau :';

  @override
  String levelFormula(Object multiplier, Object exponent) {
    return 'Formule : EXP = $multiplier × (Niveau-1)^$exponent';
  }

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
  String get habitFormMinCompletion => 'Complétion min.';

  @override
  String get habitFormMinCompletionError => 'Veuillez saisir le nombre min.';

  @override
  String get habitFormMinCountError => 'Au moins 1';

  @override
  String get habitFormUpdate => 'Mettre à jour l\'habitude';

  @override
  String get habitFormSave => 'Enregistrer l\'habitude';

  @override
  String get habitFormWeeklyError => 'Veuillez sélectionner au moins un jour pour la planification hebdomadaire';

  @override
  String get habitFormMonthlyError => 'Veuillez sélectionner au moins un jour pour la planification mensuelle';

  @override
  String get habitFormCustomError => 'Veuillez sélectionner un intervalle pour la planification personnalisée';

  @override
  String habitItemExperience(Object experience) {
    return '$experience PX';
  }

  @override
  String habitItemMinCompletion(Object minCompletionCount) {
    return 'min $minCompletionCount';
  }

  @override
  String habitItemTodayCount(Object currentCount) {
    return '$currentCount aujourd\'hui';
  }

  @override
  String get habitItemNotToday => 'Pas aujourd\'hui';

  @override
  String get habitItemEditTooltip => 'Modifier l\'habitude';

  @override
  String get habitItemDeleteTooltip => 'Supprimer l\'habitude';

  @override
  String get habitItemScheduleDaily => 'Quotidien';

  @override
  String get habitItemScheduleWeekly => 'Hebdomadaire';

  @override
  String get habitItemScheduleMonthly => 'Mensuel';

  @override
  String get habitItemScheduleCustom => 'Personnalisé';

  @override
  String get habitItemDeleteConfirmationTitle => 'Supprimer l\'habitude';

  @override
  String habitItemDeleteConfirmationMessage(Object habitTitle) {
    return 'Êtes-vous sûr de vouloir supprimer \"$habitTitle\" ?';
  }

  @override
  String habitItemDeleteConfirmationWarning(Object xpAmount) {
    return '⚠️ Cela retirera $xpAmount PX à votre personnage !';
  }

  @override
  String get habitItemDeleteConfirmationCancel => 'Annuler';

  @override
  String get habitItemDeleteConfirmationDelete => 'Supprimer';

  @override
  String get habitsTabEmptyTitle => 'Aucune habitude pour l\'instant !';

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
  String get taskCategoryOther => 'Autre';

  @override
  String get tasksTabEmptyTitle => 'Aucune tâche pour l\'instant !';

  @override
  String get tasksTabEmptySubtitle => 'Appuyez sur le bouton + pour ajouter votre première tâche';

  @override
  String get tasksTabTotal => 'Total';

  @override
  String get tasksTabPending => 'En attente';

  @override
  String get tasksTabDone => 'Terminé';

  @override
  String tasksTabPendingHeader(Object count) {
    return 'Tâches en attente ($count)';
  }

  @override
  String tasksTabCompletedHeader(Object count) {
    return 'Tâches terminées ($count)';
  }

  @override
  String tasksTabExperience(Object experience) {
    return '$experience PX';
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
    return '⚠️ Cela retirera $xpAmount PX à votre personnage !';
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
  String tasksTabDueDaysAgo(Object days) {
    return 'Il y a $days jours';
  }

  @override
  String tasksTabDueInDays(Object days) {
    return 'Dans $days jours';
  }

  @override
  String get scheduleSelectorTitle => 'Type de planification';

  @override
  String get scheduleTypeDaily => 'Quotidien';

  @override
  String get scheduleTypeWeekly => 'Hebdomadaire';

  @override
  String get scheduleTypeMonthly => 'Mensuel';

  @override
  String get scheduleTypeCustom => 'Intervalle personnalisé';

  @override
  String get scheduleWeeklyTitle => 'Sélectionner les jours :';

  @override
  String get scheduleMonthlyTitle => 'Sélectionner les jours du mois :';

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
}
