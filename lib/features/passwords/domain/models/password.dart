import 'package:freezed_annotation/freezed_annotation.dart';

part 'password.freezed.dart';
part 'password.g.dart';

@freezed
abstract class Password with _$Password {
  const factory Password({
    required String id,
    required String title,
    String? username,
    required String encryptedPassword,
    String? url,
    @Default([]) List<String> categoryIds,
    required bool isFavourite,
    String? logo,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String iv,
  }) = _Password;

  factory Password.fromJson(Map<String, dynamic> json) =>
      _$PasswordFromJson(json);
}
