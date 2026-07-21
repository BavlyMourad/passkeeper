// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passwords_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(passwords)
final passwordsProvider = PasswordsProvider._();

final class PasswordsProvider
    extends $FunctionalProvider<List<Password>, List<Password>, List<Password>>
    with $Provider<List<Password>> {
  PasswordsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'passwordsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$passwordsHash();

  @$internal
  @override
  $ProviderElement<List<Password>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Password> create(Ref ref) {
    return passwords(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Password> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Password>>(value),
    );
  }
}

String _$passwordsHash() => r'd581892cc375ac03fe8cdc17e7b63ab782398e8d';
