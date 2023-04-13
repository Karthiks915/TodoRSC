import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/controller/todo_page_controller.dart';
import 'package:todo_app/repositories/isar_todo_repository.dart';

part 'general_providers.g.dart';

@riverpod
Stream<List> todos(TodosRef ref) async* {
  yield* IsarTodoRepository().getAllTodos();
}

@riverpod
TodoController todoController(TodoControllerRef ref) {
  return TodoController(IsarTodoRepository());
}


