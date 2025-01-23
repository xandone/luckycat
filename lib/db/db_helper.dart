import 'objectbox.dart';

/// @author: xiao
/// created on: 2025/1/23 14:01
/// description:

class DbHelper {
  static DbHelper? _dbHelper;
  ObjectBox? objectBox;

  static DbHelper get instance {
    _dbHelper ??= DbHelper();
    return _dbHelper!;
  }
}
