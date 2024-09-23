import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poc_check_time_attendance/student_model.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  factory HomeState({
    @Default([]) final List<StudentModel> studentList,
    List<StudentModel>? searchStudentList,
  }) = _HomeState;
}
