// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ThemeModel {
  Color? get color => throw _privateConstructorUsedError;
  String? get key => throw _privateConstructorUsedError;
  bool? get isSelected => throw _privateConstructorUsedError;

  /// Create a copy of ThemeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ThemeModelCopyWith<ThemeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeModelCopyWith<$Res> {
  factory $ThemeModelCopyWith(
          ThemeModel value, $Res Function(ThemeModel) then) =
      _$ThemeModelCopyWithImpl<$Res, ThemeModel>;
  @useResult
  $Res call({Color? color, String? key, bool? isSelected});
}

/// @nodoc
class _$ThemeModelCopyWithImpl<$Res, $Val extends ThemeModel>
    implements $ThemeModelCopyWith<$Res> {
  _$ThemeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ThemeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = freezed,
    Object? key = freezed,
    Object? isSelected = freezed,
  }) {
    return _then(_value.copyWith(
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      isSelected: freezed == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ThemeModelImplCopyWith<$Res>
    implements $ThemeModelCopyWith<$Res> {
  factory _$$ThemeModelImplCopyWith(
          _$ThemeModelImpl value, $Res Function(_$ThemeModelImpl) then) =
      __$$ThemeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Color? color, String? key, bool? isSelected});
}

/// @nodoc
class __$$ThemeModelImplCopyWithImpl<$Res>
    extends _$ThemeModelCopyWithImpl<$Res, _$ThemeModelImpl>
    implements _$$ThemeModelImplCopyWith<$Res> {
  __$$ThemeModelImplCopyWithImpl(
      _$ThemeModelImpl _value, $Res Function(_$ThemeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ThemeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = freezed,
    Object? key = freezed,
    Object? isSelected = freezed,
  }) {
    return _then(_$ThemeModelImpl(
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      isSelected: freezed == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$ThemeModelImpl implements _ThemeModel {
  _$ThemeModelImpl(
      {this.color = Colors.white, this.key = "light", this.isSelected = false});

  @override
  @JsonKey()
  final Color? color;
  @override
  @JsonKey()
  final String? key;
  @override
  @JsonKey()
  final bool? isSelected;

  @override
  String toString() {
    return 'ThemeModel(color: $color, key: $key, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThemeModelImpl &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, color, key, isSelected);

  /// Create a copy of ThemeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ThemeModelImplCopyWith<_$ThemeModelImpl> get copyWith =>
      __$$ThemeModelImplCopyWithImpl<_$ThemeModelImpl>(this, _$identity);
}

abstract class _ThemeModel implements ThemeModel {
  factory _ThemeModel(
      {final Color? color,
      final String? key,
      final bool? isSelected}) = _$ThemeModelImpl;

  @override
  Color? get color;
  @override
  String? get key;
  @override
  bool? get isSelected;

  /// Create a copy of ThemeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThemeModelImplCopyWith<_$ThemeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
