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
  String get pinMismatch =>
      'الأرقام السرية غير متطابقة. يرجى المحاولة مرة أخرى.';

  @override
  String get pinTooShort => 'يجب أن يتكون الرقم السري من 6 أرقام على الأقل.';

  @override
  String get genericError => 'حدث خطأ ما. يرجى المحاولة مرة أخرى.';
}
