// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_details_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CategoryDetailsController)
final categoryDetailsControllerProvider = CategoryDetailsControllerFamily._();

final class CategoryDetailsControllerProvider
    extends $AsyncNotifierProvider<CategoryDetailsController, Category> {
  CategoryDetailsControllerProvider._({
    required CategoryDetailsControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'categoryDetailsControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$categoryDetailsControllerHash();

  @override
  String toString() {
    return r'categoryDetailsControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CategoryDetailsController create() => CategoryDetailsController();

  @override
  bool operator ==(Object other) {
    return other is CategoryDetailsControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$categoryDetailsControllerHash() =>
    r'9328f05da48ce74808c3f85b6267e98cabec4a3b';

final class CategoryDetailsControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          CategoryDetailsController,
          AsyncValue<Category>,
          Category,
          FutureOr<Category>,
          String
        > {
  CategoryDetailsControllerFamily._()
    : super(
        retry: null,
        name: r'categoryDetailsControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CategoryDetailsControllerProvider call(String id) =>
      CategoryDetailsControllerProvider._(argument: id, from: this);

  @override
  String toString() => r'categoryDetailsControllerProvider';
}

abstract class _$CategoryDetailsController extends $AsyncNotifier<Category> {
  late final _$args = ref.$arg as String;
  String get id => _$args;

  FutureOr<Category> build(String id);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Category>, Category>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Category>, Category>,
              AsyncValue<Category>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
