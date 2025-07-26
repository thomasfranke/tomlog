String getCallerInfo() {
  final lines = StackTrace.current.toString().split('\n');
  if (lines.length > 3) {
    final line = lines[3];
    final regex = RegExp(r'package:[^/]+/([^:]+):(\d+):(\d+)');
    final match = regex.firstMatch(line);
    if (match != null) {
      return '${match.group(1)}:${match.group(2)}';
    }
  }
  return 'unknown';
}
