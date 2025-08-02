import 'package:tomlog/tomlog.dart';

///
class TomLogEntry {
  ///
  TomLogEntry({
    this.category,
    required this.message,
    required this.dateTime,
    required this.type,
    required this.stackTrace,
    required this.logLevel,
  });

  ///
  final String? category;

  ///
  final String message;

  ///
  final DateTime dateTime;

  ///
  final TomLogLevel logLevel;

  ///
  final String type;

  ///
  final String? stackTrace;

  /// toString:
  @override
  String toString() => '[$category] $message - $dateTime - $type\n';

  /// toJson:
  Map<String, dynamic> toJson() => <String, dynamic>{
    'category': category,
    'message': message,
    'dateTime': dateTime.toIso8601String(),
    'type': type,
    'stackTrace': stackTrace,
  };
}
