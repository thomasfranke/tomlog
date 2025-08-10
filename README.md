# TomLog

A simple yet powerful logging system that makes it easy to categorize logs, automatically captures file and class information, maintains a log history, and integrates seamlessly with monitoring systems.

## Features

- Simple singleton for global usage.
- Flexible display settings: timestamps, log levels, filenames, class names.
- Limited history (default 20 entries).
- Supports log levels: debug, info, warning, error.
- Color-coded logs in console (ANSI colors).
- Dedicated methods for each log level.
- Export logs to JSON and String.
- Print full formatted log history.

## Getting Started

Add the dependency in your `pubspec.yaml`:

##Usage

###Initialization

```dart
import 'package:tomlog/tomlog.dart';

void main() {
  TomLog.init(
    printOnlyCritical: false,
    printTimeStamp: true,
    printLogLevel: true,
    printFilename: false,
    printClassName: true,
    timeStampFormat: 'yyyy-MM-dd HH:mm:ss',
    printType: TomLogPrintType.slim,
  );
}
```

### Logging messages

```
TomLog().d('Debug message');
TomLog().i('Important info');
TomLog().w('Warning!');
TomLog().e('Critical error');
```

### Printing the log history

```dart
TomLog().printHistory();
```

### Optional: Customize log level and category

This allows you to group and style logs by categories for easier filtering and reading.

You can define custom log categories like this:

```dart
class TomLogCategories {
  ///
  static const TomLogCategory db = TomLogCategory(
    'DB',
    color: TomLogColor.blue,
    printOnConsole: true,
  );

  ///
  static const TomLogCategory api = TomLogCategory(
    'API',
    color: TomLogColor.cyan,
    printOnConsole: false,
  );
}
```

Then use it when logging:

```
TomLog().w('Network warning message', category: TomLogCategories.network);
```

## Adding Handlers (e.g., Sentry)

You can add one or more log handlers on initialization to integrate with Sentry or any other monitoring system.

```dart
TomLog.init(
  logHandlers: [
    (entry) async {
      await Sentry.captureException(
        Exception(entry.message),
        stackTrace: StackTrace.fromString(entry.stackTrace ?? ''),
        hint: 'Category: ${entry.category ?? 'None'}',
        withScope: (scope) {
          scope.setTag('category', entry.category ?? 'none');
          scope.setExtra('logLevel', entry.level);
          scope.setExtra('history', TomLog().getHistoryString());
        },
      );
    },
  ],
);
```

## API
• `TomLog.d(String message, {TomLogCategory? category})`: debug log
• `TomLog.i(String message, {TomLogCategory? category})`: info log
• `TomLog.w(String message, {TomLogCategory? category})`: warning log
• `TomLog.e(String message, {TomLogCategory? category})`: error log
• `TomLog.getHistoryString()`: returns the full formatted log history as a string
• `TomLog.printHistory()`: prints the full formatted log history

## Contributing

Pull requests are welcome! For major changes, please open an issue first to discuss what you’d like to change.

## License
MIT License © Thomas Franke