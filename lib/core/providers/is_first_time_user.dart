import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_first_time_user.g.dart';

@Riverpod(keepAlive: true)
class IsFirstTimeUser extends _$IsFirstTimeUser {
  @override
  bool build() => false;
}
