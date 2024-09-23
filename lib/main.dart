import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc_check_time_attendance/app_naviagor.dart';
import 'package:poc_check_time_attendance/app_router.dart';
import 'package:poc_check_time_attendance/base_utils.dart';
import 'package:poc_check_time_attendance/home_controller.dart';
import 'package:poc_check_time_attendance/student_model.dart';

Future<void> main() async {
  await runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      final container = ProviderContainer(
        overrides: [],
      );

      await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp],
      );

      runApp(
        UncontrolledProviderScope(
          container: container,
          child: const MyApp(),
        ),
      );
    },
    (error, stack) {},
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appNavigator = ref.watch(appNavigatorProvider);

    return MaterialApp(
      navigatorKey: appNavigator.navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouter.initialRouterName,
      onGenerateRoute: AppRouter.router,
      title: 'SYS',
      builder: (context, child) {
        return SizedBox(
          child: child,
        );
      },
    );
  }
}

class StudentListPage extends ConsumerStatefulWidget {
  static const routeName = "StudentListPage";

  const StudentListPage({super.key});

  @override
  _StudentListPageState createState() => _StudentListPageState();
}

class _StudentListPageState extends ConsumerState<StudentListPage>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((value) {
      ref.read(homeControllerProvider.notifier).getStudentList();
    });
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    final studentList = ref.watch(
      homeControllerProvider.select(
        (value) => value.studentList,
      ),
    );

    final searchStudentList = ref.watch(
      homeControllerProvider.select(
        (value) => value.searchStudentList,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Time Attendence'),
        actions: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 200,
                    color: Colors.lightBlueAccent,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ElevatedButton(
                            child: const Text('กิจกรรม'),
                            onPressed: () async {
                              await ref
                                  .read(baseUtilsProvider)
                                  .launchURL("https://www.google.com/");
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          ElevatedButton(
                            child: const Text('ตารางเรียน'),
                            onPressed: () async {
                              await ref
                                  .read(baseUtilsProvider)
                                  .launchURL("https://www.google.com/");
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: const Icon(Icons.emoji_objects),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              onChanged: (val) {
                ref
                    .read(homeControllerProvider.notifier)
                    .onSearchStudentList(val);
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Search',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (_, index) {
                late StudentModel student;
                if (searchStudentList != null && searchStudentList.isNotEmpty) {
                  student = searchStudentList[index];
                } else {
                  student = studentList[index];
                }

                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      StudentDetailPage.routeName,
                      arguments: StudentDetailPageArgs(
                        studentModel: student,
                      ),
                    );
                  },
                  child: Container(
                    color: Colors.lightBlueAccent,
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('ชื่อ: ${student.firstName} ${student.lastName}'),
                        const SizedBox(
                          height: 4,
                        ),
                        Text('รหัสนักศึกษา: ${student.studentId}'),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (_, __) => const SizedBox(
                height: 8,
              ),
              itemCount: (searchStudentList ?? studentList).length,
            ),
          ],
        ),
      ),
    );
  }
}

class StudentDetailPageArgs {
  final StudentModel studentModel;

  StudentDetailPageArgs({required this.studentModel});
}

class StudentDetailPage extends ConsumerStatefulWidget {
  static const routeName = "StudentDetailPage";
  final StudentDetailPageArgs args;

  const StudentDetailPage({super.key, required this.args});

  @override
  _StudentDetailPageState createState() => _StudentDetailPageState();
}

class _StudentDetailPageState extends ConsumerState<StudentDetailPage> {
  DateTime? _selectedDate;
  TimeOfDay? _seltectedTime;

  @override
  Widget build(BuildContext context) {
    final student = widget.args.studentModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Time Attendence'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('ชื่อ: ${student.firstName} ${student.lastName}'),
              const SizedBox(
                height: 4,
              ),
              Text('รหัสนักศึกษา: ${student.studentId}'),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () async {
                  await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2050),
                  ).then((DateTime? selected) {
                    if (selected != null && selected != _selectedDate) {
                      setState(() => _selectedDate = selected);
                    }
                  });

                  await showTimePicker(
                    initialTime: TimeOfDay.now(),
                    context: context,
                  ).then((TimeOfDay? selected) {
                    if (selected != null && selected != _seltectedTime) {
                      setState(() => _seltectedTime = selected);
                    }
                  });

                  final snackBar = SnackBar(
                    content: Text(
                        'Time Attendance: ${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year} เวลา: ${_seltectedTime!.hour}:${_seltectedTime!.minute}'),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: Colors.blueAccent,
                    ),
                  ),
                  child: const Text('Save Time Attendance'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
