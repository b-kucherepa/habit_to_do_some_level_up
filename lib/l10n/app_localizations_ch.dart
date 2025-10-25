// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chamorro (`ch`).
class AppLocalizationsCh extends AppLocalizations {
  AppLocalizationsCh([String locale = 'ch']) : super(locale);

  @override
  String get appTitle => '习惯升级，提升自我！';

  @override
  String get home => '首页';

  @override
  String get settings => '设置';

  @override
  String get addHabit => '添加习惯';

  @override
  String get addTask => '添加任务';

  @override
  String get editHabit => '编辑习惯';

  @override
  String get editTask => '编辑任务';

  @override
  String get toNext => '下一步';

  @override
  String get completeDayHint => '补完遗漏天数';

  @override
  String get markCompletedHabitsHint => '标记此日完成的习惯：';

  @override
  String get skipDayButton => '跳过今日';

  @override
  String get completeDayButton => '完成今日';

  @override
  String get scheduleType => '计划类型';

  @override
  String get habits => '习惯';

  @override
  String get habitsDone => '已完成习惯';

  @override
  String get tasks => '任务';

  @override
  String get tasksDue => '到期任务';

  @override
  String get tasksDone => '已完成任务';

  @override
  String get level => '等级';

  @override
  String get todaysProgress => '今日进度';

  @override
  String get experienceShort => '经验';

  @override
  String get congratulations => '恭喜！';

  @override
  String levelReached(Object level) {
    return '已达到 $level 级！';
  }

  @override
  String get continueButton => '继续';

  @override
  String dontForgetToUseAchievenents(Object goal) {
    return '别忘了使用你的成就来... $goal！';
  }

  @override
  String get goal => '目标';

  @override
  String get defaultGoal => '提升你的生活！';

  @override
  String playerProgressToLevel(Object level) {
    return '升级进度';
  }

  @override
  String get overdue => '已逾期';

  @override
  String get goalMotivation => '目标动机';

  @override
  String get goalMotivationHint => '你积累经验是为了什么？';

  @override
  String get language => '语言';

  @override
  String get english => '英语';

  @override
  String get russian => '俄语';

  @override
  String get german => '德语';

  @override
  String get french => '法语';

  @override
  String get spanish => '西班牙语';

  @override
  String get portuguese => '葡萄牙语';

  @override
  String get polish => '波兰语';

  @override
  String get italian => '意大利语';

  @override
  String get dutch => '荷兰语';

  @override
  String get swedish => '瑞典语';

  @override
  String get norwegian => '挪威语';

  @override
  String get finnish => '芬兰语';

  @override
  String get armenian => '亚美尼亚语';

  @override
  String get turkish => '土耳其语';

  @override
  String get chinese => '中文';

  @override
  String get japanese => '日语';

  @override
  String get korean => '韩语';

  @override
  String get hindi => '印地语';

  @override
  String get arabic => '阿拉伯语';

  @override
  String get hebrew => '希伯来语';

  @override
  String get curveExponent => '曲线指数';

  @override
  String curveExponentDescription(Object exponent) {
    return '曲线指数：$exponent。值 <1 使前期升级更容易，>1 使后期升级更容易';
  }

  @override
  String get experienceMultiplier => '经验倍率';

  @override
  String experienceMultiplierDescription(Object multiplier) {
    return '经验倍率：$multiplier。值越高升级越慢';
  }

  @override
  String get levelProgressionPreview => '等级进度预览：';

  @override
  String levelFormula(Object exponent, Object multiplier) {
    return '公式：经验 = $multiplier × (等级-1)^$exponent';
  }

  @override
  String get cancel => '取消';

  @override
  String get save => '保存';

  @override
  String get habitFormTitle => '习惯标题';

  @override
  String get habitFormTitleError => '请输入标题';

  @override
  String get habitFormDescription => '描述';

  @override
  String get habitFormExperience => '经验值';

  @override
  String get habitFormExperienceError => '请输入经验值';

  @override
  String get habitFormNumberError => '请输入有效数字';

  @override
  String get habitFormMinCompletion => '最低完成次数';

  @override
  String get habitFormMinCompletionError => '请输入最低次数';

  @override
  String get habitFormMinCountError => '至少为 1';

  @override
  String get habitFormUpdate => '更新习惯';

  @override
  String get habitFormSave => '保存习惯';

  @override
  String get habitFormWeeklyError => '请为周计划选择至少一天';

  @override
  String get habitFormMonthlyError => '请为月计划选择至少一天';

  @override
  String get habitFormCustomError => '请为自定义计划选择间隔';

  @override
  String habitItemExperience(Object experience) {
    return '$experience 经验';
  }

  @override
  String habitItemMinCompletion(Object minCompletionCount) {
    return '最低 $minCompletionCount 次';
  }

  @override
  String habitItemDoneSequence(Object karma) {
    return '连续 $karma 次';
  }

  @override
  String get habitItemEditTooltip => '编辑习惯';

  @override
  String get habitItemDeleteTooltip => '删除习惯';

  @override
  String get habitItemScheduleDaily => '每日';

  @override
  String get habitItemScheduleWeekly => '每周';

  @override
  String get habitItemScheduleMonthly => '每月';

  @override
  String get habitItemScheduleCustom => '自定义';

  @override
  String get habitItemDeleteConfirmationTitle => '删除习惯';

  @override
  String habitItemDeleteConfirmationMessage(Object habitTitle) {
    return '确定要删除“$habitTitle”吗？';
  }

  @override
  String habitItemDeleteConfirmationWarning(Object xpAmount) {
    return '⚠️ 这将从你的角色中移除 $xpAmount 经验！';
  }

  @override
  String get habitItemDeleteConfirmationCancel => '取消';

  @override
  String get habitItemDeleteConfirmationDelete => '删除';

  @override
  String get habitsTabEmptyTitle => '还没有习惯！';

  @override
  String get habitsTabEmptySubtitle => '点击 + 按钮添加你的第一个习惯';

  @override
  String get taskFormTitle => '任务标题';

  @override
  String get taskFormTitleError => '请输入标题';

  @override
  String get taskFormDescription => '描述';

  @override
  String get taskFormExperience => '经验值';

  @override
  String get taskFormExperienceError => '请输入经验值';

  @override
  String get taskFormNumberError => '请输入有效数字';

  @override
  String taskFormDueDateLabel(Object date) {
    return '截止日期：$date';
  }

  @override
  String get taskFormSelectDate => '选择日期';

  @override
  String taskFormPriorityLabel(Object priority) {
    return '优先级：$priority';
  }

  @override
  String get taskFormCategory => '分类';

  @override
  String get taskFormUpdate => '更新任务';

  @override
  String get taskFormSave => '保存任务';

  @override
  String get taskCategoryWork => '工作';

  @override
  String get taskCategoryPersonal => '个人';

  @override
  String get taskCategoryHealth => '健康';

  @override
  String get taskCategoryLearning => '学习';

  @override
  String get taskCategoryGeneral => '一般';

  @override
  String get taskCategoryHome => '家庭';

  @override
  String get taskCategorySocial => '社交';

  @override
  String get taskCategoryOther => '其他';

  @override
  String get tasksTabEmptyTitle => '还没有任务！';

  @override
  String get tasksTabEmptySubtitle => '点击 + 按钮添加你的第一个任务';

  @override
  String get tasksTabCompletedHeader => '已完成任务';

  @override
  String tasksTabExperience(Object experience) {
    return '$experience 经验';
  }

  @override
  String get tasksTabEditTooltip => '编辑任务';

  @override
  String get tasksTabDeleteTooltip => '删除任务';

  @override
  String get tasksTabDeleteConfirmationTitle => '删除任务';

  @override
  String tasksTabDeleteConfirmationMessage(Object taskTitle) {
    return '确定要删除“$taskTitle”吗？';
  }

  @override
  String tasksTabDeleteConfirmationWarning(Object xpAmount) {
    return '⚠️ 这将从你的角色中移除 $xpAmount 经验！';
  }

  @override
  String get tasksTabDeleteConfirmationCancel => '取消';

  @override
  String get tasksTabDeleteConfirmationDelete => '删除';

  @override
  String get tasksTabDueToday => '今天';

  @override
  String get tasksTabDueTomorrow => '明天';

  @override
  String get tasksTabDueYesterday => '昨天';

  @override
  String tasksTabDueDaysAgo(num days) {
    return '$days 天前';
  }

  @override
  String tasksTabDueInDays(num days) {
    return '$days 天后';
  }

  @override
  String get scheduleSelectorTitle => '计划类型';

  @override
  String get scheduleTypeDaily => '每日';

  @override
  String get scheduleTypeWeekly => '每周';

  @override
  String get scheduleTypeMonthly => '每月';

  @override
  String get scheduleTypeCustom => '自定义间隔';

  @override
  String get scheduleWeeklyTitle => '选择日期：';

  @override
  String get scheduleMonthlyTitle => '选择每月日期：';

  @override
  String get scheduleCustomTitle => '每 X 天重复：';

  @override
  String scheduleCustomInterval(num days) {
    return '$days 天';
  }

  @override
  String get scheduleCustomError => '请选择间隔';

  @override
  String get weekdayMonday => '周一';

  @override
  String get weekdayTuesday => '周二';

  @override
  String get weekdayWednesday => '周三';

  @override
  String get weekdayThursday => '周四';

  @override
  String get weekdayFriday => '周五';

  @override
  String get weekdaySaturday => '周六';

  @override
  String get weekdaySunday => '周日';

  @override
  String get resetProgress => '重置进度';

  @override
  String get resetConfirmationTitle => '重置';

  @override
  String get resetConfirmationMessage => '确定要重置进度吗？这将重置设置、目标、等级和经验，并将创建日期设为现在。但你的习惯和任务不会受影响。此操作无法撤销。';

  @override
  String get resetSuccess => '进度数据已成功重置！';
}
