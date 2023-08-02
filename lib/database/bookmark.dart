import 'package:hive/hive.dart';
part 'bookmark.g.dart';

@HiveType(typeId: 1)
class Bookmark extends HiveObject {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late String prefix;

  @HiveField(2)
  late String suffix;

  @HiveField(3)
  late String word;

  @HiveField(4)
  late String fontName;

  Bookmark(
      {required this.name,
      required this.prefix,
      required this.suffix,
      required this.word,
      required this.fontName});
}
