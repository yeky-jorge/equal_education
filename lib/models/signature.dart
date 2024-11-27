import 'package:isar/isar.dart';
//import 'package:flutter_application_1/models/course.dart';
// import 'package:flutter_application_1/models/content.dart';

part 'signature.g.dart';

@collection
class Signature {
  Id id = Isar.autoIncrement;
  // Relación con la colección Course
  //final course = IsarLink<Course>(); 
  late int courseId;
  late String name;
  late DateTime date;

  Signature({
    required this.courseId,
    required this.name,
    required this.date,
  });
  //final contents = IsarLinks<Content>(); // Relación con la colección Content
}

