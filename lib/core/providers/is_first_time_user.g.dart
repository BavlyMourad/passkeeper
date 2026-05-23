// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'is_first_time_user.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(IsFirstTimeUser)
final isFirstTimeUserProvider = IsFirstTimeUserProvider._();

final class IsFirstTimeUserProvider
    extends $NotifierProvider<IsFirstTimeUser, bool> {
  IsFirstTimeUserProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isFirstTimeUserProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isFirstTimeUserHash();

  @$internal
  @override
  IsFirstTimeUser create() => IsFirstTimeUser();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isFirstTimeUserHash() => r'2d796c772eceade7fd83ebc1d29d6bf9d97e0f1e';

abstract class _$IsFirstTimeUser extends $Notifier<bool> {
  bool build();
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
    element.handleCreate(ref, build);
  }
}
