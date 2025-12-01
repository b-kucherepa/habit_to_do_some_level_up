// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Hábito Para Fazer Algum Nível Up!';

  @override
  String get home => 'Início';

  @override
  String get settings => 'Configurações';

  @override
  String get addHabit => 'Adicionar Hábito';

  @override
  String get addTask => 'Adicionar Tarefa';

  @override
  String get editHabit => 'Editar Hábito';

  @override
  String get editTask => 'Editar Tarefa';

  @override
  String get toNext => 'Para o Próximo';

  @override
  String get completeDayHint => 'Completar Dia Perdido';

  @override
  String get markCompletedHabitsHint => 'Marque os hábitos concluídos para este dia:';

  @override
  String get skipDayButton => 'Pular Este Dia';

  @override
  String get completeDayButton => 'Concluir Dia';

  @override
  String get scheduleType => 'Tipo de Agenda';

  @override
  String get habits => 'Hábitos';

  @override
  String get habitsDone => 'Hábitos Concluídos';

  @override
  String get tasks => 'Tarefas';

  @override
  String get tasksDue => 'Tarefas Pendentes';

  @override
  String get tasksDone => 'Tarefas Concluídas';

  @override
  String get level => 'Nível';

  @override
  String get todaysProgress => 'Progresso de Hoje';

  @override
  String get experienceShort => 'EXP';

  @override
  String get congratulations => 'Parabéns!';

  @override
  String levelReached(Object level) {
    return 'Nível $level alcançado!';
  }

  @override
  String get continueButton => 'Continuar';

  @override
  String dontForgetToUseAchievenents(Object goal) {
    return 'Não se esqueça de usar suas conquistas para... $goal!';
  }

  @override
  String get goal => 'Objetivo';

  @override
  String get defaultGoal => 'Evolua sua vida!';

  @override
  String playerProgressToLevel(Object level) {
    return 'Progresso para o Nível';
  }

  @override
  String get overdue => 'Atrasado';

  @override
  String get goalMotivation => 'Motivação do Objetivo';

  @override
  String get goalMotivationHint => 'Para que você está acumulando experiência?';

  @override
  String get language => 'Idioma';

  @override
  String get english => 'Inglês';

  @override
  String get russian => 'Russo';

  @override
  String get german => 'Alemão';

  @override
  String get french => 'Francês';

  @override
  String get spanish => 'Espanhol';

  @override
  String get portuguese => 'Português';

  @override
  String get polish => 'Polonês';

  @override
  String get italian => 'Italiano';

  @override
  String get dutch => 'Holandês';

  @override
  String get swedish => 'Sueco';

  @override
  String get norwegian => 'Norueguês';

  @override
  String get finnish => 'Finlandês';

  @override
  String get armenian => 'Armênio';

  @override
  String get turkish => 'Turco';

  @override
  String get chinese => 'Chinês';

  @override
  String get japanese => 'Japonês';

  @override
  String get korean => 'Coreano';

  @override
  String get hindi => 'Hindi';

  @override
  String get arabic => 'Árabe';

  @override
  String get hebrew => 'Hebraico';

  @override
  String get curveExponent => 'Expoente da Curva';

  @override
  String curveExponentDescription(Object exponent) {
    return 'Expoente da curva: $exponent. Valores <1 tornam os primeiros níveis mais fáceis, >1 tornam os níveis posteriores mais fáceis';
  }

  @override
  String get experienceMultiplier => 'Multiplicador de Experiência';

  @override
  String experienceMultiplierDescription(Object multiplier) {
    return 'Multiplicador de experiência: $multiplier. Valores mais altos tornam a evolução mais lenta';
  }

  @override
  String get levelProgressionPreview => 'Prévia da Progressão de Nível:';

  @override
  String levelFormula(Object exponent, Object multiplier) {
    return 'Fórmula: EXP = $multiplier × (Nível-1)^$exponent';
  }

  @override
  String get cancel => 'Cancelar';

  @override
  String get save => 'Salvar';

  @override
  String get habitFormTitle => 'Título do Hábito';

  @override
  String get habitFormTitleError => 'Por favor, insira um título';

  @override
  String get habitFormDescription => 'Descrição';

  @override
  String get habitFormExperience => 'Pontos de Experiência';

  @override
  String get habitFormExperienceError => 'Por favor, insira a experiência';

  @override
  String get habitFormNumberError => 'Por favor, insira um número válido';

  @override
  String get habitFormMinCompletion => 'Conclusão Mínima';

  @override
  String get habitFormMinCompletionError => 'Por favor, insira a contagem mínima';

  @override
  String get habitFormMinCountError => 'Pelo menos 1';

  @override
  String get habitFormUpdate => 'Atualizar Hábito';

  @override
  String get habitFormSave => 'Salvar Hábito';

  @override
  String get habitFormWeeklyError => 'Por favor, selecione pelo menos um dia para a agenda semanal';

  @override
  String get habitFormMonthlyError => 'Por favor, selecione pelo menos um dia para a agenda mensal';

  @override
  String get habitFormCustomError => 'Por favor, selecione o intervalo para a agenda personalizada';

  @override
  String habitItemExperience(Object experience) {
    return '$experience EXP';
  }

  @override
  String habitItemMinCompletion(Object minCompletionCount) {
    return 'mín. $minCompletionCount';
  }

  @override
  String habitItemDoneSequence(Object karma) {
    return 'sequência de $karma';
  }

  @override
  String get habitItemEditTooltip => 'Editar hábito';

  @override
  String get habitItemDeleteTooltip => 'Excluir hábito';

  @override
  String get habitItemScheduleDaily => 'diário';

  @override
  String get habitItemScheduleWeekly => 'semanal';

  @override
  String get habitItemScheduleMonthly => 'mensal';

  @override
  String get habitItemScheduleCustom => 'personalizado';

  @override
  String get habitItemDeleteConfirmationTitle => 'Excluir Hábito';

  @override
  String habitItemDeleteConfirmationMessage(Object habitTitle) {
    return 'Tem certeza de que deseja excluir \"$habitTitle\"?';
  }

  @override
  String habitItemDeleteConfirmationWarning(Object xpAmount) {
    return '⚠️ Isso removerá $xpAmount EXP do seu jogador!';
  }

  @override
  String get habitItemDeleteConfirmationCancel => 'Cancelar';

  @override
  String get habitItemDeleteConfirmationDelete => 'Excluir';

  @override
  String get habitsTabEmptyTitle => 'Nenhum hábito ainda!';

  @override
  String get habitsTabEmptySubtitle => 'Toque no botão + para adicionar seu primeiro hábito';

  @override
  String get habitsTabOnOtherDaysHeader => 'On other days';

  @override
  String get taskFormTitle => 'Título da Tarefa';

  @override
  String get taskFormTitleError => 'Por favor, insira um título';

  @override
  String get taskFormDescription => 'Descrição';

  @override
  String get taskFormExperience => 'Pontos de Experiência';

  @override
  String get taskFormExperienceError => 'Por favor, insira a experiência';

  @override
  String get taskFormNumberError => 'Por favor, insira um número válido';

  @override
  String taskFormDueDateLabel(Object date) {
    return 'Data de Vencimento: $date';
  }

  @override
  String get taskFormSelectDate => 'Selecionar Data';

  @override
  String taskFormPriorityLabel(Object priority) {
    return 'Prioridade: $priority';
  }

  @override
  String get taskFormCategory => 'Categoria';

  @override
  String get taskFormUpdate => 'Atualizar Tarefa';

  @override
  String get taskFormSave => 'Salvar Tarefa';

  @override
  String get taskCategoryWork => 'Trabalho';

  @override
  String get taskCategoryPersonal => 'Pessoal';

  @override
  String get taskCategoryHealth => 'Saúde';

  @override
  String get taskCategoryLearning => 'Aprendizado';

  @override
  String get taskCategoryHome => 'Casa';

  @override
  String get taskCategorySocial => 'Social';

  @override
  String get taskCategoryOther => 'Outro';

  @override
  String get tasksTabEmptyTitle => 'Nenhuma tarefa ainda!';

  @override
  String get tasksTabEmptySubtitle => 'Toque no botão + para adicionar sua primeira tarefa';

  @override
  String get tasksTabCompletedHeader => 'Tarefas Concluídas';

  @override
  String tasksTabExperience(Object experience) {
    return '$experience EXP';
  }

  @override
  String get tasksTabEditTooltip => 'Editar tarefa';

  @override
  String get tasksTabDeleteTooltip => 'Excluir tarefa';

  @override
  String get tasksTabDeleteConfirmationTitle => 'Excluir Tarefa';

  @override
  String tasksTabDeleteConfirmationMessage(Object taskTitle) {
    return 'Tem certeza de que deseja excluir \"$taskTitle\"?';
  }

  @override
  String tasksTabDeleteConfirmationWarning(Object xpAmount) {
    return '⚠️ Isso removerá $xpAmount EXP do seu jogador!';
  }

  @override
  String get tasksTabDeleteConfirmationCancel => 'Cancelar';

  @override
  String get tasksTabDeleteConfirmationDelete => 'Excluir';

  @override
  String get tasksTabDueToday => 'Hoje';

  @override
  String get tasksTabDueTomorrow => 'Amanhã';

  @override
  String get tasksTabDueYesterday => 'Ontem';

  @override
  String tasksTabDueDaysAgo(num days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'há $days dias',
      one: 'há 1 dia',
    );
    return '$_temp0';
  }

  @override
  String tasksTabDueInDays(num days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dias',
      one: '1 dia',
    );
    return 'Em $_temp0';
  }

  @override
  String get scheduleSelectorTitle => 'Tipo de Agenda';

  @override
  String get scheduleTypeDaily => 'Diário';

  @override
  String get scheduleTypeWeekly => 'Semanal';

  @override
  String get scheduleTypeMonthly => 'Mensal';

  @override
  String get scheduleTypeCustom => 'Intervalo Personalizado';

  @override
  String get scheduleWeeklyTitle => 'Selecione os dias:';

  @override
  String get scheduleMonthlyTitle => 'Selecione os dias do mês:';

  @override
  String get scheduleCustomTitle => 'Repetir a cada X dias:';

  @override
  String scheduleCustomInterval(num days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dias',
      one: '1 dia',
    );
    return '$_temp0';
  }

  @override
  String get scheduleCustomError => 'Por favor, selecione o intervalo';

  @override
  String get weekdayMonday => 'Seg';

  @override
  String get weekdayTuesday => 'Ter';

  @override
  String get weekdayWednesday => 'Qua';

  @override
  String get weekdayThursday => 'Qui';

  @override
  String get weekdayFriday => 'Sex';

  @override
  String get weekdaySaturday => 'Sáb';

  @override
  String get weekdaySunday => 'Dom';

  @override
  String get resetProgress => 'Redefinir Progresso';

  @override
  String get resetConfirmationTitle => 'Redefinir';

  @override
  String get resetConfirmationMessage => 'Tem certeza de que deseja redefinir seu progresso? Isso redefinirá as configurações, objetivo, nível e experiência e definirá a data de criação para agora. Seus hábitos e tarefas, no entanto, não serão afetados. Esta ação não pode ser desfeita.';

  @override
  String get resetSuccess => 'Os dados de progresso foram redefinidos com sucesso!';
}
