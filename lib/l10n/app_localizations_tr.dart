// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'Alışkanlık: Seviye Atla!';

  @override
  String get home => 'Ana Sayfa';

  @override
  String get settings => 'Ayarlar';

  @override
  String get addHabit => 'Alışkanlık Ekle';

  @override
  String get addTask => 'Görev Ekle';

  @override
  String get editHabit => 'Alışkanlığı Düzenle';

  @override
  String get editTask => 'Görevi Düzenle';

  @override
  String get toNext => 'Sonraki';

  @override
  String get completeDayHint => 'Kaçırılan Günü Tamamla';

  @override
  String get markCompletedHabitsHint => 'Bu gün için tamamlanan alışkanlıkları işaretleyin:';

  @override
  String get skipDayButton => 'Bu Günü Atla';

  @override
  String get completeDayButton => 'Günü Tamamla';

  @override
  String get scheduleType => 'Takvim Türü';

  @override
  String get habits => 'Alışkanlıklar';

  @override
  String get habitsDone => 'Tamamlanan Alışkanlıklar';

  @override
  String get tasks => 'Görevler';

  @override
  String get tasksDue => 'Son Tarihli Görevler';

  @override
  String get tasksDone => 'Tamamlanan Görevler';

  @override
  String get level => 'Seviye';

  @override
  String get todaysProgress => 'Bugünün İlerlemesi';

  @override
  String get experienceShort => 'TP';

  @override
  String get congratulations => 'Tebrikler!';

  @override
  String levelReached(Object level) {
    return '$level. seviyeye ulaşıldı!';
  }

  @override
  String get continueButton => 'Devam Et';

  @override
  String dontForgetToUseAchievenents(Object goal) {
    return 'Başarılarınızı şu amaçla kullanmayı unutmayın: $goal!';
  }

  @override
  String get goal => 'Hedef';

  @override
  String get defaultGoal => 'Hayatında seviye atla!';

  @override
  String playerProgressToLevel(Object level) {
    return '$level. Seviyeye İlerleme';
  }

  @override
  String get overdue => 'Gecikmiş';

  @override
  String get goalMotivation => 'Hedef Motivasyonu';

  @override
  String get goalMotivationHint => 'Deneyim puanlarını ne için biriktiriyorsun?';

  @override
  String get language => 'Dil';

  @override
  String get english => 'İngilizce';

  @override
  String get russian => 'Rusça';

  @override
  String get german => 'Almanca';

  @override
  String get french => 'Fransızca';

  @override
  String get spanish => 'İspanyolca';

  @override
  String get portuguese => 'Portekizce';

  @override
  String get polish => 'Lehçe';

  @override
  String get italian => 'İtalyanca';

  @override
  String get dutch => 'Felemenkçe';

  @override
  String get swedish => 'İsveççe';

  @override
  String get norwegian => 'Norveççe';

  @override
  String get finnish => 'Fince';

  @override
  String get armenian => 'Ermenice';

  @override
  String get turkish => 'Türkçe';

  @override
  String get chinese => 'Çince';

  @override
  String get japanese => 'Japonca';

  @override
  String get korean => 'Korece';

  @override
  String get hindi => 'Hintçe';

  @override
  String get arabic => 'Arapça';

  @override
  String get hebrew => 'İbranice';

  @override
  String get curveExponent => 'Eğri Üssü';

  @override
  String curveExponentDescription(Object exponent) {
    return 'Eğri üssü: $exponent. 1\'den küçük değerler ilk seviyeleri kolaylaştırır, 1\'den büyük değerler sonraki seviyeleri kolaylaştırır';
  }

  @override
  String get experienceMultiplier => 'Deneyim Çarpanı';

  @override
  String experienceMultiplierDescription(Object multiplier) {
    return 'Deneyim çarpanı: $multiplier. Yüksek değerler seviye atlamayı yavaşlatır';
  }

  @override
  String get levelProgressionPreview => 'Seviye İlerleme Önizlemesi:';

  @override
  String levelFormula(Object exponent, Object multiplier) {
    return 'Formül: TP = $multiplier × (Seviye-1)^$exponent';
  }

  @override
  String get cancel => 'İptal';

  @override
  String get save => 'Kaydet';

  @override
  String get habitFormTitle => 'Alışkanlık Başlığı';

  @override
  String get habitFormTitleError => 'Lütfen bir başlık girin';

  @override
  String get habitFormDescription => 'Açıklama';

  @override
  String get habitFormExperience => 'Deneyim Puanları';

  @override
  String get habitFormExperienceError => 'Lütfen deneyim puanı girin';

  @override
  String get habitFormNumberError => 'Lütfen geçerli bir sayı girin';

  @override
  String get habitFormMinCompletion => 'Min. Tamamlama';

  @override
  String get habitFormMinCompletionError => 'Lütfen min. sayıyı girin';

  @override
  String get habitFormMinCountError => 'En az 1';

  @override
  String get habitFormUpdate => 'Alışkanlığı Güncelle';

  @override
  String get habitFormSave => 'Alışkanlığı Kaydet';

  @override
  String get habitFormWeeklyError => 'Lütfen haftalık takvim için en az bir gün seçin';

  @override
  String get habitFormMonthlyError => 'Lütfen aylık takvim için en az bir gün seçin';

  @override
  String get habitFormCustomError => 'Lütfen özel takvim için aralık seçin';

  @override
  String habitItemExperience(Object experience) {
    return '$experience TP';
  }

  @override
  String habitItemMinCompletion(Object minCompletionCount) {
    return 'min. $minCompletionCount';
  }

  @override
  String habitItemDoneSequence(Object karma) {
    return '$karma seri';
  }

  @override
  String get habitItemEditTooltip => 'Alışkanlığı düzenle';

  @override
  String get habitItemDeleteTooltip => 'Alışkanlığı sil';

  @override
  String get habitItemScheduleDaily => 'günlük';

  @override
  String get habitItemScheduleWeekly => 'haftalık';

  @override
  String get habitItemScheduleMonthly => 'aylık';

  @override
  String get habitItemScheduleCustom => 'özel';

  @override
  String get habitItemDeleteConfirmationTitle => 'Alışkanlığı Sil';

  @override
  String habitItemDeleteConfirmationMessage(Object habitTitle) {
    return '\"$habitTitle\" alışkanlığını silmek istediğinizden emin misiniz?';
  }

  @override
  String habitItemDeleteConfirmationWarning(Object xpAmount) {
    return '⚠️ Bu işlem $xpAmount TP\'yi oyuncunuzdan silecek!';
  }

  @override
  String get habitItemDeleteConfirmationCancel => 'İptal';

  @override
  String get habitItemDeleteConfirmationDelete => 'Sil';

  @override
  String get habitsTabEmptyTitle => 'Henüz alışkanlık yok!';

  @override
  String get habitsTabEmptySubtitle => 'İlk alışkanlığınızı eklemek için + butonuna tıklayın';

  @override
  String get habitsTabOnOtherDaysHeader => 'On other days';

  @override
  String get taskFormTitle => 'Görev Başlığı';

  @override
  String get taskFormTitleError => 'Lütfen bir başlık girin';

  @override
  String get taskFormDescription => 'Açıklama';

  @override
  String get taskFormExperience => 'Deneyim Puanları';

  @override
  String get taskFormExperienceError => 'Lütfen deneyim puanı girin';

  @override
  String get taskFormNumberError => 'Lütfen geçerli bir sayı girin';

  @override
  String taskFormDueDateLabel(Object date) {
    return 'Bitiş Tarihi: $date';
  }

  @override
  String get taskFormSelectDate => 'Tarih Seç';

  @override
  String taskFormPriorityLabel(Object priority) {
    return 'Öncelik: $priority';
  }

  @override
  String get taskFormCategory => 'Kategori';

  @override
  String get taskFormUpdate => 'Görevi Güncelle';

  @override
  String get taskFormSave => 'Görevi Kaydet';

  @override
  String get taskCategoryWork => 'İş';

  @override
  String get taskCategoryPersonal => 'Kişisel';

  @override
  String get taskCategoryHealth => 'Sağlık';

  @override
  String get taskCategoryLearning => 'Öğrenme';

  @override
  String get taskCategoryHome => 'Ev';

  @override
  String get taskCategorySocial => 'Sosyal';

  @override
  String get taskCategoryOther => 'Diğer';

  @override
  String get tasksTabEmptyTitle => 'Henüz görev yok!';

  @override
  String get tasksTabEmptySubtitle => 'İlk görevinizi eklemek için + butonuna tıklayın';

  @override
  String get tasksTabCompletedHeader => 'Tamamlanan Görevler';

  @override
  String tasksTabExperience(Object experience) {
    return '$experience TP';
  }

  @override
  String get tasksTabEditTooltip => 'Görevi düzenle';

  @override
  String get tasksTabDeleteTooltip => 'Görevi sil';

  @override
  String get tasksTabDeleteConfirmationTitle => 'Görevi Sil';

  @override
  String tasksTabDeleteConfirmationMessage(Object taskTitle) {
    return '\"$taskTitle\" görevini silmek istediğinizden emin misiniz?';
  }

  @override
  String tasksTabDeleteConfirmationWarning(Object xpAmount) {
    return '⚠️ Bu işlem $xpAmount TP\'yi oyuncunuzdan silecek!';
  }

  @override
  String get tasksTabDeleteConfirmationCancel => 'İptal';

  @override
  String get tasksTabDeleteConfirmationDelete => 'Sil';

  @override
  String get tasksTabDueToday => 'Bugün';

  @override
  String get tasksTabDueTomorrow => 'Yarın';

  @override
  String get tasksTabDueYesterday => 'Dün';

  @override
  String tasksTabDueDaysAgo(num days) {
    return '$days gün önce';
  }

  @override
  String tasksTabDueInDays(num days) {
    return '$days gün sonra';
  }

  @override
  String get scheduleSelectorTitle => 'Takvim Türü';

  @override
  String get scheduleTypeDaily => 'Günlük';

  @override
  String get scheduleTypeWeekly => 'Haftalık';

  @override
  String get scheduleTypeMonthly => 'Aylık';

  @override
  String get scheduleTypeCustom => 'Özel Aralık';

  @override
  String get scheduleWeeklyTitle => 'Günleri seçin:';

  @override
  String get scheduleMonthlyTitle => 'Ayın günlerini seçin:';

  @override
  String get scheduleCustomTitle => 'X günde bir tekrarla:';

  @override
  String scheduleCustomInterval(num days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days gün',
      one: '1 gün',
    );
    return '$_temp0';
  }

  @override
  String get scheduleCustomError => 'Lütfen aralık seçin';

  @override
  String get weekdayMonday => 'Pzt';

  @override
  String get weekdayTuesday => 'Sal';

  @override
  String get weekdayWednesday => 'Çar';

  @override
  String get weekdayThursday => 'Per';

  @override
  String get weekdayFriday => 'Cum';

  @override
  String get weekdaySaturday => 'Cmt';

  @override
  String get weekdaySunday => 'Paz';

  @override
  String get resetProgress => 'İlerlemeyi Sıfırla';

  @override
  String get resetConfirmationTitle => 'Sıfırla';

  @override
  String get resetConfirmationMessage => 'İlerlemenizi sıfırlamak istediğinizden emin misiniz? Bu işlem ayarları, hedefi, seviyeyi ve deneyimi sıfırlayacak ve oluşturma tarihini şimdi olarak ayarlayacaktır. Alışkanlıklarınız ve görevleriniz etkilenmeyecektir. Bu işlem geri alınamaz.';

  @override
  String get resetSuccess => 'İlerleme verileri başarıyla sıfırlandı!';
}
