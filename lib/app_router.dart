import 'package:flutter/material.dart';
import 'package:poc_check_time_attendance/custom_page_route_builder.dart';
import 'package:poc_check_time_attendance/main.dart';

class AppRouter {
  static const initialRouterName = StudentListPage.routeName;

  static Route<dynamic>? router(RouteSettings settings) {
    switch (settings.name) {
      case StudentListPage.routeName:
        return CustomPageRouteBuilder.route(
          name: StudentListPage.routeName,
          builder: (ctx) => const StudentListPage(),
          transitionType: RouteTransition.fade,
        );

      case StudentDetailPage.routeName:
        assert(
          settings.arguments is StudentDetailPageArgs ||
              settings.arguments == null,
          'arguments must be StudentDetailPageArgs',
        );

        final args = settings.arguments as StudentDetailPageArgs;

        return CustomPageRouteBuilder.route(
          name: StudentDetailPage.routeName,
          builder: (ctx) => StudentDetailPage(
            args: args,
          ),
          transitionType: RouteTransition.fade,
        );

      default:
        assert(false, 'this should not be reached');
        return null;
    }
  }
}
