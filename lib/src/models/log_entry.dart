import 'package:intl/intl.dart';

///
class TomLogEntry {
  ///
  TomLogEntry({
    this.category,
    required this.message,
    required this.dateTime,
    required this.level,
    required this.stackTrace,
  });

  ///
  final String? category;

  ///
  final String message;

  ///
  final DateTime dateTime;

  ///
  final String level;

  ///
  final String? stackTrace;

  ///
  @override
  String toString() {
    final cat = category != null ? '[$category]' : '';
    final formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
    return '[$level]$cat[$formattedDate] $message';
  }

  ///
  Map<String, dynamic> toJson() => <String, dynamic>{
    'category': category,
    'message': message,
    'dateTime': dateTime.toIso8601String(),
    'level': level,
    'stackTrace': stackTrace,
  };
}
