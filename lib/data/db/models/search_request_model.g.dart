// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_request_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SearchRequestModelAdapter extends TypeAdapter<SearchRequestModel> {
  @override
  final int typeId = 2;

  @override
  SearchRequestModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SearchRequestModel(
      value: fields[0] as String,
      createdAtUtc: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, SearchRequestModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.value)
      ..writeByte(1)
      ..write(obj.createdAtUtc);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchRequestModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
