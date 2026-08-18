// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CategoriesController)
final categoriesControllerProvider = CategoriesControllerProvider._();

final class CategoriesControllerProvider
    extends $AsyncNotifierProvider<CategoriesController, Category?> {
  CategoriesControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'categoriesControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$categoriesControllerHash();

  @$internal
  @override
  CategoriesController create() => CategoriesController();
}

String _$categoriesControllerHash() =>
    r'ec108768933fe02e88c4951c277d659955a08828';

abstract class _$CategoriesController extends $AsyncNotifier<Category?> {
  FutureOr<Category?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Category?>, Category?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Category?>, Category?>,
              AsyncValue<Category?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
