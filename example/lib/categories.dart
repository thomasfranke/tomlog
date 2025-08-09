import 'package:tomlog/tomlog.dart';

///
class TomLogCategories {
  ///
  static const TomLogCategory db = TomLogCategory(
    'DB',
    color: TomLogColor.blue,
    printOnConsole: true,
  );

  ///
  static final TomLogCategory api = TomLogCategory(
    'API',
    color: TomLogColor.cyan,
    printOnConsole: false,
  );

  ///
  static const TomLogCategory auth = TomLogCategory(
    'Auth',
    color: TomLogColor.yellow,
  );
}
