import 'package:hive/hive.dart';
part 'bookmark.g.dart';

@HiveType(typeId: 1)
class Bookmark extends HiveObject {
  @HiveField(0)
  late String name;

  Bookmark({required this.name});
}
