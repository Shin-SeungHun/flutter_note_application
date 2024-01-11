// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NoteItemAdapter extends TypeAdapter<NoteItem> {
  @override
  final int typeId = 0;

  @override
  NoteItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NoteItem(
      title: fields[1] as String,
      content: fields[2] as String,
      color: fields[3] as int,
      timeStamp: fields[4] as int,
    )..id = fields[0] as int?;
  }

  @override
  void write(BinaryWriter writer, NoteItem obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.content)
      ..writeByte(3)
      ..write(obj.color)
      ..writeByte(4)
      ..write(obj.timeStamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoteItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
