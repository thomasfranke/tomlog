/// This file defines the colors used in the TomLog system, providing
/// ANSI escape codes for terminal color formatting.
enum TomLogColor {
  /// Standard colors
  /// These colors are used for basic text formatting in the terminal.

  /// Black
  black,

  /// Red
  red,

  /// Green
  green,

  /// Yellow
  yellow,

  /// Blue
  blue,

  /// Magenta
  magenta,

  /// Cyan
  cyan,

  /// White
  white,

  /// Bright colors
  brightBlack,

  /// Bright Red
  brightRed,

  /// Bright Green
  brightGreen,

  /// Bright Yellow
  brightYellow,

  /// Bright Blue
  brightBlue,

  /// Bright Magenta
  brightMagenta,

  /// Bright Cyan
  brightCyan,

  /// Bright White
  brightWhite,
}

/// Extension to provide ANSI escape codes for TomLogColor.
extension TomLogColorExtension on TomLogColor {
  /// Returns the ANSI escape code for the color.
  String get ansi {
    switch (this) {
      case TomLogColor.black:
        return '\x1B[30m';
      case TomLogColor.red:
        return '\x1B[31m';
      case TomLogColor.green:
        return '\x1B[32m';
      case TomLogColor.yellow:
        return '\x1B[33m';
      case TomLogColor.blue:
        return '\x1B[34m';
      case TomLogColor.magenta:
        return '\x1B[35m';
      case TomLogColor.cyan:
        return '\x1B[36m';
      case TomLogColor.white:
        return '\x1B[37m';
      case TomLogColor.brightBlack:
        return '\x1B[90m';
      case TomLogColor.brightRed:
        return '\x1B[91m';
      case TomLogColor.brightGreen:
        return '\x1B[92m';
      case TomLogColor.brightYellow:
        return '\x1B[93m';
      case TomLogColor.brightBlue:
        return '\x1B[94m';
      case TomLogColor.brightMagenta:
        return '\x1B[95m';
      case TomLogColor.brightCyan:
        return '\x1B[96m';
      case TomLogColor.brightWhite:
        return '\x1B[97m';
    }
  }
}
