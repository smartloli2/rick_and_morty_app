// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_mode_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShowModeTypeAdapter extends TypeAdapter<ShowModeType> {
  @override
  final int typeId = 101;

  @override
  ShowModeType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ShowModeType.list;
      case 1:
        return ShowModeType.grid;
      default:
        return ShowModeType.list;
    }
  }

  @override
  void write(BinaryWriter writer, ShowModeType obj) {
    switch (obj) {
      case ShowModeType.list:
        writer.writeByte(0);
        break;
      case ShowModeType.grid:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShowModeTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
