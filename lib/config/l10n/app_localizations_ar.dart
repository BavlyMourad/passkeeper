// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get welcomeTo => 'مرحبًا بك في';

  @override
  String get loginSubtitle =>
      'حيث يتم حفظ جميع كلمات المرور الخاصة بك بأمان في مكان واحد';

  @override
  String get loginDescription =>
      'نقوم بحفظ كلمات المرور الخاصة بك في مكان آمن وخاص لتتمكن من الوصول إليها بسهولة بنقرة واحدة من جميع أجهزتك';

  @override
  String get loginSetPinButtonLabel => 'تعيين رمز PIN';

  @override
  String get loginBiometricInfoText =>
      'ستكون بياناتك قابلة للوصول باستخدام أي بصمة مسجلة على هذا الجهاز';

  @override
  String get createPinTitle => 'كلمة المرور الوحيدة التي تحتاج إلى تذكرها';

  @override
  String get enterPinHint => 'أدخل رمز PIN مكون من 6 أرقام';

  @override
  String get confirmPinHint => 'تأكيد رمز PIN';

  @override
  String get enableBiometric => 'تفعيل تسجيل الدخول بالبصمة';

  @override
  String get confirmButton => 'تأكيد';

  @override
  String get biometricNotAvailable => 'التحقق بالبصمة غير متاح';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get genericError => 'حدث خطأ ما. يرجى المحاولة مرة أخرى.';

  @override
  String get pinMismatch =>
      'الأرقام السرية غير متطابقة. يرجى المحاولة مرة أخرى';

  @override
  String get pinTooShort => 'يجب أن يتكون الرقم السري من 6 أرقام على الأقل';

  @override
  String get wrongPin => 'رمز PIN غير صحيح. يرجى المحاولة مرة أخرى';

  @override
  String get biometricFailed => 'فشل التحقق بالبصمة';

  @override
  String get biometricNotEnrolled =>
      'لم يتم إعداد البصمة. يرجى تسجيل الدخول باستخدام رمز PIN';

  @override
  String get biometricReason => 'قم بالمصادقة للوصول إلى PassKeeper';

  @override
  String get noPasswordsYet =>
      'لا توجد أي كلمات مرور هنا...حتى الآن!\nاضغط على الزر أدناه لإضافة أول كلمة مرور لك';

  @override
  String get noFavouritePasswordsYet => 'لا توجد كلمات مرور مفضلة...حتى الآن!';

  @override
  String get search => 'بحث';

  @override
  String get all => 'الكل';

  @override
  String get back => 'رجوع';

  @override
  String get view => 'العرض';

  @override
  String get edit => 'تعديل';

  @override
  String get delete => 'حذف';

  @override
  String get titleHint => 'العنوان';

  @override
  String get usernameHint => 'البريد الإلكتروني، اسم المستخدم، إلخ...';

  @override
  String get passwordHint => 'كلمة المرور';

  @override
  String get confirmPasswordHint => 'تأكيد كلمة المرور';

  @override
  String get categoryHint => 'الفئة';

  @override
  String get websiteHint => 'الموقع الإلكتروني';

  @override
  String get addNewCategory => 'إضافة فئة جديدة';

  @override
  String get addPassword => 'إضافة كلمة المرور';

  @override
  String get fieldRequired => 'هذا الحقل مطلوب';

  @override
  String get optional => ' (اختياري)';

  @override
  String get passwordMismatch =>
      'كلمات المرور غير متطابقة. يرجى المحاولة مرة أخرى';

  @override
  String get saveChanges => 'حفظ التغييرات';

  @override
  String get sessionExpired => 'انتهت صلاحية جلستك. يرجى تسجيل الدخول مرة أخرى';

  @override
  String get passwordSaved => 'تم حفظ كلمة المرور';

  @override
  String get favourites => 'المفضلة';

  @override
  String get copied => 'تم النسخ';

  @override
  String get noMatchingPasswordsFound => 'لا توجد كلمات مرور مطابقة';

  @override
  String get passwordDeleted => 'تم حذف كلمة المرور';

  @override
  String get cancel => 'إلغاء';

  @override
  String get actionCanNotBeUndone => 'لا يمكن التراجع عن هذا الإجراء';

  @override
  String get confirmDeletePassword => 'هل تريد حذف كلمة المرور؟';

  @override
  String get confirmDeleteCategory => 'حذف الفئة؟';

  @override
  String get settings => 'الإعدادات';

  @override
  String get preferences => 'التفضيلات';

  @override
  String get language => 'اللغة';

  @override
  String get darkMode => 'الوضع الداكن';

  @override
  String get security => 'الأمان';

  @override
  String get biometricLogin => 'تسجيل الدخول بالبصمة';

  @override
  String get about => 'حول';

  @override
  String get privacyPolicy => 'سياسة الخصوصية';

  @override
  String get appVersion => 'إصدار التطبيق';

  @override
  String get categorySaved => 'تم حفظ الفئة';

  @override
  String get categoryDeleted => 'تم حذف الفئة';

  @override
  String get passwords => 'كلمات المرور';

  @override
  String get categories => 'الفئات';

  @override
  String get createNew => 'إنشاء جديد';

  @override
  String get create => 'إنشاء';

  @override
  String get categoryNameExists => 'اسم هذه الفئة موجود بالفعل';

  @override
  String get categoryNameEmpty => 'يرجى إدخال اسم الفئة';

  @override
  String get categoryName => 'اسم الفئة';

  @override
  String get empty => 'فارغ';

  @override
  String get categoryCreated => 'تم إنشاء الفئة';

  @override
  String get renameCategory => 'إعادة تسمية الفئة';

  @override
  String get done => 'تم';

  @override
  String get privacyPolicyLastUpdated => 'آخر تحديث: أغسطس 2026';

  @override
  String get privacyPolicyIntro =>
      'تم تصميم PassKeeper للحفاظ على بياناتك على جهازك فقط، وليس على خوادمنا. توضح هذه السياسة ما يعنيه ذلك عملياً.';

  @override
  String get privacyPolicyWhatWeCollectTitle => 'ما الذي نجمعه';

  @override
  String get privacyPolicyWhatWeCollectBody =>
      'لا شيء. لا يقوم PassKeeper بجمع أو نقل أو تخزين أي من بياناتك على خوادم خارجية. لا توجد لدينا أدوات تحليل أو تتبع أو نظام حسابات.';

  @override
  String get privacyPolicyDataLocationTitle => 'أين تُخزَّن بياناتك';

  @override
  String get privacyPolicyDataLocationBody =>
      'يتم تخزين جميع كلمات المرور والفئات والإعدادات محلياً على جهازك. يتم تشفير كلمات المرور باستخدام AES-256-GCM قبل تخزينها، بمفتاح تشفير فريد مُشتق من رقم PIN الخاص بك.';

  @override
  String get privacyPolicyBiometricTitle => 'المصادقة البيومترية';

  @override
  String get privacyPolicyBiometricBody =>
      'إذا قمت بتفعيل بصمة الإصبع أو فتح القفل بالوجه، يتم التعامل مع ذلك بالكامل عبر نظام تشغيل جهازك. لا يتلقى PassKeeper أو يخزّن بياناتك البيومترية أبداً.';

  @override
  String get privacyPolicyBackupsTitle => 'النسخ الاحتياطي';

  @override
  String get privacyPolicyBackupsBody =>
      'لا يقوم PassKeeper بعمل نسخ احتياطي لبياناتك تلقائياً. إذا كان جهازك يقوم بنسخ بيانات التطبيقات احتياطياً إلى خدمة سحابية، فإن هذا النسخ يخضع لشروط التشفير والخصوصية الخاصة بتلك الخدمة، وليس لشروطنا.';

  @override
  String get privacyPolicyDeletingDataTitle => 'حذف بياناتك';

  @override
  String get privacyPolicyDeletingDataBody =>
      'يؤدي إلغاء تثبيت PassKeeper إلى حذف جميع البيانات المخزنة محلياً بشكل نهائي. وبما أننا لم نمتلك نسخة منها أصلاً، فلا يوجد شيء آخر لحذفه من جانبنا.';

  @override
  String get privacyPolicyChangesTitle => 'التغييرات على هذه السياسة';

  @override
  String get privacyPolicyChangesBody =>
      'في حال تغيير هذه السياسة، سنقوم بتحديث التاريخ أعلاه، وإخطارك داخل التطبيق في حال حدوث أي تغيير جوهري.';

  @override
  String get privacyPolicyContactTitle => 'تواصل معنا';

  @override
  String get privacyPolicyContactBody =>
      'يمكن إرسال الأسئلة حول هذه السياسة إلى bavleymourad@gmail.com.';
}
