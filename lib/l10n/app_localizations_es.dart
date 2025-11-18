// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => '¡Hábito Para Subir de Nivel!';

  @override
  String get home => 'Inicio';

  @override
  String get settings => 'Configuración';

  @override
  String get addHabit => 'Añadir Hábito';

  @override
  String get addTask => 'Añadir Tarea';

  @override
  String get editHabit => 'Editar Hábito';

  @override
  String get editTask => 'Editar Tarea';

  @override
  String get toNext => 'Al Siguiente';

  @override
  String get completeDayHint => 'Completar Día Perdido';

  @override
  String get markCompletedHabitsHint => 'Marca los hábitos completados para este día:';

  @override
  String get skipDayButton => 'Saltar Este Día';

  @override
  String get completeDayButton => 'Completar Día';

  @override
  String get scheduleType => 'Tipo de Horario';

  @override
  String get habits => 'Hábitos';

  @override
  String get habitsDone => 'Hábitos Completados';

  @override
  String get tasks => 'Tareas';

  @override
  String get tasksDue => 'Tareas Pendientes';

  @override
  String get tasksDone => 'Tareas Completadas';

  @override
  String get level => 'Nivel';

  @override
  String get todaysProgress => 'Progreso de Hoy';

  @override
  String get experienceShort => 'EXP';

  @override
  String get congratulations => '¡Felicidades!';

  @override
  String levelReached(Object level) {
    return '¡Nivel $level alcanzado!';
  }

  @override
  String get continueButton => 'Continuar';

  @override
  String dontForgetToUseAchievenents(Object goal) {
    return 'No olvides usar tus logros para... ¡$goal!';
  }

  @override
  String get goal => 'Objetivo';

  @override
  String get defaultGoal => '¡Sube de nivel tu vida!';

  @override
  String playerProgressToLevel(Object level) {
    return 'Progreso al Nivel';
  }

  @override
  String get overdue => 'Atrasado';

  @override
  String get goalMotivation => 'Motivación del Objetivo';

  @override
  String get goalMotivationHint => '¿Para qué estás acumulando experiencia?';

  @override
  String get language => 'Idioma';

  @override
  String get english => 'Inglés';

  @override
  String get russian => 'Ruso';

  @override
  String get german => 'Alemán';

  @override
  String get french => 'Francés';

  @override
  String get spanish => 'Español';

  @override
  String get portuguese => 'Portugués';

  @override
  String get polish => 'Polaco';

  @override
  String get italian => 'Italiano';

  @override
  String get dutch => 'Holandés';

  @override
  String get swedish => 'Sueco';

  @override
  String get norwegian => 'Noruego';

  @override
  String get finnish => 'Finlandés';

  @override
  String get armenian => 'Armenio';

  @override
  String get turkish => 'Turco';

  @override
  String get chinese => 'Chino';

  @override
  String get japanese => 'Japonés';

  @override
  String get korean => 'Coreano';

  @override
  String get hindi => 'Hindi';

  @override
  String get arabic => 'Árabe';

  @override
  String get hebrew => 'Hebreo';

  @override
  String get curveExponent => 'Exponente de Curva';

  @override
  String curveExponentDescription(Object exponent) {
    return 'Exponente de curva: $exponent. Valores <1 hacen los primeros niveles más fáciles, >1 hacen los niveles posteriores más fáciles';
  }

  @override
  String get experienceMultiplier => 'Multiplicador de Experiencia';

  @override
  String experienceMultiplierDescription(Object multiplier) {
    return 'Multiplicador de experiencia: $multiplier. Valores más altos hacen que subir de nivel sea más lento';
  }

  @override
  String get levelProgressionPreview => 'Vista Previa de Progresión de Nivel:';

  @override
  String levelFormula(Object exponent, Object multiplier) {
    return 'Fórmula: EXP = $multiplier × (Nivel-1)^$exponent';
  }

  @override
  String get cancel => 'Cancelar';

  @override
  String get save => 'Guardar';

  @override
  String get habitFormTitle => 'Título del Hábito';

  @override
  String get habitFormTitleError => 'Por favor ingresa un título';

  @override
  String get habitFormDescription => 'Descripción';

  @override
  String get habitFormExperience => 'Puntos de Experiencia';

  @override
  String get habitFormExperienceError => 'Por favor ingresa la experiencia';

  @override
  String get habitFormNumberError => 'Por favor ingresa un número válido';

  @override
  String get habitFormMinCompletion => 'Mínimo de Completación';

  @override
  String get habitFormMinCompletionError => 'Por favor ingresa el conteo mínimo';

  @override
  String get habitFormMinCountError => 'Al menos 1';

  @override
  String get habitFormUpdate => 'Actualizar Hábito';

  @override
  String get habitFormSave => 'Guardar Hábito';

  @override
  String get habitFormWeeklyError => 'Por favor selecciona al menos un día para el horario semanal';

  @override
  String get habitFormMonthlyError => 'Por favor selecciona al menos un día para el horario mensual';

  @override
  String get habitFormCustomError => 'Por favor selecciona un intervalo para el horario personalizado';

  @override
  String habitItemExperience(Object experience) {
    return '$experience EXP';
  }

  @override
  String habitItemMinCompletion(Object minCompletionCount) {
    return 'mín $minCompletionCount';
  }

  @override
  String habitItemDoneSequence(Object karma) {
    return 'racha de $karma';
  }

  @override
  String get habitItemEditTooltip => 'Editar hábito';

  @override
  String get habitItemDeleteTooltip => 'Eliminar hábito';

  @override
  String get habitItemScheduleDaily => 'diario';

  @override
  String get habitItemScheduleWeekly => 'semanal';

  @override
  String get habitItemScheduleMonthly => 'mensual';

  @override
  String get habitItemScheduleCustom => 'personalizado';

  @override
  String get habitItemDeleteConfirmationTitle => 'Eliminar Hábito';

  @override
  String habitItemDeleteConfirmationMessage(Object habitTitle) {
    return '¿Estás seguro de que quieres eliminar \"$habitTitle\"?';
  }

  @override
  String habitItemDeleteConfirmationWarning(Object xpAmount) {
    return '⚠️ ¡Esto eliminará $xpAmount EXP de tu jugador!';
  }

  @override
  String get habitItemDeleteConfirmationCancel => 'Cancelar';

  @override
  String get habitItemDeleteConfirmationDelete => 'Eliminar';

  @override
  String get habitsTabEmptyTitle => '¡Aún no hay hábitos!';

  @override
  String get habitsTabEmptySubtitle => 'Toca el botón + para añadir tu primer hábito';

  @override
  String get habitsTabOnOtherDaysHeader => 'On other days';

  @override
  String get taskFormTitle => 'Título de la Tarea';

  @override
  String get taskFormTitleError => 'Por favor ingresa un título';

  @override
  String get taskFormDescription => 'Descripción';

  @override
  String get taskFormExperience => 'Puntos de Experiencia';

  @override
  String get taskFormExperienceError => 'Por favor ingresa la experiencia';

  @override
  String get taskFormNumberError => 'Por favor ingresa un número válido';

  @override
  String taskFormDueDateLabel(Object date) {
    return 'Fecha de Vencimiento: $date';
  }

  @override
  String get taskFormSelectDate => 'Seleccionar Fecha';

  @override
  String taskFormPriorityLabel(Object priority) {
    return 'Prioridad: $priority';
  }

  @override
  String get taskFormCategory => 'Categoría';

  @override
  String get taskFormUpdate => 'Actualizar Tarea';

  @override
  String get taskFormSave => 'Guardar Tarea';

  @override
  String get taskCategoryWork => 'Trabajo';

  @override
  String get taskCategoryPersonal => 'Personal';

  @override
  String get taskCategoryHealth => 'Salud';

  @override
  String get taskCategoryLearning => 'Aprendizaje';

  @override
  String get taskCategoryHome => 'Hogar';

  @override
  String get taskCategorySocial => 'Social';

  @override
  String get taskCategoryOther => 'Otro';

  @override
  String get tasksTabEmptyTitle => '¡Aún no hay tareas!';

  @override
  String get tasksTabEmptySubtitle => 'Toca el botón + para añadir tu primera tarea';

  @override
  String get tasksTabCompletedHeader => 'Tareas Completadas';

  @override
  String tasksTabExperience(Object experience) {
    return '$experience EXP';
  }

  @override
  String get tasksTabEditTooltip => 'Editar tarea';

  @override
  String get tasksTabDeleteTooltip => 'Eliminar tarea';

  @override
  String get tasksTabDeleteConfirmationTitle => 'Eliminar Tarea';

  @override
  String tasksTabDeleteConfirmationMessage(Object taskTitle) {
    return '¿Estás seguro de que quieres eliminar \"$taskTitle\"?';
  }

  @override
  String tasksTabDeleteConfirmationWarning(Object xpAmount) {
    return '⚠️ ¡Esto eliminará $xpAmount EXP de tu jugador!';
  }

  @override
  String get tasksTabDeleteConfirmationCancel => 'Cancelar';

  @override
  String get tasksTabDeleteConfirmationDelete => 'Eliminar';

  @override
  String get tasksTabDueToday => 'Hoy';

  @override
  String get tasksTabDueTomorrow => 'Mañana';

  @override
  String get tasksTabDueYesterday => 'Ayer';

  @override
  String tasksTabDueDaysAgo(num days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days días',
      one: '1 día',
    );
    return 'hace $_temp0';
  }

  @override
  String tasksTabDueInDays(num days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days días',
      one: '1 día',
    );
    return 'En $_temp0';
  }

  @override
  String get scheduleSelectorTitle => 'Tipo de Horario';

  @override
  String get scheduleTypeDaily => 'Diario';

  @override
  String get scheduleTypeWeekly => 'Semanal';

  @override
  String get scheduleTypeMonthly => 'Mensual';

  @override
  String get scheduleTypeCustom => 'Intervalo Personalizado';

  @override
  String get scheduleWeeklyTitle => 'Selecciona los días:';

  @override
  String get scheduleMonthlyTitle => 'Selecciona los días del mes:';

  @override
  String get scheduleCustomTitle => 'Repetir cada X días:';

  @override
  String scheduleCustomInterval(num days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days días',
      one: '1 día',
    );
    return '$_temp0';
  }

  @override
  String get scheduleCustomError => 'Por favor selecciona un intervalo';

  @override
  String get weekdayMonday => 'Lun';

  @override
  String get weekdayTuesday => 'Mar';

  @override
  String get weekdayWednesday => 'Mié';

  @override
  String get weekdayThursday => 'Jue';

  @override
  String get weekdayFriday => 'Vie';

  @override
  String get weekdaySaturday => 'Sáb';

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
  String get resetProgress => 'Reiniciar Progreso';

  @override
  String get resetConfirmationTitle => 'Reiniciar';

  @override
  String get resetConfirmationMessage => '¿Estás seguro de que quieres reiniciar tu progreso? Esto reiniciará la configuración, el objetivo, el nivel y la experiencia, y establecerá la fecha de creación a ahora. Tus hábitos y tareas, sin embargo, no se verán afectados. Esta acción no se puede deshacer.';

  @override
  String get resetSuccess => '¡Los datos de progreso se han reiniciado correctamente!';
}
