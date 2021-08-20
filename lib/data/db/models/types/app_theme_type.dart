import 'package:hive/hive.dart';

import '../../hive_constants.dart';

part 'app_theme_type.g.dart';

@HiveType(typeId: HiveTypeIds.appThemeType)
enum AppThemeType {
  @HiveField(0)
  light,
  @HiveField(1)
  dark,
  @HiveField(2)
  system,
}
