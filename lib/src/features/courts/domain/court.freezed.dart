// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'court.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Court _$CourtFromJson(Map<String, dynamic> json) {
  return _Court.fromJson(json);
}

/// @nodoc
class _$CourtTearOff {
  const _$CourtTearOff();

  _Court call(
      {int id = -1,
      required String name,
      String address = '',
      String location = '',
      String phone = '',
      String city = ''}) {
    return _Court(
      id: id,
      name: name,
      address: address,
      location: location,
      phone: phone,
      city: city,
    );
  }

  Court fromJson(Map<String, Object?> json) {
    return Court.fromJson(json);
  }
}

/// @nodoc
const $Court = _$CourtTearOff();

/// @nodoc
mixin _$Court {
  int get id => throw _privateConstructorUsedError;
  String get name =>
      throw _privateConstructorUsedError; // @Default('') String idCardNumber,
  String get address => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourtCopyWith<Court> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourtCopyWith<$Res> {
  factory $CourtCopyWith(Court value, $Res Function(Court) then) =
      _$CourtCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      String address,
      String location,
      String phone,
      String city});
}

/// @nodoc
class _$CourtCopyWithImpl<$Res> implements $CourtCopyWith<$Res> {
  _$CourtCopyWithImpl(this._value, this._then);

  final Court _value;
  // ignore: unused_field
  final $Res Function(Court) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? location = freezed,
    Object? phone = freezed,
    Object? city = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CourtCopyWith<$Res> implements $CourtCopyWith<$Res> {
  factory _$CourtCopyWith(_Court value, $Res Function(_Court) then) =
      __$CourtCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      String address,
      String location,
      String phone,
      String city});
}

/// @nodoc
class __$CourtCopyWithImpl<$Res> extends _$CourtCopyWithImpl<$Res>
    implements _$CourtCopyWith<$Res> {
  __$CourtCopyWithImpl(_Court _value, $Res Function(_Court) _then)
      : super(_value, (v) => _then(v as _Court));

  @override
  _Court get _value => super._value as _Court;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? location = freezed,
    Object? phone = freezed,
    Object? city = freezed,
  }) {
    return _then(_Court(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Court implements _Court {
  const _$_Court(
      {this.id = -1,
      required this.name,
      this.address = '',
      this.location = '',
      this.phone = '',
      this.city = ''});

  factory _$_Court.fromJson(Map<String, dynamic> json) =>
      _$$_CourtFromJson(json);

  @JsonKey()
  @override
  final int id;
  @override
  final String name;
  @JsonKey()
  @override // @Default('') String idCardNumber,
  final String address;
  @JsonKey()
  @override
  final String location;
  @JsonKey()
  @override
  final String phone;
  @JsonKey()
  @override
  final String city;

  @override
  String toString() {
    return 'Court(id: $id, name: $name, address: $address, location: $location, phone: $phone, city: $city)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Court &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.location, location) &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality().equals(other.city, city));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(location),
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(city));

  @JsonKey(ignore: true)
  @override
  _$CourtCopyWith<_Court> get copyWith =>
      __$CourtCopyWithImpl<_Court>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CourtToJson(this);
  }
}

abstract class _Court implements Court {
  const factory _Court(
      {int id,
      required String name,
      String address,
      String location,
      String phone,
      String city}) = _$_Court;

  factory _Court.fromJson(Map<String, dynamic> json) = _$_Court.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override // @Default('') String idCardNumber,
  String get address;
  @override
  String get location;
  @override
  String get phone;
  @override
  String get city;
  @override
  @JsonKey(ignore: true)
  _$CourtCopyWith<_Court> get copyWith => throw _privateConstructorUsedError;
}
