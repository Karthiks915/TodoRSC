import '../models/todo.dart';

abstract class TodoRepository {
  Stream<List<Todo>> getAllTodos();
  Future<void> addTodo(Todo todo);
  Future<void> updateTodo(Todo todo);
  Future<void> deleteTodo(int id);
}