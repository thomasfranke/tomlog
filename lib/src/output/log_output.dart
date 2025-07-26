import 'package:flutter/foundation.dart';

abstract class LogOutput {
  void write(String message);
}

/// Saída padrão via debugPrint
class DefaultLogOutput implements LogOutput {
  @override
  void write(String message) {
    debugPrint(message);
  }
}
