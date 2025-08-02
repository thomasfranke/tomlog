import 'package:tomlog/src/models.dart/log_color.dart';

///
class TomLogCategory {
  /// Creates a new instance of [TomLogCategory].
  const TomLogCategory(
    this.name, {
    this.color = TomLogColor.brightWhite,
    this.printOnConsole = true,
  });

  /// The name of the category.
  final String name;

  /// The color associated with the category.
  final TomLogColor color;

  ///
  final bool printOnConsole;
}
