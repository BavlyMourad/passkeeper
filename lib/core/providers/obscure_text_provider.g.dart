// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'obscure_text_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ObscureText)
final obscureTextProvider = ObscureTextFamily._();

final class ObscureTextProvider extends $NotifierProvider<ObscureText, bool> {
  ObscureTextProvider._({
    required ObscureTextFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'obscureTextProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$obscureTextHash();

  @override
  String toString() {
    return r'obscureTextProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ObscureText create() => ObscureText();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ObscureTextProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$obscureTextHash() => r'caa6bf92158da358d11fb17821ed3cb74baf88d4';

final class ObscureTextFamily extends $Family
    with $ClassFamilyOverride<ObscureText, bool, bool, bool, String> {
  ObscureTextFamily._()
    : super(
        retry: null,
        name: r'obscureTextProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ObscureTextProvider call(String key) =>
      ObscureTextProvider._(argument: key, from: this);

  @override
  String toString() => r'obscureTextProvider';
}

abstract class _$ObscureText extends $Notifier<bool> {
  late final _$args = ref.$arg as String;
  String get key => _$args;

  bool build(String key);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
