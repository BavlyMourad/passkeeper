// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'password.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Password {

 String get id; String get title; String? get username; String get encryptedPassword; String? get url; List<String> get categoryIds; bool get isFavourite; String? get logo; DateTime get createdAt; DateTime get updatedAt; String get iv;
/// Create a copy of Password
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PasswordCopyWith<Password> get copyWith => _$PasswordCopyWithImpl<Password>(this as Password, _$identity);

  /// Serializes this Password to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Password&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.username, username) || other.username == username)&&(identical(other.encryptedPassword, encryptedPassword) || other.encryptedPassword == encryptedPassword)&&(identical(other.url, url) || other.url == url)&&const DeepCollectionEquality().equals(other.categoryIds, categoryIds)&&(identical(other.isFavourite, isFavourite) || other.isFavourite == isFavourite)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.iv, iv) || other.iv == iv));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,username,encryptedPassword,url,const DeepCollectionEquality().hash(categoryIds),isFavourite,logo,createdAt,updatedAt,iv);

@override
String toString() {
  return 'Password(id: $id, title: $title, username: $username, encryptedPassword: $encryptedPassword, url: $url, categoryIds: $categoryIds, isFavourite: $isFavourite, logo: $logo, createdAt: $createdAt, updatedAt: $updatedAt, iv: $iv)';
}


}

/// @nodoc
abstract mixin class $PasswordCopyWith<$Res>  {
  factory $PasswordCopyWith(Password value, $Res Function(Password) _then) = _$PasswordCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? username, String encryptedPassword, String? url, List<String> categoryIds, bool isFavourite, String? logo, DateTime createdAt, DateTime updatedAt, String iv
});




}
/// @nodoc
class _$PasswordCopyWithImpl<$Res>
    implements $PasswordCopyWith<$Res> {
  _$PasswordCopyWithImpl(this._self, this._then);

  final Password _self;
  final $Res Function(Password) _then;

/// Create a copy of Password
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? username = freezed,Object? encryptedPassword = null,Object? url = freezed,Object? categoryIds = null,Object? isFavourite = null,Object? logo = freezed,Object? createdAt = null,Object? updatedAt = null,Object? iv = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,encryptedPassword: null == encryptedPassword ? _self.encryptedPassword : encryptedPassword // ignore: cast_nullable_to_non_nullable
as String,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,categoryIds: null == categoryIds ? _self.categoryIds : categoryIds // ignore: cast_nullable_to_non_nullable
as List<String>,isFavourite: null == isFavourite ? _self.isFavourite : isFavourite // ignore: cast_nullable_to_non_nullable
as bool,logo: freezed == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,iv: null == iv ? _self.iv : iv // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Password].
extension PasswordPatterns on Password {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Password value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Password() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Password value)  $default,){
final _that = this;
switch (_that) {
case _Password():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Password value)?  $default,){
final _that = this;
switch (_that) {
case _Password() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String? username,  String encryptedPassword,  String? url,  List<String> categoryIds,  bool isFavourite,  String? logo,  DateTime createdAt,  DateTime updatedAt,  String iv)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Password() when $default != null:
return $default(_that.id,_that.title,_that.username,_that.encryptedPassword,_that.url,_that.categoryIds,_that.isFavourite,_that.logo,_that.createdAt,_that.updatedAt,_that.iv);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String? username,  String encryptedPassword,  String? url,  List<String> categoryIds,  bool isFavourite,  String? logo,  DateTime createdAt,  DateTime updatedAt,  String iv)  $default,) {final _that = this;
switch (_that) {
case _Password():
return $default(_that.id,_that.title,_that.username,_that.encryptedPassword,_that.url,_that.categoryIds,_that.isFavourite,_that.logo,_that.createdAt,_that.updatedAt,_that.iv);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String? username,  String encryptedPassword,  String? url,  List<String> categoryIds,  bool isFavourite,  String? logo,  DateTime createdAt,  DateTime updatedAt,  String iv)?  $default,) {final _that = this;
switch (_that) {
case _Password() when $default != null:
return $default(_that.id,_that.title,_that.username,_that.encryptedPassword,_that.url,_that.categoryIds,_that.isFavourite,_that.logo,_that.createdAt,_that.updatedAt,_that.iv);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Password implements Password {
  const _Password({required this.id, required this.title, this.username, required this.encryptedPassword, this.url, final  List<String> categoryIds = const [], required this.isFavourite, this.logo, required this.createdAt, required this.updatedAt, required this.iv}): _categoryIds = categoryIds;
  factory _Password.fromJson(Map<String, dynamic> json) => _$PasswordFromJson(json);

@override final  String id;
@override final  String title;
@override final  String? username;
@override final  String encryptedPassword;
@override final  String? url;
 final  List<String> _categoryIds;
@override@JsonKey() List<String> get categoryIds {
  if (_categoryIds is EqualUnmodifiableListView) return _categoryIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categoryIds);
}

@override final  bool isFavourite;
@override final  String? logo;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  String iv;

/// Create a copy of Password
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PasswordCopyWith<_Password> get copyWith => __$PasswordCopyWithImpl<_Password>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PasswordToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Password&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.username, username) || other.username == username)&&(identical(other.encryptedPassword, encryptedPassword) || other.encryptedPassword == encryptedPassword)&&(identical(other.url, url) || other.url == url)&&const DeepCollectionEquality().equals(other._categoryIds, _categoryIds)&&(identical(other.isFavourite, isFavourite) || other.isFavourite == isFavourite)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.iv, iv) || other.iv == iv));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,username,encryptedPassword,url,const DeepCollectionEquality().hash(_categoryIds),isFavourite,logo,createdAt,updatedAt,iv);

@override
String toString() {
  return 'Password(id: $id, title: $title, username: $username, encryptedPassword: $encryptedPassword, url: $url, categoryIds: $categoryIds, isFavourite: $isFavourite, logo: $logo, createdAt: $createdAt, updatedAt: $updatedAt, iv: $iv)';
}


}

/// @nodoc
abstract mixin class _$PasswordCopyWith<$Res> implements $PasswordCopyWith<$Res> {
  factory _$PasswordCopyWith(_Password value, $Res Function(_Password) _then) = __$PasswordCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? username, String encryptedPassword, String? url, List<String> categoryIds, bool isFavourite, String? logo, DateTime createdAt, DateTime updatedAt, String iv
});




}
/// @nodoc
class __$PasswordCopyWithImpl<$Res>
    implements _$PasswordCopyWith<$Res> {
  __$PasswordCopyWithImpl(this._self, this._then);

  final _Password _self;
  final $Res Function(_Password) _then;

/// Create a copy of Password
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? username = freezed,Object? encryptedPassword = null,Object? url = freezed,Object? categoryIds = null,Object? isFavourite = null,Object? logo = freezed,Object? createdAt = null,Object? updatedAt = null,Object? iv = null,}) {
  return _then(_Password(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,encryptedPassword: null == encryptedPassword ? _self.encryptedPassword : encryptedPassword // ignore: cast_nullable_to_non_nullable
as String,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,categoryIds: null == categoryIds ? _self._categoryIds : categoryIds // ignore: cast_nullable_to_non_nullable
as List<String>,isFavourite: null == isFavourite ? _self.isFavourite : isFavourite // ignore: cast_nullable_to_non_nullable
as bool,logo: freezed == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,iv: null == iv ? _self.iv : iv // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
