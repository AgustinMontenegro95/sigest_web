// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'log_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LogModel _$LogModelFromJson(Map<String, dynamic> json) {
  return _LogModel.fromJson(json);
}

/// @nodoc
mixin _$LogModel {
  String get action => throw _privateConstructorUsedError;
  String get desc => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LogModelCopyWith<LogModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogModelCopyWith<$Res> {
  factory $LogModelCopyWith(LogModel value, $Res Function(LogModel) then) =
      _$LogModelCopyWithImpl<$Res>;
  $Res call({String action, String desc, String date});
}

/// @nodoc
class _$LogModelCopyWithImpl<$Res> implements $LogModelCopyWith<$Res> {
  _$LogModelCopyWithImpl(this._value, this._then);

  final LogModel _value;
  // ignore: unused_field
  final $Res Function(LogModel) _then;

  @override
  $Res call({
    Object? action = freezed,
    Object? desc = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      desc: desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_LogModelCopyWith<$Res> implements $LogModelCopyWith<$Res> {
  factory _$$_LogModelCopyWith(
          _$_LogModel value, $Res Function(_$_LogModel) then) =
      __$$_LogModelCopyWithImpl<$Res>;
  @override
  $Res call({String action, String desc, String date});
}

/// @nodoc
class __$$_LogModelCopyWithImpl<$Res> extends _$LogModelCopyWithImpl<$Res>
    implements _$$_LogModelCopyWith<$Res> {
  __$$_LogModelCopyWithImpl(
      _$_LogModel _value, $Res Function(_$_LogModel) _then)
      : super(_value, (v) => _then(v as _$_LogModel));

  @override
  _$_LogModel get _value => super._value as _$_LogModel;

  @override
  $Res call({
    Object? action = freezed,
    Object? desc = freezed,
    Object? date = freezed,
  }) {
    return _then(_$_LogModel(
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      desc: desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LogModel implements _LogModel {
  const _$_LogModel(
      {required this.action, required this.desc, required this.date});

  factory _$_LogModel.fromJson(Map<String, dynamic> json) =>
      _$$_LogModelFromJson(json);

  @override
  final String action;
  @override
  final String desc;
  @override
  final String date;

  @override
  String toString() {
    return 'LogModel(action: $action, desc: $desc, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LogModel &&
            const DeepCollectionEquality().equals(other.action, action) &&
            const DeepCollectionEquality().equals(other.desc, desc) &&
            const DeepCollectionEquality().equals(other.date, date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(action),
      const DeepCollectionEquality().hash(desc),
      const DeepCollectionEquality().hash(date));

  @JsonKey(ignore: true)
  @override
  _$$_LogModelCopyWith<_$_LogModel> get copyWith =>
      __$$_LogModelCopyWithImpl<_$_LogModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LogModelToJson(
      this,
    );
  }
}

abstract class _LogModel implements LogModel {
  const factory _LogModel(
      {required final String action,
      required final String desc,
      required final String date}) = _$_LogModel;

  factory _LogModel.fromJson(Map<String, dynamic> json) = _$_LogModel.fromJson;

  @override
  String get action;
  @override
  String get desc;
  @override
  String get date;
  @override
  @JsonKey(ignore: true)
  _$$_LogModelCopyWith<_$_LogModel> get copyWith =>
      throw _privateConstructorUsedError;
}
