import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'obscure_text.g.dart';

@riverpod
class ObscureText extends _$ObscureText {
  @override
  bool build(String key) => true;

  void toggle() => state = !state;
}

abstract class ObscureTextKeys {
  static const String pin = 'pin';
  static const String confirmPin = 'confirmPin';
}
