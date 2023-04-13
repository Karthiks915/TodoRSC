import 'dart:async';
import 'package:isar/isar.dart';
import 'package:todo_app/models/todo_isar.dart';
import '../models/todo.dart';
import 'todo_repository.dart';

class IsarTodoRepository implements TodoRepository {
  late Future<Isar> db;

  IsarTodoRepository() {
    db = openDb();
  }

  @override
  Stream<List<Todo>> getAllTodos() async* {
    final _isar = await db;
    yield* _isar.todoIsars
        .where()
        .watch(fireImmediately: true)
        .map((todos) => todos
            .map((todoIsar) => Todo(
                  id: todoIsar.id!,
                  color: todoIsar.color!,
                  title: todoIsar.title!,
                  isCompleted: todoIsar.isCompleted!,
                ))
            .toList());
  }

  @override
  Future<void> addTodo(Todo todo) async {
    final _isar = await db;
    final todoIsar = TodoIsar(
      color: todo.color,
      title: todo.title,
      isCompleted: todo.isCompleted,
    ); // convert todo_model.dart to TodoIsar
    _isar.writeTxn<int>(
        () => _isar.todoIsars.put(todoIsar)); // pass TodoIsar to Isar
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    final _isar = await db;
    final todoIsar = await _isar.todoIsars.get(todo.id!);
    if (todoIsar != null) {
      todoIsar.isCompleted = !todo.isCompleted;
      _isar.writeTxn<int>(() => _isar.todoIsars.put(todoIsar));
    }
  }

  @override
  Future<void> deleteTodo(int id) async {
    final isar = await db;
    isar.writeTxn(() async {
      await isar.todoIsars.delete(id);
    });
  }

  Future<Isar> openDb() async {
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [TodoIsarSchema],
        inspector: true,
      );
    }

    return Future.value(Isar.getInstance());
  }
}
