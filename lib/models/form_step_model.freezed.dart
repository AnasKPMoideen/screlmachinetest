// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_step_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FormStepModel {
  String get title => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  StepStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FormStepModelCopyWith<FormStepModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormStepModelCopyWith<$Res> {
  factory $FormStepModelCopyWith(
          FormStepModel value, $Res Function(FormStepModel) then) =
      _$FormStepModelCopyWithImpl<$Res, FormStepModel>;
  @useResult
  $Res call({String title, String label, StepStatus status});
}

/// @nodoc
class _$FormStepModelCopyWithImpl<$Res, $Val extends FormStepModel>
    implements $FormStepModelCopyWith<$Res> {
  _$FormStepModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? label = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StepStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FormStepModelImplCopyWith<$Res>
    implements $FormStepModelCopyWith<$Res> {
  factory _$$FormStepModelImplCopyWith(
          _$FormStepModelImpl value, $Res Function(_$FormStepModelImpl) then) =
      __$$FormStepModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String label, StepStatus status});
}

/// @nodoc
class __$$FormStepModelImplCopyWithImpl<$Res>
    extends _$FormStepModelCopyWithImpl<$Res, _$FormStepModelImpl>
    implements _$$FormStepModelImplCopyWith<$Res> {
  __$$FormStepModelImplCopyWithImpl(
      _$FormStepModelImpl _value, $Res Function(_$FormStepModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? label = null,
    Object? status = null,
  }) {
    return _then(_$FormStepModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StepStatus,
    ));
  }
}

/// @nodoc

class _$FormStepModelImpl implements _FormStepModel {
  const _$FormStepModelImpl(
      {required this.title,
      required this.label,
      this.status = StepStatus.pending});

  @override
  final String title;
  @override
  final String label;
  @override
  @JsonKey()
  final StepStatus status;

  @override
  String toString() {
    return 'FormStepModel(title: $title, label: $label, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormStepModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, label, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FormStepModelImplCopyWith<_$FormStepModelImpl> get copyWith =>
      __$$FormStepModelImplCopyWithImpl<_$FormStepModelImpl>(this, _$identity);
}

abstract class _FormStepModel implements FormStepModel {
  const factory _FormStepModel(
      {required final String title,
      required final String label,
      final StepStatus status}) = _$FormStepModelImpl;

  @override
  String get title;
  @override
  String get label;
  @override
  StepStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$FormStepModelImplCopyWith<_$FormStepModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}