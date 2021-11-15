import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class Log {
  static void d(dynamic e) {
    if (!kReleaseMode) {
      Logger().d(e);
    }
  }
}
