// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'RPG Tarefas & Hábitos';

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
  String get save => 'Salvar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get delete => 'Excluir';

  @override
  String get edit => 'Editar';

  @override
  String get toNext => 'Próximo';

  @override
  String get habitTitle => 'Título do Hábito';

  @override
  String get completeDayHint => 'Completar Dia Perdido';

  @override
  String get markCompletedHabitsHint => 'Marque os hábitos concluídos para este dia:';

  @override
  String get skipDayButton => 'Pular Este Dia';

  @override
  String get completeDayButton => 'Completar Dia';

  @override
  String get habitDescription => 'Descrição';

  @override
  String get experiencePoints => 'Pontos de Experiência';

  @override
  String get minCompletionCount => 'Contagem Mínima de Conclusão';

  @override
  String get scheduleType => 'Tipo de Agenda';

  @override
  String get daily => 'Diário';

  @override
  String get weekly => 'Semanal';

  @override
  String get monthly => 'Mensal';

  @override
  String get custom => 'Personalizado';

  @override
  String get selectDays => 'Selecionar dias';

  @override
  String get monday => 'Segunda-feira';

  @override
  String get tuesday => 'Terça-feira';

  @override
  String get wednesday => 'Quarta-feira';

  @override
  String get thursday => 'Quinta-feira';

  @override
  String get friday => 'Sexta-feira';

  @override
  String get saturday => 'Sábado';

  @override
  String get sunday => 'Domingo';

  @override
  String get character => 'Personagem';

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
  String habitsNumberToday(Object habitsNumber) {
    return '$habitsNumber hoje';
  }

  @override
  String get todaysProgress => 'Progresso de Hoje';

  @override
  String get experience => 'Experiência';

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
    return 'Não se esqueça de usar suas conquistas para $goal!';
  }

  @override
  String expCurveLabel(Object exponent, Object multiplier) {
    return 'Expoente da Curva: $exponent, Multiplicador: $multiplier';
  }

  @override
  String get goal => 'Objetivo';

  @override
  String get defaultGoal => 'Acumule experiência para criar seu personagem de RPG!';

  @override
  String get progress => 'Progresso';

  @override
  String get progressToLevel => 'Progresso para o Nível';

  @override
  String get completed => 'Concluído';

  @override
  String get pending => 'Pendente';

  @override
  String get overdue => 'Atrasado';

  @override
  String get dueToday => 'Para Hoje';

  @override
  String get dueSoon => 'Em Breve';

  @override
  String get karma => 'Karma';

  @override
  String get karmaLevel => 'Nível de Karma';

  @override
  String get karmaDescription => 'Seu nível de karma reflete sua consistência.';

  @override
  String get resetProgress => 'Redefinir Progresso';

  @override
  String get resetProgressTitle => 'Redefinir Progresso?';

  @override
  String get resetProgressDescription => 'Esta ação redefinirá permanentemente:';

  @override
  String get resetWarningExperience => 'Toda a experiência e nível do personagem';

  @override
  String get resetWarningHabits => 'Histórico de conclusão de todos os hábitos';

  @override
  String get resetWarningKarma => 'Níveis de karma de todos os hábitos';

  @override
  String get resetTasksUnaffected => 'As tarefas não serão afetadas.';

  @override
  String get resetCannotUndone => 'Esta ação não pode ser desfeita!';

  @override
  String get resetCancel => 'Cancelar';

  @override
  String get resetConfirm => 'Redefinir Progresso';

  @override
  String get resetSuccess => 'Progresso redefinido com sucesso!';

  @override
  String get progressSettings => 'Configurações de Progresso';

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
  String get levelProgressionPreview => 'Visualização da Progressão de Nível:';

  @override
  String levelFormula(Object multiplier, Object exponent) {
    return 'Fórmula: EXP = $multiplier × (Nível-1)^$exponent';
  }

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
  String get habitFormWeeklyError => 'Por favor, selecione pelo menos um dia para agenda semanal';

  @override
  String get habitFormMonthlyError => 'Por favor, selecione pelo menos um dia para agenda mensal';

  @override
  String get habitFormCustomError => 'Por favor, selecione o intervalo para agenda personalizada';

  @override
  String habitItemExperience(Object experience) {
    return '$experience XP';
  }

  @override
  String habitItemMinCompletion(Object minCompletionCount) {
    return 'mín $minCompletionCount';
  }

  @override
  String habitItemTodayCount(Object currentCount) {
    return '$currentCount hoje';
  }

  @override
  String get habitItemNotToday => 'Não hoje';

  @override
  String get habitItemEditTooltip => 'Editar hábito';

  @override
  String get habitItemDeleteTooltip => 'Excluir hábito';

  @override
  String get habitItemScheduleDaily => 'Diário';

  @override
  String get habitItemScheduleWeekly => 'Semanal';

  @override
  String get habitItemScheduleMonthly => 'Mensal';

  @override
  String get habitItemScheduleCustom => 'Personalizado';

  @override
  String get habitItemDeleteConfirmationTitle => 'Excluir Hábito';

  @override
  String habitItemDeleteConfirmationMessage(Object habitTitle) {
    return 'Tem certeza de que deseja excluir \"$habitTitle\"?';
  }

  @override
  String habitItemDeleteConfirmationWarning(Object xpAmount) {
    return '⚠️ Isso removerá $xpAmount XP do seu personagem!';
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
  String get taskCategoryOther => 'Outro';

  @override
  String get tasksTabEmptyTitle => 'Nenhuma tarefa ainda!';

  @override
  String get tasksTabEmptySubtitle => 'Toque no botão + para adicionar sua primeira tarefa';

  @override
  String get tasksTabTotal => 'Total';

  @override
  String get tasksTabPending => 'Pendente';

  @override
  String get tasksTabDone => 'Concluído';

  @override
  String tasksTabPendingHeader(Object count) {
    return 'Tarefas Pendentes ($count)';
  }

  @override
  String tasksTabCompletedHeader(Object count) {
    return 'Tarefas Concluídas ($count)';
  }

  @override
  String tasksTabExperience(Object experience) {
    return '$experience XP';
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
    return '⚠️ Isso removerá $xpAmount XP do seu personagem!';
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
  String tasksTabDueDaysAgo(Object days) {
    return 'Há $days dias';
  }

  @override
  String tasksTabDueInDays(Object days) {
    return 'Em $days dias';
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
  String get scheduleWeeklyTitle => 'Selecionar dias:';

  @override
  String get scheduleMonthlyTitle => 'Selecionar dias do mês:';

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
}
