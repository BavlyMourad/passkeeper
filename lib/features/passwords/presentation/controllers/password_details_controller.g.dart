// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_details_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PasswordDetailsController)
final passwordDetailsControllerProvider = PasswordDetailsControllerFamily._();

final class PasswordDetailsControllerProvider
    extends $AsyncNotifierProvider<PasswordDetailsController, Password> {
  PasswordDetailsControllerProvider._({
    required PasswordDetailsControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'passwordDetailsControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$passwordDetailsControllerHash();

  @override
  String toString() {
    return r'passwordDetailsControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PasswordDetailsController create() => PasswordDetailsController();

  @override
  bool operator ==(Object other) {
    return other is PasswordDetailsControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$passwordDetailsControllerHash() =>
    r'654fc01d5edb659e3884b71af750fbff6b32a3b7';

final class PasswordDetailsControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          PasswordDetailsController,
          AsyncValue<Password>,
          Password,
          FutureOr<Password>,
          String
        > {
  PasswordDetailsControllerFamily._()
    : super(
        retry: null,
        name: r'passwordDetailsControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PasswordDetailsControllerProvider call(String id) =>
      PasswordDetailsControllerProvider._(argument: id, from: this);

  @override
  String toString() => r'passwordDetailsControllerProvider';
}

abstract class _$PasswordDetailsController extends $AsyncNotifier<Password> {
  late final _$args = ref.$arg as String;
  String get id => _$args;

  FutureOr<Password> build(String id);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Password>, Password>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Password>, Password>,
              AsyncValue<Password>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
