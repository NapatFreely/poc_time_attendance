import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:poc_check_time_attendance/failure.dart';

abstract class UseCase<P, R> {
  Logger? _logger;
  Logger get logger {
    if (_logger != null) {
      return _logger!;
    }
    _logger = Logger(runtimeType.toString());
    return _logger!;
  }

  @protected
  Future<R> exec(P request);

  Future<Result<R, Failure>> execute(P request) async {
    try {
      final result = await exec(request);
      return Success(result);
    } catch (e) {
      return Error(
        Failure(
          message: '',
          code: 0,
        ),
      );
    }
  }
}
