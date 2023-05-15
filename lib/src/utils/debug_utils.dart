import 'dart:developer' as developer;
import 'package:logger/logger.dart';

class DebugUtils {
  DebugUtils._();
  factory DebugUtils() => instance;

  static final DebugUtils instance = DebugUtils._();


  // static TimelineTask timeLineTask = TimelineTask()

  // static void timeLineStart(String name) {
  //   timeLineTask.start(name);
  // }

  // static void timeLineFinish() {
  //   timeLineTask.finish();
  // }

  static void log(String message,
      {String name = 'LOG',
      String? error = 'Erro do log',
      StackTrace? stackTrace}) {
    developer.log(message, name: name, error: error, stackTrace: stackTrace);
  }

  static void genericLog(String message, Level level) {
    var logger = Logger(
      printer: PrettyPrinter(),
    );
    logger.log(level, message);
  }

  static void inspec(dynamic obj) {
    developer.inspect(obj);
  }
}
