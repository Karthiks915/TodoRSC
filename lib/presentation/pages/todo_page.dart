import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/presentation/pages/add_todo_page.dart';
import 'package:todo_app/providers/general_providers.dart';

class TodoPage extends HookConsumerWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todosProvider);
    final todosController = ref.watch(todoControllerProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  AddTodoPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0.0, 1.0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              },
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      backgroundColor: Color(0xfff2f2f2),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome, Karthik S',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Today\'s Tasks',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xff6b6b6b)),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: todos.when(
                    data: (todos) {
                      return ListView(
                        children: [
                          for (final todo in todos)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Dismissible(
                                onDismissed: (direction) =>
                                    todosController.deleteTodo(todo.id),
                                key: ValueKey(todo.id),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: CheckboxListTile(
                                    value: todo.isCompleted,
                                    onChanged: (bool? value) {
                                      todosController.updateTodo(todo);
                                    },
                                    title: Text(todo.title),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                    error: (error, stack) => Text(error.toString()),
                    loading: () => CircularProgressIndicator()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
