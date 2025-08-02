import 'package:tomlog/src/core/log_builder.dart';
import 'package:tomlog/src/models.dart/log_category.dart';
import 'package:tomlog/src/models.dart/log_entry.dart';
import 'package:tomlog/tomlog.dart';

///Customizable logger singleton, with support for init and filters.
class TomLog {
  /// Singleton instance
  static final TomLog _instance = TomLog._internal();
  factory TomLog() => _instance;
  TomLog._internal();

  static bool _initialized = false;

  /// Preferência configurável
  late bool _printOnlyCritical;

  /// History buffer.
  final List<TomLogEntry> history = <TomLogEntry>[];

  /// Inicialização única
  static void init({bool printOnlyCritical = false}) {
    if (_initialized) {
      throw StateError('TomLog has already been initialized.');
    }

    _instance._printOnlyCritical = printOnlyCritical;

    _initialized = true;
  }

  /// Logs a debug message.
  void d(final String message, {final TomLogCategory? category}) {
    TomLogBuilder().logBuilder(
      this,
      message,
      printOnlyCritical: _printOnlyCritical,
      category: category,
      logLevel: TomLogLevel.debug,
    );
  }

  /// Logs an info message.
  void i(final String message, {final TomLogCategory? category}) {
    TomLogBuilder().logBuilder(
      this,
      message,
      printOnlyCritical: _printOnlyCritical,
      category: category,
      logLevel: TomLogLevel.info,
    );
  }

  /// Logs a warning message.
  void w(final String message, {final TomLogCategory? category}) {
    TomLogBuilder().logBuilder(
      this,
      message,
      printOnlyCritical: _printOnlyCritical,
      category: category,
      logLevel: TomLogLevel.warning,
    );
  }

  /// Logs an error message.
  void e(final String message, {final TomLogCategory? category}) {
    TomLogBuilder().logBuilder(
      this,
      message,
      printOnlyCritical: _printOnlyCritical,
      category: category,
      logLevel: TomLogLevel.error,
    );
  }
}
