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
}
