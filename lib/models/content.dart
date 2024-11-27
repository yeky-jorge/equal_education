import 'package:isar/isar.dart';
// import 'package:flutter_application_1/models/signature.dart';
// import 'package:flutter_application_1/models/block.dart';

part 'content.g.dart';

@collection
class Content {
  Id id = Isar.autoIncrement;

  late int signatureId; //Funciona como llave foranea de Signature Model
  late String name;
  String? description;

  // final blocks = IsarLinks<Block>(); // Relación con la colección Block
}
