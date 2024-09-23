import 'package:freezed_annotation/freezed_annotation.dart';

part 'student_model.freezed.dart';
part 'student_model.g.dart';

@immutable
@freezed
abstract class StudentModel with _$StudentModel {
  const factory StudentModel({
    required int id,
    required String firstName,
    required String lastName,
    required String nickName,
    required String studentId,
  }) = _StudentModel;

  factory StudentModel.fromJson(Map<String, dynamic> json) =>
      _$StudentModelFromJson(json);
}
