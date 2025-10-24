// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Привычки и Задачи: Повысь Уровень!';

  @override
  String get home => 'Главная';

  @override
  String get settings => 'Настройки';

  @override
  String get addHabit => 'Добавить привычку';

  @override
  String get addTask => 'Добавить задачу';

  @override
  String get editHabit => 'Редактировать привычку';

  @override
  String get editTask => 'Редактировать задачу';

  @override
  String get toNext => 'До следующего';

  @override
  String get completeDayHint => 'Завершить пропущенный день';

  @override
  String get markCompletedHabitsHint => 'Отметьте выполненные привычки за этот день:';

  @override
  String get skipDayButton => 'Пропустить этот день';

  @override
  String get completeDayButton => 'Завершить день';

  @override
  String get scheduleType => 'Тип расписания';

  @override
  String get habits => 'Привычки';

  @override
  String get habitsDone => 'Привычки выполнены';

  @override
  String habitsNumberToday(Object habitsNumber) {
    return '$habitsNumber сегодня';
  }

  @override
  String get tasks => 'Задачи';

  @override
  String get tasksDue => 'Задачи к выполнению';

  @override
  String get tasksDone => 'Задачи выполнены';

  @override
  String get level => 'Уровень';

  @override
  String get todaysProgress => 'Сегодняшний прогресс';

  @override
  String get experienceShort => 'ОП';

  @override
  String get congratulations => 'Поздравляем!';

  @override
  String levelReached(Object level) {
    return 'Достигнут уровень $level!';
  }

  @override
  String get continueButton => 'Продолжить';

  @override
  String dontForgetToUseAchievenents(Object goal) {
    return 'Не забудьте использовать свои достижения, чтобы... $goal!';
  }

  @override
  String get goal => 'Цель';

  @override
  String get defaultGoal => 'Повысь уровень своей жизни!';

  @override
  String get progress => 'Прогресс';

  @override
  String get progressToLevel => 'Прогресс до уровня';

  @override
  String get completed => 'Выполнено';

  @override
  String get overdue => 'Просрочено';

  @override
  String get karma => 'Карма';

  @override
  String get karmaLevel => 'Уровень кармы';

  @override
  String get karmaDescription => 'Уровень кармы привычки отражает вашу последовательность.';

  @override
  String get resetProgress => 'Сбросить прогресс';

  @override
  String get resetProgressTitle => 'Сбросить прогресс?';

  @override
  String get resetProgressDescription => 'Это действие навсегда сбросит:';

  @override
  String get resetWarningExperience => 'Весь опыт и уровень игрока';

  @override
  String get resetWarningHabits => 'Историю выполнения всех привычек';

  @override
  String get resetWarningKarma => 'Уровни кармы всех привычек';

  @override
  String get resetTasksUnaffected => 'Задачи не будут затронуты.';

  @override
  String get resetCannotUndone => 'Это действие нельзя отменить!';

  @override
  String get resetCancel => 'Отмена';

  @override
  String get resetConfirm => 'Сбросить прогресс';

  @override
  String get resetSuccess => 'Прогресс успешно сброшен!';

  @override
  String get progressSettings => 'Настройки';

  @override
  String get goalMotivation => 'Мотивация цели';

  @override
  String get goalMotivationHint => 'Для чего вы накапливаете опыт?';

  @override
  String get language => 'Язык';

  @override
  String get english => 'Английский';

  @override
  String get russian => 'Русский';

  @override
  String get german => 'Немецкий';

  @override
  String get french => 'Французский';

  @override
  String get spanish => 'Испанский';

  @override
  String get portuguese => 'Португальский';

  @override
  String get chinese => 'Китайский';

  @override
  String get japanese => 'Японский';

  @override
  String get korean => 'Корейский';

  @override
  String get hindi => 'Хинди';

  @override
  String get arabic => 'Арабский';

  @override
  String get hebrew => 'Иврит';

  @override
  String get curveExponent => 'Экспонента кривой';

  @override
  String curveExponentDescription(Object exponent) {
    return 'Экспонента кривой: $exponent. Значения <1 облегчают начальные уровни, >1 облегчают последующие уровни';
  }

  @override
  String get experienceMultiplier => 'Множитель опыта';

  @override
  String experienceMultiplierDescription(Object multiplier) {
    return 'Множитель опыта: $multiplier. Более высокие значения замедляют повышение уровня';
  }

  @override
  String get levelProgressionPreview => 'Предпросмотр прогрессии уровней:';

  @override
  String levelFormula(Object exponent, Object multiplier) {
    return 'Формула: ОП = $multiplier × (Уровень-1)^$exponent';
  }

  @override
  String get cancel => 'Отмена';

  @override
  String get save => 'Сохранить';

  @override
  String get habitFormTitle => 'Название привычки';

  @override
  String get habitFormTitleError => 'Пожалуйста, введите название';

  @override
  String get habitFormDescription => 'Описание';

  @override
  String get habitFormExperience => 'Очки опыта';

  @override
  String get habitFormExperienceError => 'Пожалуйста, введите значение опыта';

  @override
  String get habitFormNumberError => 'Пожалуйста, введите допустимое число';

  @override
  String get habitFormMinCompletion => 'Мин. выполнений';

  @override
  String get habitFormMinCompletionError => 'Пожалуйста, введите минимальное количество';

  @override
  String get habitFormMinCountError => 'Как минимум 1';

  @override
  String get habitFormUpdate => 'Обновить привычку';

  @override
  String get habitFormSave => 'Сохранить привычку';

  @override
  String get habitFormWeeklyError => 'Пожалуйста, выберите хотя бы один день для еженедельного расписания';

  @override
  String get habitFormMonthlyError => 'Пожалуйста, выберите хотя бы один день для ежемесячного расписания';

  @override
  String get habitFormCustomError => 'Пожалуйста, выберите интервал для пользовательского расписания';

  @override
  String habitItemExperience(Object experience) {
    return '$experience ОП';
  }

  @override
  String habitItemMinCompletion(Object minCompletionCount) {
    return 'мин. $minCompletionCount';
  }

  @override
  String habitItemTodayCount(Object currentCount) {
    return '$currentCount сегодня';
  }

  @override
  String get habitItemNotToday => 'Не сегодня';

  @override
  String get habitItemEditTooltip => 'Редактировать привычку';

  @override
  String get habitItemDeleteTooltip => 'Удалить привычку';

  @override
  String get habitItemScheduleDaily => 'ежедневно';

  @override
  String get habitItemScheduleWeekly => 'еженедельно';

  @override
  String get habitItemScheduleMonthly => 'ежемесячно';

  @override
  String get habitItemScheduleCustom => 'произвольно';

  @override
  String get habitItemDeleteConfirmationTitle => 'Удалить привычку';

  @override
  String habitItemDeleteConfirmationMessage(Object habitTitle) {
    return 'Вы уверены, что хотите удалить \"$habitTitle\"?';
  }

  @override
  String habitItemDeleteConfirmationWarning(Object xpAmount) {
    return '⚠️ Это удалит $xpAmount ОП у вашего персонажа!';
  }

  @override
  String get habitItemDeleteConfirmationCancel => 'Отмена';

  @override
  String get habitItemDeleteConfirmationDelete => 'Удалить';

  @override
  String get habitsTabEmptyTitle => 'Привычек пока нет!';

  @override
  String get habitsTabEmptySubtitle => 'Нажмите кнопку +, чтобы добавить первую привычку';

  @override
  String get taskFormTitle => 'Название задачи';

  @override
  String get taskFormTitleError => 'Пожалуйста, введите название';

  @override
  String get taskFormDescription => 'Описание';

  @override
  String get taskFormExperience => 'Очки опыта';

  @override
  String get taskFormExperienceError => 'Пожалуйста, введите значение опыта';

  @override
  String get taskFormNumberError => 'Пожалуйста, введите допустимое число';

  @override
  String taskFormDueDateLabel(Object date) {
    return 'Срок: $date';
  }

  @override
  String get taskFormSelectDate => 'Выбрать дату';

  @override
  String taskFormPriorityLabel(Object priority) {
    return 'Приоритет: $priority';
  }

  @override
  String get taskFormCategory => 'Категория';

  @override
  String get taskFormUpdate => 'Обновить задачу';

  @override
  String get taskFormSave => 'Сохранить задачу';

  @override
  String get taskCategoryWork => 'Работа';

  @override
  String get taskCategoryPersonal => 'Личное';

  @override
  String get taskCategoryHealth => 'Здоровье';

  @override
  String get taskCategoryLearning => 'Обучение';

  @override
  String get taskCategoryGeneral => 'Общее';

  @override
  String get taskCategoryHove => 'Дом';

  @override
  String get taskCategorySocial => 'Общение';

  @override
  String get taskCategoryOther => 'Другое';

  @override
  String get tasksTabEmptyTitle => 'Задач пока нет!';

  @override
  String get tasksTabEmptySubtitle => 'Нажмите кнопку +, чтобы добавить первую задачу';

  @override
  String get tasksTabTotal => 'Всего';

  @override
  String get tasksTabPending => 'В ожидании';

  @override
  String get tasksTabDone => 'Выполнено';

  @override
  String tasksTabPendingHeader(Object count) {
    return 'Текущие задачи ($count)';
  }

  @override
  String tasksTabCompletedHeader(Object count) {
    return 'Выполненные задачи ($count)';
  }

  @override
  String tasksTabExperience(Object experience) {
    return '$experience ОП';
  }

  @override
  String get tasksTabEditTooltip => 'Редактировать задачу';

  @override
  String get tasksTabDeleteTooltip => 'Удалить задачу';

  @override
  String get tasksTabDeleteConfirmationTitle => 'Удалить задачу';

  @override
  String tasksTabDeleteConfirmationMessage(Object taskTitle) {
    return 'Вы уверены, что хотите удалить \"$taskTitle\"?';
  }

  @override
  String tasksTabDeleteConfirmationWarning(Object xpAmount) {
    return '⚠️ Это удалит $xpAmount ОП у вашего персонажа!';
  }

  @override
  String get tasksTabDeleteConfirmationCancel => 'Отмена';

  @override
  String get tasksTabDeleteConfirmationDelete => 'Удалить';

  @override
  String get tasksTabDueToday => 'Сегодня';

  @override
  String get tasksTabDueTomorrow => 'Завтра';

  @override
  String get tasksTabDueYesterday => 'Вчера';

  @override
  String tasksTabDueDaysAgo(num days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days дней назад',
      many: '$days дней назад',
      few: '$days дня назад',
      one: '1 день назад',
    );
    return '$_temp0';
  }

  @override
  String tasksTabDueInDays(num days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days дней',
      many: '$days дней',
      few: '$days дня',
      one: '1 день',
    );
    return 'Через $_temp0';
  }

  @override
  String get scheduleSelectorTitle => 'Тип расписания';

  @override
  String get scheduleTypeDaily => 'Ежедневно';

  @override
  String get scheduleTypeWeekly => 'Еженедельно';

  @override
  String get scheduleTypeMonthly => 'Ежемесячно';

  @override
  String get scheduleTypeCustom => 'Произвольный интервал';

  @override
  String get scheduleWeeklyTitle => 'Выберите дни:';

  @override
  String get scheduleMonthlyTitle => 'Выберите дни месяца:';

  @override
  String get scheduleCustomTitle => 'Повторять каждые X дней:';

  @override
  String scheduleCustomInterval(num days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days дней',
      many: '$days дней',
      few: '$days дня',
      one: '1 день',
    );
    return '$_temp0';
  }

  @override
  String get scheduleCustomError => 'Пожалуйста, выберите интервал';

  @override
  String get weekdayMonday => 'Пн';

  @override
  String get weekdayTuesday => 'Вт';

  @override
  String get weekdayWednesday => 'Ср';

  @override
  String get weekdayThursday => 'Чт';

  @override
  String get weekdayFriday => 'Пт';

  @override
  String get weekdaySaturday => 'Сб';

  @override
  String get weekdaySunday => 'Вс';
}
