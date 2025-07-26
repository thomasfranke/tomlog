import 'package:tomlog/src/config/tomlog_config.dart';
import 'package:tomlog/src/core/caller_info.dart';
import 'package:tomlog/src/core/log_level.dart';

class TomLog {
  static void log(String message, {LogLevel level = LogLevel.info}) {
    if (level.index < TomLogConfig.minLogLevel.index) return;

    final now = DateTime.now().toIso8601String();
    final prefix = level.name.toUpperCase();
    final caller = getCallerInfo();

    final logLine = '[$now][$prefix][$caller] $message';
    TomLogConfig.output.write(logLine);
  }
}
