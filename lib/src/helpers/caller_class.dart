String getCallerClass() {
  final List<String> stackTraceLines = StackTrace.current.toString().split(
    '\n',
  );
  if (stackTraceLines.length > 2) {
    final String traceLine = stackTraceLines[3];
    final RegExp regex = RegExp(r'#\d+\s+(.+) \(');
    final RegExpMatch? match = regex.firstMatch(traceLine);
    if (match != null) {
      return match.group(1) ?? '';
    }
  }
  return '';
}
