// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_news_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HomeNewsList _$HomeNewsListFromJson(Map<String, dynamic> json) {
  return _HomeNewsList.fromJson(json);
}

/// @nodoc
mixin _$HomeNewsList {
  List<HomeNewsItem>? get list => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeNewsListCopyWith<HomeNewsList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeNewsListCopyWith<$Res> {
  factory $HomeNewsListCopyWith(
          HomeNewsList value, $Res Function(HomeNewsList) then) =
      _$HomeNewsListCopyWithImpl<$Res, HomeNewsList>;
  @useResult
  $Res call({List<HomeNewsItem>? list});
}

/// @nodoc
class _$HomeNewsListCopyWithImpl<$Res, $Val extends HomeNewsList>
    implements $HomeNewsListCopyWith<$Res> {
  _$HomeNewsListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = freezed,
  }) {
    return _then(_value.copyWith(
      list: freezed == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<HomeNewsItem>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeNewsListImplCopyWith<$Res>
    implements $HomeNewsListCopyWith<$Res> {
  factory _$$HomeNewsListImplCopyWith(
          _$HomeNewsListImpl value, $Res Function(_$HomeNewsListImpl) then) =
      __$$HomeNewsListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<HomeNewsItem>? list});
}

/// @nodoc
class __$$HomeNewsListImplCopyWithImpl<$Res>
    extends _$HomeNewsListCopyWithImpl<$Res, _$HomeNewsListImpl>
    implements _$$HomeNewsListImplCopyWith<$Res> {
  __$$HomeNewsListImplCopyWithImpl(
      _$HomeNewsListImpl _value, $Res Function(_$HomeNewsListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = freezed,
  }) {
    return _then(_$HomeNewsListImpl(
      list: freezed == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<HomeNewsItem>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeNewsListImpl implements _HomeNewsList {
  _$HomeNewsListImpl({final List<HomeNewsItem>? list}) : _list = list;

  factory _$HomeNewsListImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeNewsListImplFromJson(json);

  final List<HomeNewsItem>? _list;
  @override
  List<HomeNewsItem>? get list {
    final value = _list;
    if (value == null) return null;
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'HomeNewsList(list: $list)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeNewsListImpl &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_list));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeNewsListImplCopyWith<_$HomeNewsListImpl> get copyWith =>
      __$$HomeNewsListImplCopyWithImpl<_$HomeNewsListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeNewsListImplToJson(
      this,
    );
  }
}

abstract class _HomeNewsList implements HomeNewsList {
  factory _HomeNewsList({final List<HomeNewsItem>? list}) = _$HomeNewsListImpl;

  factory _HomeNewsList.fromJson(Map<String, dynamic> json) =
      _$HomeNewsListImpl.fromJson;

  @override
  List<HomeNewsItem>? get list;
  @override
  @JsonKey(ignore: true)
  _$$HomeNewsListImplCopyWith<_$HomeNewsListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HomeNewsItem _$HomeNewsItemFromJson(Map<String, dynamic> json) {
  return _HomeNewsItem.fromJson(json);
}

/// @nodoc
mixin _$HomeNewsItem {
  String? get seq => throw _privateConstructorUsedError;
  String? get UserName => throw _privateConstructorUsedError;
  String? get Title => throw _privateConstructorUsedError;
  String? get RegiDate => throw _privateConstructorUsedError;
  String? get RegiTime => throw _privateConstructorUsedError;
  int? get Hit => throw _privateConstructorUsedError;
  String? get Status => throw _privateConstructorUsedError;
  String? get fix => throw _privateConstructorUsedError;
  String? get TopImage => throw _privateConstructorUsedError;
  String? get TopContent => throw _privateConstructorUsedError;
  String? get AttachFileNM => throw _privateConstructorUsedError;
  String? get PhotoFileNM => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeNewsItemCopyWith<HomeNewsItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeNewsItemCopyWith<$Res> {
  factory $HomeNewsItemCopyWith(
          HomeNewsItem value, $Res Function(HomeNewsItem) then) =
      _$HomeNewsItemCopyWithImpl<$Res, HomeNewsItem>;
  @useResult
  $Res call(
      {String? seq,
      String? UserName,
      String? Title,
      String? RegiDate,
      String? RegiTime,
      int? Hit,
      String? Status,
      String? fix,
      String? TopImage,
      String? TopContent,
      String? AttachFileNM,
      String? PhotoFileNM});
}

/// @nodoc
class _$HomeNewsItemCopyWithImpl<$Res, $Val extends HomeNewsItem>
    implements $HomeNewsItemCopyWith<$Res> {
  _$HomeNewsItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seq = freezed,
    Object? UserName = freezed,
    Object? Title = freezed,
    Object? RegiDate = freezed,
    Object? RegiTime = freezed,
    Object? Hit = freezed,
    Object? Status = freezed,
    Object? fix = freezed,
    Object? TopImage = freezed,
    Object? TopContent = freezed,
    Object? AttachFileNM = freezed,
    Object? PhotoFileNM = freezed,
  }) {
    return _then(_value.copyWith(
      seq: freezed == seq
          ? _value.seq
          : seq // ignore: cast_nullable_to_non_nullable
              as String?,
      UserName: freezed == UserName
          ? _value.UserName
          : UserName // ignore: cast_nullable_to_non_nullable
              as String?,
      Title: freezed == Title
          ? _value.Title
          : Title // ignore: cast_nullable_to_non_nullable
              as String?,
      RegiDate: freezed == RegiDate
          ? _value.RegiDate
          : RegiDate // ignore: cast_nullable_to_non_nullable
              as String?,
      RegiTime: freezed == RegiTime
          ? _value.RegiTime
          : RegiTime // ignore: cast_nullable_to_non_nullable
              as String?,
      Hit: freezed == Hit
          ? _value.Hit
          : Hit // ignore: cast_nullable_to_non_nullable
              as int?,
      Status: freezed == Status
          ? _value.Status
          : Status // ignore: cast_nullable_to_non_nullable
              as String?,
      fix: freezed == fix
          ? _value.fix
          : fix // ignore: cast_nullable_to_non_nullable
              as String?,
      TopImage: freezed == TopImage
          ? _value.TopImage
          : TopImage // ignore: cast_nullable_to_non_nullable
              as String?,
      TopContent: freezed == TopContent
          ? _value.TopContent
          : TopContent // ignore: cast_nullable_to_non_nullable
              as String?,
      AttachFileNM: freezed == AttachFileNM
          ? _value.AttachFileNM
          : AttachFileNM // ignore: cast_nullable_to_non_nullable
              as String?,
      PhotoFileNM: freezed == PhotoFileNM
          ? _value.PhotoFileNM
          : PhotoFileNM // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeNewsItemImplCopyWith<$Res>
    implements $HomeNewsItemCopyWith<$Res> {
  factory _$$HomeNewsItemImplCopyWith(
          _$HomeNewsItemImpl value, $Res Function(_$HomeNewsItemImpl) then) =
      __$$HomeNewsItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? seq,
      String? UserName,
      String? Title,
      String? RegiDate,
      String? RegiTime,
      int? Hit,
      String? Status,
      String? fix,
      String? TopImage,
      String? TopContent,
      String? AttachFileNM,
      String? PhotoFileNM});
}

/// @nodoc
class __$$HomeNewsItemImplCopyWithImpl<$Res>
    extends _$HomeNewsItemCopyWithImpl<$Res, _$HomeNewsItemImpl>
    implements _$$HomeNewsItemImplCopyWith<$Res> {
  __$$HomeNewsItemImplCopyWithImpl(
      _$HomeNewsItemImpl _value, $Res Function(_$HomeNewsItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seq = freezed,
    Object? UserName = freezed,
    Object? Title = freezed,
    Object? RegiDate = freezed,
    Object? RegiTime = freezed,
    Object? Hit = freezed,
    Object? Status = freezed,
    Object? fix = freezed,
    Object? TopImage = freezed,
    Object? TopContent = freezed,
    Object? AttachFileNM = freezed,
    Object? PhotoFileNM = freezed,
  }) {
    return _then(_$HomeNewsItemImpl(
      seq: freezed == seq
          ? _value.seq
          : seq // ignore: cast_nullable_to_non_nullable
              as String?,
      UserName: freezed == UserName
          ? _value.UserName
          : UserName // ignore: cast_nullable_to_non_nullable
              as String?,
      Title: freezed == Title
          ? _value.Title
          : Title // ignore: cast_nullable_to_non_nullable
              as String?,
      RegiDate: freezed == RegiDate
          ? _value.RegiDate
          : RegiDate // ignore: cast_nullable_to_non_nullable
              as String?,
      RegiTime: freezed == RegiTime
          ? _value.RegiTime
          : RegiTime // ignore: cast_nullable_to_non_nullable
              as String?,
      Hit: freezed == Hit
          ? _value.Hit
          : Hit // ignore: cast_nullable_to_non_nullable
              as int?,
      Status: freezed == Status
          ? _value.Status
          : Status // ignore: cast_nullable_to_non_nullable
              as String?,
      fix: freezed == fix
          ? _value.fix
          : fix // ignore: cast_nullable_to_non_nullable
              as String?,
      TopImage: freezed == TopImage
          ? _value.TopImage
          : TopImage // ignore: cast_nullable_to_non_nullable
              as String?,
      TopContent: freezed == TopContent
          ? _value.TopContent
          : TopContent // ignore: cast_nullable_to_non_nullable
              as String?,
      AttachFileNM: freezed == AttachFileNM
          ? _value.AttachFileNM
          : AttachFileNM // ignore: cast_nullable_to_non_nullable
              as String?,
      PhotoFileNM: freezed == PhotoFileNM
          ? _value.PhotoFileNM
          : PhotoFileNM // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeNewsItemImpl implements _HomeNewsItem {
  _$HomeNewsItemImpl(
      {this.seq,
      this.UserName,
      this.Title,
      this.RegiDate,
      this.RegiTime,
      this.Hit,
      this.Status,
      this.fix,
      this.TopImage,
      this.TopContent,
      this.AttachFileNM,
      this.PhotoFileNM});

  factory _$HomeNewsItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeNewsItemImplFromJson(json);

  @override
  final String? seq;
  @override
  final String? UserName;
  @override
  final String? Title;
  @override
  final String? RegiDate;
  @override
  final String? RegiTime;
  @override
  final int? Hit;
  @override
  final String? Status;
  @override
  final String? fix;
  @override
  final String? TopImage;
  @override
  final String? TopContent;
  @override
  final String? AttachFileNM;
  @override
  final String? PhotoFileNM;

  @override
  String toString() {
    return 'HomeNewsItem(seq: $seq, UserName: $UserName, Title: $Title, RegiDate: $RegiDate, RegiTime: $RegiTime, Hit: $Hit, Status: $Status, fix: $fix, TopImage: $TopImage, TopContent: $TopContent, AttachFileNM: $AttachFileNM, PhotoFileNM: $PhotoFileNM)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeNewsItemImpl &&
            (identical(other.seq, seq) || other.seq == seq) &&
            (identical(other.UserName, UserName) ||
                other.UserName == UserName) &&
            (identical(other.Title, Title) || other.Title == Title) &&
            (identical(other.RegiDate, RegiDate) ||
                other.RegiDate == RegiDate) &&
            (identical(other.RegiTime, RegiTime) ||
                other.RegiTime == RegiTime) &&
            (identical(other.Hit, Hit) || other.Hit == Hit) &&
            (identical(other.Status, Status) || other.Status == Status) &&
            (identical(other.fix, fix) || other.fix == fix) &&
            (identical(other.TopImage, TopImage) ||
                other.TopImage == TopImage) &&
            (identical(other.TopContent, TopContent) ||
                other.TopContent == TopContent) &&
            (identical(other.AttachFileNM, AttachFileNM) ||
                other.AttachFileNM == AttachFileNM) &&
            (identical(other.PhotoFileNM, PhotoFileNM) ||
                other.PhotoFileNM == PhotoFileNM));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      seq,
      UserName,
      Title,
      RegiDate,
      RegiTime,
      Hit,
      Status,
      fix,
      TopImage,
      TopContent,
      AttachFileNM,
      PhotoFileNM);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeNewsItemImplCopyWith<_$HomeNewsItemImpl> get copyWith =>
      __$$HomeNewsItemImplCopyWithImpl<_$HomeNewsItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeNewsItemImplToJson(
      this,
    );
  }
}

abstract class _HomeNewsItem implements HomeNewsItem {
  factory _HomeNewsItem(
      {final String? seq,
      final String? UserName,
      final String? Title,
      final String? RegiDate,
      final String? RegiTime,
      final int? Hit,
      final String? Status,
      final String? fix,
      final String? TopImage,
      final String? TopContent,
      final String? AttachFileNM,
      final String? PhotoFileNM}) = _$HomeNewsItemImpl;

  factory _HomeNewsItem.fromJson(Map<String, dynamic> json) =
      _$HomeNewsItemImpl.fromJson;

  @override
  String? get seq;
  @override
  String? get UserName;
  @override
  String? get Title;
  @override
  String? get RegiDate;
  @override
  String? get RegiTime;
  @override
  int? get Hit;
  @override
  String? get Status;
  @override
  String? get fix;
  @override
  String? get TopImage;
  @override
  String? get TopContent;
  @override
  String? get AttachFileNM;
  @override
  String? get PhotoFileNM;
  @override
  @JsonKey(ignore: true)
  _$$HomeNewsItemImplCopyWith<_$HomeNewsItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
