import 'package:isar/isar.dart';
// import 'package:flutter_application_1/models/content.dart';

part 'block.g.dart';

@collection
class Block {
  Id id = Isar.autoIncrement;

  late int contentId; // Relación con la colección Content
  late String blockType;
  late String blockContent;
}
