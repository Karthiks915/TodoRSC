import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/presentation/pages/todo_page.dart';
import 'package:todo_app/providers/general_providers.dart';
import 'package:todo_app/repositories/isar_todo_repository.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TodoPage(),
    );
  }
}

class MyHomePage extends HookConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todosProvider);
    TextEditingController titleController = TextEditingController();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextField(
                  controller: titleController,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextButton(
                onPressed: () async {
                  IsarTodoRepository().addTodo(Todo(
                      title: titleController.text,
                      color: titleController.text));
                  titleController.clear();
                },
                child: const Text('Add'),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          )),
          Expanded(
            child: todos.when(
                data: (todos) {
                  
                  return ListView(
                    children: [
                      for (final todo in todos)
                        ListTile(
                          leading: Text(todo.title),
                        ),
                    ],
                  );
                },
                error: (error, stack) => Text(error.toString()),
                loading: () => CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}
