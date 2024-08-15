// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TestViewModel {
  String get txt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TestViewModelCopyWith<TestViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestViewModelCopyWith<$Res> {
  factory $TestViewModelCopyWith(
          TestViewModel value, $Res Function(TestViewModel) then) =
      _$TestViewModelCopyWithImpl<$Res, TestViewModel>;
  @useResult
  $Res call({String txt});
}

/// @nodoc
class _$TestViewModelCopyWithImpl<$Res, $Val extends TestViewModel>
    implements $TestViewModelCopyWith<$Res> {
  _$TestViewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? txt = null,
  }) {
    return _then(_value.copyWith(
      txt: null == txt
          ? _value.txt
          : txt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TestViewModelImplCopyWith<$Res>
    implements $TestViewModelCopyWith<$Res> {
  factory _$$TestViewModelImplCopyWith(
          _$TestViewModelImpl value, $Res Function(_$TestViewModelImpl) then) =
      __$$TestViewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String txt});
}

/// @nodoc
class __$$TestViewModelImplCopyWithImpl<$Res>
    extends _$TestViewModelCopyWithImpl<$Res, _$TestViewModelImpl>
    implements _$$TestViewModelImplCopyWith<$Res> {
  __$$TestViewModelImplCopyWithImpl(
      _$TestViewModelImpl _value, $Res Function(_$TestViewModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? txt = null,
  }) {
    return _then(_$TestViewModelImpl(
      txt: null == txt
          ? _value.txt
          : txt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TestViewModelImpl implements _TestViewModel {
  _$TestViewModelImpl({required this.txt});

  @override
  final String txt;

  @override
  String toString() {
    return 'TestViewModel(txt: $txt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TestViewModelImpl &&
            (identical(other.txt, txt) || other.txt == txt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, txt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TestViewModelImplCopyWith<_$TestViewModelImpl> get copyWith =>
      __$$TestViewModelImplCopyWithImpl<_$TestViewModelImpl>(this, _$identity);
}

abstract class _TestViewModel implements TestViewModel {
  factory _TestViewModel({required final String txt}) = _$TestViewModelImpl;

  @override
  String get txt;
  @override
  @JsonKey(ignore: true)
  _$$TestViewModelImplCopyWith<_$TestViewModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
