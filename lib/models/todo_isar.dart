import 'package:isar/isar.dart';

part 'todo_isar.g.dart';

@Collection()
class TodoIsar {
  Id? id;

  @Index()
  String? color;

  @Index()
  String? title;

  bool? isCompleted;

  TodoIsar({
    required this.title,
    required this.color,
    this.isCompleted,
  });
}



// @Collection(){
//   class Todo{
//     @Id()
//     int? id;

//     String title;
//     String color;
//     bool isCompleted;

//     Todo({
//       this.id,
//       required this.title,
//       required this.color,
//       this.isCompleted = false,
//     })
//   }
// }