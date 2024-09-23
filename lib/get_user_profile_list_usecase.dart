import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc_check_time_attendance/gen/assets.gen.dart';
import 'package:poc_check_time_attendance/json_loader_util.dart';
import 'package:poc_check_time_attendance/student_model.dart';
import 'package:poc_check_time_attendance/usecase.dart';

final getUserProfileListUsecase = Provider<GetUserProfileListUsecase>((ref) {
  return GetUserProfileListUsecase(
    ref,
  );
});

class GetUserProfileListUsecase extends UseCase<void, List<StudentModel>> {
  GetUserProfileListUsecase(
    Ref ref,
  );

  @override
  Future<List<StudentModel>> exec(
    void request,
  ) async {
    final result = await JSONLoaderUtil.loadFile<List<StudentModel>>(
      Assets.mocks.mockUserProfile,
      (json) {
        return (json as List)
            .map((studentJson) => StudentModel.fromJson(studentJson))
            .toList();
      },
    );
    return result;
  }
}
