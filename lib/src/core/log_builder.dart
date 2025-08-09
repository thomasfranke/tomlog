import 'dart:developer';

import 'package:intl/intl.dart';
import 'package:tomlog/src/helpers/caller_class.dart';
import 'package:tomlog/tomlog.dart';

class TomLogBuilder {
  /// Loga uma mensagem com nível e rastreia o chamador
  void logBuilder(
    TomLog logger,
    String message, {
    required TomLogLevel logLevel,
    TomLogCategory? category,
  }) {
    if (logger.printOnlyCritical && logLevel != TomLogLevel.error) return;

    final StringBuffer buffer = StringBuffer();

    final String timeStamp = DateFormat(
      logger.timeStampFormat,
    ).format(DateTime.now());

    if (logger.printTimeStamp) buffer.write("[$timeStamp]");

    final level = logLevel.name.toUpperCase();
    if (logger.printLogLevel) buffer.write("[$level]");

    if (category != null) buffer.write("[${category.name}]");

    final file = getCallerFilename();
    if (logger.printFilename) buffer.write("[$file]");

    final className = getCallerClass();
    if (logger.printClassName) buffer.write("[$className]");

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

    // log(buffer.toString());
    log("$colorCode${buffer.toString()}");
  }
}
