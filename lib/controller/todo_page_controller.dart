import 'package:todo_app/models/todo.dart';
import 'package:todo_app/repositories/isar_todo_repository.dart';

class TodoController {
  final IsarTodoRepository _isarRepository;

  TodoController(this._isarRepository);

  Stream<List<Todo>> getAllTodos() async* {
    yield* _isarRepository.getAllTodos();
  }

  Future<void> addTodo(Todo todo) async {
    await _isarRepository.addTodo(todo);
  }

  Future<void> updateTodo(Todo todo) async {
    await _isarRepository.updateTodo(todo);
  }

  Future<void> deleteTodo(int id) async {
    await _isarRepository.deleteTodo(id);
  }
}
