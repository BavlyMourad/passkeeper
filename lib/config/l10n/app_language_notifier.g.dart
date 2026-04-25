// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_language_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppLanguageNotifier)
final appLanguageProvider = AppLanguageNotifierProvider._();

final class AppLanguageNotifierProvider
    extends $NotifierProvider<AppLanguageNotifier, AppLanguage> {
  AppLanguageNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appLanguageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appLanguageNotifierHash();

  @$internal
  @override
  AppLanguageNotifier create() => AppLanguageNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppLanguage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppLanguage>(value),
    );
  }
}

String _$appLanguageNotifierHash() =>
    r'7646c9e6264e2c5d09b5dda6917afafbc003c6bf';

abstract class _$AppLanguageNotifier extends $Notifier<AppLanguage> {
  AppLanguage build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AppLanguage, AppLanguage>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppLanguage, AppLanguage>,
              AppLanguage,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
