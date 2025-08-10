String getCallerFilename({int frameIndex = 3}) {
  final lines = StackTrace.current.toString().split('\n');

  if (lines.length > frameIndex) {
    final line = lines[frameIndex];
    final regex = RegExp(r'package:[^/]+/([^:]+):(\d+):(\d+)');
    final match = regex.firstMatch(line);

    if (match != null) {
      final fullPath = match.group(1)!;
      final fileName = fullPath.split('/').last;
      final lineNumber = match.group(2);
      return '$fileName:$lineNumber';
    }
  }
  return 'unknown';
}
