import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

part 'todo_list.g.dart';

@Collection()
class Todo {
  Id id = Isar.autoIncrement;
  late String title;
  late DateTime time;
  late bool isCompleted;
}