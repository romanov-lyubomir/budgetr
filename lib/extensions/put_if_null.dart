import 'package:hive/hive.dart' as hive;

extension AppDataBoxExtension on hive.Box {
  void putOneIfNull(dynamic key, dynamic value) {
    if (get(key) == null) {
      put(key, value);
    }
  }

  void putManyIfNull(Map<dynamic, dynamic> map) {
    map.forEach((key, value) {
      if (get(key) == null) {
        put(key, value);
      }
    });
  }
}
