// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => '習慣でレベルアップ！';

  @override
  String get home => 'ホーム';

  @override
  String get settings => '設定';

  @override
  String get addHabit => '習慣を追加';

  @override
  String get addTask => 'タスクを追加';

  @override
  String get editHabit => '習慣を編集';

  @override
  String get editTask => 'タスクを編集';

  @override
  String get toNext => '次へ';

  @override
  String get completeDayHint => '未完了の日を完了する';

  @override
  String get markCompletedHabitsHint => 'この日の完了した習慣をマーク：';

  @override
  String get skipDayButton => 'この日をスキップ';

  @override
  String get completeDayButton => '日を完了';

  @override
  String get scheduleType => 'スケジュールタイプ';

  @override
  String get habits => '習慣';

  @override
  String get habitsDone => '完了した習慣';

  @override
  String get tasks => 'タスク';

  @override
  String get tasksDue => '期限タスク';

  @override
  String get tasksDone => '完了したタスク';

  @override
  String get level => 'レベル';

  @override
  String get todaysProgress => '本日の進捗';

  @override
  String get experienceShort => 'EXP';

  @override
  String get congratulations => 'おめでとう！';

  @override
  String levelReached(Object level) {
    return 'レベル$levelに到達！';
  }

  @override
  String get continueButton => '続ける';

  @override
  String dontForgetToUseAchievenents(Object goal) {
    return '達成した実績を忘れずに活用して…$goal！';
  }

  @override
  String get goal => '目標';

  @override
  String get defaultGoal => '人生をレベルアップ！';

  @override
  String playerProgressToLevel(Object level) {
    return 'レベル$levelまでの進捗';
  }

  @override
  String get overdue => '期限経過';

  @override
  String get goalMotivation => '目標の動機';

  @override
  String get goalMotivationHint => '何のために経験値を貯めていますか？';

  @override
  String get language => '言語';

  @override
  String get english => '英語';

  @override
  String get russian => 'ロシア語';

  @override
  String get german => 'ドイツ語';

  @override
  String get french => 'フランス語';

  @override
  String get spanish => 'スペイン語';

  @override
  String get portuguese => 'ポルトガル語';

  @override
  String get polish => 'ポーランド語';

  @override
  String get italian => 'イタリア語';

  @override
  String get dutch => 'オランダ語';

  @override
  String get swedish => 'スウェーデン語';

  @override
  String get norwegian => 'ノルウェー語';

  @override
  String get finnish => 'フィンランド語';

  @override
  String get armenian => 'アルメニア語';

  @override
  String get turkish => 'トルコ語';

  @override
  String get chinese => '中国語';

  @override
  String get japanese => '日本語';

  @override
  String get korean => '韓国語';

  @override
  String get hindi => 'ヒンディー語';

  @override
  String get arabic => 'アラビア語';

  @override
  String get hebrew => 'ヘブライ語';

  @override
  String get curveExponent => 'カーブ指数';

  @override
  String curveExponentDescription(Object exponent) {
    return 'カーブ指数：$exponent。1未満は初期レベルを、1以上は後期レベルを容易にします';
  }

  @override
  String get experienceMultiplier => '経験値倍率';

  @override
  String experienceMultiplierDescription(Object multiplier) {
    return '経験値倍率：$multiplier。高い値ほどレベルアップが遅くなります';
  }

  @override
  String get levelProgressionPreview => 'レベル進行プレビュー：';

  @override
  String levelFormula(Object exponent, Object multiplier) {
    return '計算式：EXP = $multiplier × (レベル-1)^$exponent';
  }

  @override
  String get cancel => 'キャンセル';

  @override
  String get save => '保存';

  @override
  String get habitFormTitle => '習慣タイトル';

  @override
  String get habitFormTitleError => 'タイトルを入力してください';

  @override
  String get habitFormDescription => '説明';

  @override
  String get habitFormExperience => '経験値';

  @override
  String get habitFormExperienceError => '経験値を入力してください';

  @override
  String get habitFormNumberError => '有効な数値を入力してください';

  @override
  String get habitFormMinCompletion => '最低完了数';

  @override
  String get habitFormMinCompletionError => '最低数を入力してください';

  @override
  String get habitFormMinCountError => '1以上必要です';

  @override
  String get habitFormUpdate => '習慣を更新';

  @override
  String get habitFormSave => '習慣を保存';

  @override
  String get habitFormWeeklyError => '週次スケジュールで少なくとも1日を選択してください';

  @override
  String get habitFormMonthlyError => '月次スケジュールで少なくとも1日を選択してください';

  @override
  String get habitFormCustomError => 'カスタムスケジュールの間隔を選択してください';

  @override
  String habitItemExperience(Object experience) {
    return '$experience EXP';
  }

  @override
  String habitItemMinCompletion(Object minCompletionCount) {
    return '最低$minCompletionCount回';
  }

  @override
  String habitItemDoneSequence(Object karma) {
    return '$karma日連続';
  }

  @override
  String get habitItemEditTooltip => '習慣を編集';

  @override
  String get habitItemDeleteTooltip => '習慣を削除';

  @override
  String get habitItemScheduleDaily => '毎日';

  @override
  String get habitItemScheduleWeekly => '毎週';

  @override
  String get habitItemScheduleMonthly => '毎月';

  @override
  String get habitItemScheduleCustom => 'カスタム';

  @override
  String get habitItemDeleteConfirmationTitle => '習慣を削除';

  @override
  String habitItemDeleteConfirmationMessage(Object habitTitle) {
    return '「$habitTitle」を削除してもよろしいですか？';
  }

  @override
  String habitItemDeleteConfirmationWarning(Object xpAmount) {
    return '⚠️ これにより$xpAmount EXPがプレイヤーから削除されます！';
  }

  @override
  String get habitItemDeleteConfirmationCancel => 'キャンセル';

  @override
  String get habitItemDeleteConfirmationDelete => '削除';

  @override
  String get habitsTabEmptyTitle => '習慣がまだありません！';

  @override
  String get habitsTabEmptySubtitle => '+ボタンをタップして最初の習慣を追加';

  @override
  String get taskFormTitle => 'タスクタイトル';

  @override
  String get taskFormTitleError => 'タイトルを入力してください';

  @override
  String get taskFormDescription => '説明';

  @override
  String get taskFormExperience => '経験値';

  @override
  String get taskFormExperienceError => '経験値を入力してください';

  @override
  String get taskFormNumberError => '有効な数値を入力してください';

  @override
  String taskFormDueDateLabel(Object date) {
    return '期限：$date';
  }

  @override
  String get taskFormSelectDate => '日付を選択';

  @override
  String taskFormPriorityLabel(Object priority) {
    return '優先度：$priority';
  }

  @override
  String get taskFormCategory => 'カテゴリ';

  @override
  String get taskFormUpdate => 'タスクを更新';

  @override
  String get taskFormSave => 'タスクを保存';

  @override
  String get taskCategoryWork => '仕事';

  @override
  String get taskCategoryPersonal => '個人';

  @override
  String get taskCategoryHealth => '健康';

  @override
  String get taskCategoryLearning => '学習';

  @override
  String get taskCategoryHome => '家庭';

  @override
  String get taskCategorySocial => '社交';

  @override
  String get taskCategoryOther => 'その他';

  @override
  String get tasksTabEmptyTitle => 'タスクがまだありません！';

  @override
  String get tasksTabEmptySubtitle => '+ボタンをタップして最初のタスクを追加';

  @override
  String get tasksTabCompletedHeader => '完了したタスク';

  @override
  String tasksTabExperience(Object experience) {
    return '$experience EXP';
  }

  @override
  String get tasksTabEditTooltip => 'タスクを編集';

  @override
  String get tasksTabDeleteTooltip => 'タスクを削除';

  @override
  String get tasksTabDeleteConfirmationTitle => 'タスクを削除';

  @override
  String tasksTabDeleteConfirmationMessage(Object taskTitle) {
    return '「$taskTitle」を削除してもよろしいですか？';
  }

  @override
  String tasksTabDeleteConfirmationWarning(Object xpAmount) {
    return '⚠️ これにより$xpAmount EXPがプレイヤーから削除されます！';
  }

  @override
  String get tasksTabDeleteConfirmationCancel => 'キャンセル';

  @override
  String get tasksTabDeleteConfirmationDelete => '削除';

  @override
  String get tasksTabDueToday => '今日';

  @override
  String get tasksTabDueTomorrow => '明日';

  @override
  String get tasksTabDueYesterday => '昨日';

  @override
  String tasksTabDueDaysAgo(num days) {
    return '$days日前';
  }

  @override
  String tasksTabDueInDays(num days) {
    return 'あと$days日';
  }

  @override
  String get scheduleSelectorTitle => 'スケジュールタイプ';

  @override
  String get scheduleTypeDaily => '毎日';

  @override
  String get scheduleTypeWeekly => '毎週';

  @override
  String get scheduleTypeMonthly => '毎月';

  @override
  String get scheduleTypeCustom => 'カスタム間隔';

  @override
  String get scheduleWeeklyTitle => '曜日を選択：';

  @override
  String get scheduleMonthlyTitle => '日付を選択：';

  @override
  String get scheduleCustomTitle => 'X日ごとに繰り返し：';

  @override
  String scheduleCustomInterval(num days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days日',
    );
    return '$_temp0';
  }

  @override
  String get scheduleCustomError => '間隔を選択してください';

  @override
  String get weekdayMonday => '月';

  @override
  String get weekdayTuesday => '火';

  @override
  String get weekdayWednesday => '水';

  @override
  String get weekdayThursday => '木';

  @override
  String get weekdayFriday => '金';

  @override
  String get weekdaySaturday => '土';

  @override
  String get weekdaySunday => '日';

  @override
  String get resetProgress => '進捗をリセット';

  @override
  String get resetConfirmationTitle => 'リセット';

  @override
  String get resetConfirmationMessage => '進捗をリセットしてもよろしいですか？設定、目標、レベル、経験値がリセットされ、作成日が現在時刻に設定されます。ただし、習慣とタスクは影響を受けません。この操作は元に戻せません。';

  @override
  String get resetSuccess => '進捗データが正常にリセットされました！';
}
