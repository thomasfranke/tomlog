# TomLog

A customizable logger for Flutter/Dart with support for log levels, formatted timestamps, categories, limited history, and colorful console output.

## Features

- Simple singleton for global usage.
- Flexible display settings: timestamps, log levels, filenames, class names.
- Limited history (default 100 entries).
- Supports log levels: debug, info, warning, error.
- Color-coded logs in console (ANSI colors).
- Easy to use with dedicated methods for each level.
- Export logs to JSON.
- Print full formatted log history.

## Getting Started

Add the dependency in your `pubspec.yaml`:

##Usage

###Initialization

```
import 'package:tomlog/tomlog.dart';

void main() {
  TomLog.init(
    printOnlyCritical: false,
    printTimeStamp: true,
    printLogLevel: true,
    printFilename: false,
    printClassName: true,
    timeStampFormat: 'yyyy-MM-dd HH:mm:ss',
    printType: TomLogPrintType.color, // or TomLogPrintType.slim
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

```
TomLog().printHistory();
```

### Optional: Customize log level and category

This allows you to group and style logs by categories for easier filtering and reading.

You can define custom log categories like this:

```
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

## API
• `TomLog.d(String message, {TomLogCategory? category})` — debug log
• `TomLog.i(String message, {TomLogCategory? category})` — info log
• `TomLog.w(String message, {TomLogCategory? category})` — warning log
• `TomLog.e(String message, {TomLogCategory? category})` — error log
• `TomLog.printHistory()` — prints the full formatted log history

## Contributing

Pull requests are welcome! For major changes, please open an issue first to discuss what you’d like to change.

## License
MIT License © Thomas Franke