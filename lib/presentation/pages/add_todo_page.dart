import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/controller/todo_page_controller.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/providers/general_providers.dart';

class AddTodoPage extends HookConsumerWidget {
  const AddTodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String dropdownValue = 'purple';
    final player = AudioPlayer();
    TodoController todoController = ref.watch(todoControllerProvider);
    TextEditingController titleController = TextEditingController();
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.white,
        onPressed: () {
          String? text = titleController.text;

          if (text.isNotEmpty) {
            todoController.addTodo(
              Todo(title: titleController.text, color: dropdownValue),
            );
            titleController.clear();
          }

          Navigator.pop(context);
        },
        label: Text('New Task'),
        icon: Icon(Icons.upcoming),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              right: 10,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.close,
                  size: 40,
                  weight: 100,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Task',
                        hintStyle: TextStyle(fontSize: 24.0)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        if (ref.watch(countProvider) == 0) {
                          player.play(AssetSource('LucyAI1.mp3'));
                          ref.watch(countProvider.notifier).state = 1;
                        } else {
                          print('Hello');
                        }
                      },
                      child: Text('Lucy'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
