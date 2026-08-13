// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtered_passwords_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(filteredPasswords)
final filteredPasswordsProvider = FilteredPasswordsFamily._();

final class FilteredPasswordsProvider
    extends $FunctionalProvider<List<Password>, List<Password>, List<Password>>
    with $Provider<List<Password>> {
  FilteredPasswordsProvider._({
    required FilteredPasswordsFamily super.from,
    required (String, String?, bool?, bool) super.argument,
  }) : super(
         retry: null,
         name: r'filteredPasswordsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$filteredPasswordsHash();

  @override
  String toString() {
    return r'filteredPasswordsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<List<Password>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Password> create(Ref ref) {
    final argument = this.argument as (String, String?, bool?, bool);
    return filteredPasswords(
      ref,
      argument.$1,
      argument.$2,
      argument.$3,
      argument.$4,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Password> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Password>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FilteredPasswordsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$filteredPasswordsHash() => r'9377c93b3cc8b0d8c48fad578d78f41bce0ea017';

final class FilteredPasswordsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          List<Password>,
          (String, String?, bool?, bool)
        > {
  FilteredPasswordsFamily._()
    : super(
        retry: null,
        name: r'filteredPasswordsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FilteredPasswordsProvider call(
    String searchQuery,
    String? categoryId,
    bool? isFavourite,
    bool isAscending,
  ) => FilteredPasswordsProvider._(
    argument: (searchQuery, categoryId, isFavourite, isAscending),
    from: this,
  );

  @override
  String toString() => r'filteredPasswordsProvider';
}
