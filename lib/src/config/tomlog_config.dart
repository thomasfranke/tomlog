import '../core/log_level.dart';
import '../output/log_output.dart';

class TomLogConfig {
  static LogLevel minLogLevel = LogLevel.debug;
  static LogOutput output = DefaultLogOutput();
}
