// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookmarkAdapter extends TypeAdapter<Bookmark> {
  @override
  final int typeId = 1;

  @override
  Bookmark read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Bookmark(
      name: fields[0] as String,
      prefix: fields[1] as String,
      suffix: fields[2] as String,
      word: fields[3] as String,
      fontName: fields[4] as String,
      isAIGenerated: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Bookmark obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.prefix)
      ..writeByte(2)
      ..write(obj.suffix)
      ..writeByte(3)
      ..write(obj.word)
      ..writeByte(4)
      ..write(obj.fontName)
      ..writeByte(5)
      ..write(obj.isAIGenerated);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookmarkAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
