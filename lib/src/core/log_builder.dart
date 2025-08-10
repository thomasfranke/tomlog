import 'dart:developer';

import 'package:intl/intl.dart';
import 'package:tomlog/src/helpers/caller_class.dart';
import 'package:tomlog/src/models/log_display_type.dart';
import 'package:tomlog/tomlog.dart';

class TomLogBuilder {
  /// Loga uma mensagem com nível e rastreia o chamador
  TomLogEntry logBuilder(
    TomLog logger,
    String message, {
    required bool printOnlyCritical,
    required bool printTimeStamp,
    required bool printLogLevel,
    required bool printFilename,
    required bool printClassName,
    required String timeStampFormat,
    required TomLogPrintType printType,
    required TomLogLevel logLevel,
    TomLogCategory? category,
  }) {
    final StringBuffer buffer = StringBuffer();

    final String timeStamp = DateFormat(timeStampFormat).format(DateTime.now());

    if (printTimeStamp) buffer.write("[$timeStamp]");

    final level = logLevel.name.toUpperCase();
    if (printLogLevel) buffer.write("[$level]");

    if (category != null) buffer.write("[${category.name}]");

    final file = getCallerFilename();
    if (printFilename) buffer.write("[$file]");

    final className = getCallerClass();
    if (printClassName) buffer.write("[$className]");

    buffer.write(" $message");

    final String? stackTrace = (logLevel == TomLogLevel.error)
        ? StackTrace.current.toString()
        : null;

    TomLogEntry entry = TomLogEntry(
      message: message,
      dateTime: DateTime.now(),
      level: level,
      stackTrace: stackTrace,
    );

    logger.history.add(entry);

    if (logger.history.length > 20) {
      logger.history.removeAt(0);
    }

    String colorCode = category?.color.ansi ?? "";

    if (printOnlyCritical && logLevel != TomLogLevel.error) return entry;

    log("$colorCode${buffer.toString()}");

    return entry;
  }
}
