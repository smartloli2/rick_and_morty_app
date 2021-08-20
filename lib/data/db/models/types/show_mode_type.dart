import 'package:hive/hive.dart';

import '../../hive_constants.dart';

part 'show_mode_type.g.dart';

@HiveType(typeId: HiveTypeIds.showModeType)
enum ShowModeType {
  @HiveField(0)
  list,
  @HiveField(1)
  grid,
}
