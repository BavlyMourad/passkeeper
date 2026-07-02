// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Password _$PasswordFromJson(Map<String, dynamic> json) => _Password(
  id: json['id'] as String,
  title: json['title'] as String,
  username: json['username'] as String?,
  encryptedPassword: json['encryptedPassword'] as String,
  url: json['url'] as String?,
  categoryIds:
      (json['categoryIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  isFavourite: json['isFavourite'] as bool,
  logo: json['logo'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  iv: json['iv'] as String,
);

Map<String, dynamic> _$PasswordToJson(_Password instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'username': instance.username,
  'encryptedPassword': instance.encryptedPassword,
  'url': instance.url,
  'categoryIds': instance.categoryIds,
  'isFavourite': instance.isFavourite,
  'logo': instance.logo,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'iv': instance.iv,
};
