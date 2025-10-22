// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'RPG: Задачи и Привычки';

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
  String get delete => 'Удалить';

  @override
  String get edit => 'Редактировать';

  @override
  String get toNext => 'К следующему';

  @override
  String get habitTitle => 'Название привычки';

  @override
  String get completeDayHint => 'Завершить пропущенный день';

  @override
  String get markCompletedHabitsHint => 'Отметьте выполненные привычки за этот день:';

  @override
  String get skipDayButton => 'Пропустить этот день';

  @override
  String get completeDayButton => 'Завершить день';

  @override
  String get habitDescription => 'Описание';

  @override
  String get experiencePoints => 'Очки опыта';

  @override
  String get minCompletionCount => 'Мин. количество выполнений';

  @override
  String get scheduleType => 'Тип расписания';

  @override
  String get daily => 'Ежедневно';

  @override
  String get weekly => 'Еженедельно';

  @override
  String get monthly => 'Ежемесячно';

  @override
  String get custom => 'Произвольный';

  @override
  String get selectDays => 'Выберите дни';

  @override
  String get monday => 'Понедельник';

  @override
  String get tuesday => 'Вторник';

  @override
  String get wednesday => 'Среда';

  @override
  String get thursday => 'Четверг';

  @override
  String get friday => 'Пятница';

  @override
  String get saturday => 'Суббота';

  @override
  String get sunday => 'Воскресенье';

  @override
  String get player => 'Персонаж';

  @override
  String get habits => 'Привычки';

  @override
  String get habitsDone => 'Выполнено привычек';

  @override
  String get tasks => 'Задачи';

  @override
  String get tasksDue => 'Задачи к выполнению';

  @override
  String get tasksDone => 'Выполнено задач';

  @override
  String get level => 'Уровень';

  @override
  String habitsNumberToday(Object habitsNumber) {
    return '$habitsNumber на сегодня';
  }

  @override
  String get todaysProgress => 'Сегодняшний прогресс';

  @override
  String get experience => 'Опыт';

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
    return 'Не забудьте использовать свои достижения, чтобы $goal!';
  }

  @override
  String expCurveLabel(Object exponent, Object multiplier) {
    return 'Экспонента кривой: $exponent, Множитель: $multiplier';
  }

  @override
  String get goal => 'Цель';

  @override
  String get defaultGoal => 'Накопите опыт для вашего RPG путешествия!';

  @override
  String get progress => 'Прогресс';

  @override
  String get progressToLevel => 'Прогресс до уровня';

  @override
  String get completed => 'Завершено';

  @override
  String get pending => 'В ожидании';

  @override
  String get overdue => 'Просрочено';

  @override
  String get dueToday => 'На сегодня';

  @override
  String get dueSoon => 'Скоро истекает';

  @override
  String get karma => 'Карма';

  @override
  String get karmaLevel => 'Уровень кармы';

  @override
  String get karmaDescription => 'Ваш уровень кармы отражает вашу последовательность.';

  @override
  String get resetProgress => 'Сбросить прогресс';

  @override
  String get resetProgressTitle => 'Сбросить прогресс?';

  @override
  String get resetProgressDescription => 'Это действие сбросит:';

  @override
  String get resetWarningExperience => 'Весь опыт и уровень персонажа';

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
  String get progressSettings => 'Настройки прогресса';

  @override
  String get goalMotivation => 'Цель и мотивация';

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
  String get arabic => 'Arabic';

  @override
  String get hebrew => 'Иврит';

  @override
  String get curveExponent => 'Экспонента кривой';

  @override
  String curveExponentDescription(Object exponent) {
    return 'Экспонента кривой: $exponent. Значения <1 облегчают ранние уровни, >1 - поздние';
  }

  @override
  String get experienceMultiplier => 'Множитель опыта';

  @override
  String experienceMultiplierDescription(Object multiplier) {
    return 'Множитель опыта: $multiplier. Высокие значения замедляют повышение уровня';
  }

  @override
  String get levelProgressionPreview => 'Предпросмотр прогрессии уровней:';

  @override
  String levelFormula(Object multiplier, Object exponent) {
    return 'Формула: ОП = $multiplier × (Уровень-1)^$exponent';
  }

  @override
  String get cancel => 'Отмена';

  @override
  String get save => 'Сохранить';

  @override
  String get habitFormTitle => 'Название привычки';

  @override
  String get habitFormTitleError => 'Введите название';

  @override
  String get habitFormDescription => 'Описание';

  @override
  String get habitFormExperience => 'Очки опыта';

  @override
  String get habitFormExperienceError => 'Введите количество опыта';

  @override
  String get habitFormNumberError => 'Введите корректное число';

  @override
  String get habitFormMinCompletion => 'Мин. выполнений';

  @override
  String get habitFormMinCompletionError => 'Введите минимальное количество';

  @override
  String get habitFormMinCountError => 'Не менее 1';

  @override
  String get habitFormUpdate => 'Обновить привычку';

  @override
  String get habitFormSave => 'Сохранить привычку';

  @override
  String get habitFormWeeklyError => 'Выберите хотя бы один день для недельного расписания';

  @override
  String get habitFormMonthlyError => 'Выберите хотя бы один день для месячного расписания';

  @override
  String get habitFormCustomError => 'Выберите интервал для пользовательского расписания';

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
  String get habitItemScheduleDaily => 'Ежедневно';

  @override
  String get habitItemScheduleWeekly => 'Еженедельно';

  @override
  String get habitItemScheduleMonthly => 'Ежемесячно';

  @override
  String get habitItemScheduleCustom => 'Особое';

  @override
  String get habitItemDeleteConfirmationTitle => 'Удалить привычку';

  @override
  String habitItemDeleteConfirmationMessage(Object habitTitle) {
    return 'Вы уверены, что хотите удалить \"$habitTitle\"?';
  }

  @override
  String habitItemDeleteConfirmationWarning(Object xpAmount) {
    return '⚠️ Это уберет $xpAmount ОП у вашего персонажа!';
  }

  @override
  String get habitItemDeleteConfirmationCancel => 'Отмена';

  @override
  String get habitItemDeleteConfirmationDelete => 'Удалить';

  @override
  String get habitsTabEmptyTitle => 'Пока нет привычек!';

  @override
  String get habitsTabEmptySubtitle => 'Нажмите +, чтобы добавить первую привычку';

  @override
  String get taskFormTitle => 'Название задачи';

  @override
  String get taskFormTitleError => 'Введите название';

  @override
  String get taskFormDescription => 'Описание';

  @override
  String get taskFormExperience => 'Очки опыта';

  @override
  String get taskFormExperienceError => 'Введите количество опыта';

  @override
  String get taskFormNumberError => 'Введите корректное число';

  @override
  String taskFormDueDateLabel(Object date) {
    return 'Срок выполнения: $date';
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
  String get taskCategoryOther => 'Другое';

  @override
  String get tasksTabEmptyTitle => 'Пока нет задач!';

  @override
  String get tasksTabEmptySubtitle => 'Нажмите +, чтобы добавить первую задачу';

  @override
  String get tasksTabTotal => 'Всего';

  @override
  String get tasksTabPending => 'В ожидании';

  @override
  String get tasksTabDone => 'Выполнено';

  @override
  String tasksTabPendingHeader(Object count) {
    return 'Ожидающие задачи ($count)';
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
    return '⚠️ Это уберет $xpAmount ОП у вашего персонажа!';
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
  String tasksTabDueDaysAgo(Object days) {
    return '$days дней назад';
  }

  @override
  String tasksTabDueInDays(Object days) {
    return 'Через $days дней';
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
  String get scheduleTypeCustom => 'Особый интервал';

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
  String get scheduleCustomError => 'Выберите интервал';

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
