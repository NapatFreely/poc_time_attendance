import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc_check_time_attendance/get_user_profile_list_usecase.dart';
import 'package:poc_check_time_attendance/home_state.dart';
import 'package:poc_check_time_attendance/student_model.dart';

final homeControllerProvider = NotifierProvider<HomeController, HomeState>(
  HomeController.new,
);

class HomeController extends Notifier<HomeState> {
  @override
  HomeState build() {
    return HomeState();
  }

  void getStudentList() async {
    final result = await ref.read(getUserProfileListUsecase).execute(null);

    result.when(
      (success) {
        state = state.copyWith(studentList: success);
      },
      (error) => null,
    );
  }

  void onSearchStudentList(String search) async {
    final studentList = state.studentList;

    if (search.isEmpty) {
      state = state.copyWith(searchStudentList: null);
      return;
    }

    if (studentList.isEmpty) return;

    final List<StudentModel> filterStudentList = [];
    for (final item in studentList) {
      final firstName = item.firstName.toLowerCase();
      final lastName = item.lastName.toLowerCase();
      final studentId = item.studentId.toLowerCase();

      if (firstName.contains(search) ||
          lastName.contains(search) ||
          studentId.contains(search)) {
        filterStudentList.add(item);
      }
    }

    state = state.copyWith(searchStudentList: filterStudentList);
  }
}
