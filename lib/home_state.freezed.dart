// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
  List<StudentModel> get studentList => throw _privateConstructorUsedError;
  List<StudentModel>? get searchStudentList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {List<StudentModel> studentList, List<StudentModel>? searchStudentList});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? studentList = null,
    Object? searchStudentList = freezed,
  }) {
    return _then(_value.copyWith(
      studentList: null == studentList
          ? _value.studentList
          : studentList // ignore: cast_nullable_to_non_nullable
              as List<StudentModel>,
      searchStudentList: freezed == searchStudentList
          ? _value.searchStudentList
          : searchStudentList // ignore: cast_nullable_to_non_nullable
              as List<StudentModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<StudentModel> studentList, List<StudentModel>? searchStudentList});
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? studentList = null,
    Object? searchStudentList = freezed,
  }) {
    return _then(_$HomeStateImpl(
      studentList: null == studentList
          ? _value._studentList
          : studentList // ignore: cast_nullable_to_non_nullable
              as List<StudentModel>,
      searchStudentList: freezed == searchStudentList
          ? _value._searchStudentList
          : searchStudentList // ignore: cast_nullable_to_non_nullable
              as List<StudentModel>?,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  _$HomeStateImpl(
      {final List<StudentModel> studentList = const [],
      final List<StudentModel>? searchStudentList})
      : _studentList = studentList,
        _searchStudentList = searchStudentList;

  final List<StudentModel> _studentList;
  @override
  @JsonKey()
  List<StudentModel> get studentList {
    if (_studentList is EqualUnmodifiableListView) return _studentList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_studentList);
  }

  final List<StudentModel>? _searchStudentList;
  @override
  List<StudentModel>? get searchStudentList {
    final value = _searchStudentList;
    if (value == null) return null;
    if (_searchStudentList is EqualUnmodifiableListView)
      return _searchStudentList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'HomeState(studentList: $studentList, searchStudentList: $searchStudentList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            const DeepCollectionEquality()
                .equals(other._studentList, _studentList) &&
            const DeepCollectionEquality()
                .equals(other._searchStudentList, _searchStudentList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_studentList),
      const DeepCollectionEquality().hash(_searchStudentList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  factory _HomeState(
      {final List<StudentModel> studentList,
      final List<StudentModel>? searchStudentList}) = _$HomeStateImpl;

  @override
  List<StudentModel> get studentList;
  @override
  List<StudentModel>? get searchStudentList;
  @override
  @JsonKey(ignore: true)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
