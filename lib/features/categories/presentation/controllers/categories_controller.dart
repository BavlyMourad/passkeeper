import 'package:passkeeper/features/categories/application/category_service.dart';
import 'package:passkeeper/features/categories/presentation/providers/categories_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'categories_controller.g.dart';

@riverpod
class CategoriesController extends _$CategoriesController {
  @override
  FutureOr<void> build() {
    return null;
  }

  Future<void> createCategory(String name) async {
    final service = ref.read(categoryServiceProvider);

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await service.createCategory(name);
      ref.invalidate(categoriesProvider);
    });
  }
}
