// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DiaryModelAdapter extends TypeAdapter<DiaryModel> {
  @override
  final int typeId = 200;

  @override
  DiaryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DiaryModel(
      idx: fields[0] as int?,
      dateTime: fields[1] as DateTime?,
      cottonType: fields[2] as String?,
      imgUrl: fields[3] as String?,
      contents: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DiaryModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.idx)
      ..writeByte(1)
      ..write(obj.dateTime)
      ..writeByte(2)
      ..write(obj.cottonType)
      ..writeByte(3)
      ..write(obj.imgUrl)
      ..writeByte(4)
      ..write(obj.contents);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DiaryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
