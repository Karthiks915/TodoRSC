import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/controller/todo_page_controller.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/providers/general_providers.dart';

class AddTodoPage extends HookConsumerWidget {
  const AddTodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String? dropdownValue = 'purple';
    TodoController todoController = ref.watch(todoControllerProvider);
    TextEditingController titleController = TextEditingController();
    TextEditingController categoryController = TextEditingController();
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.white,
        onPressed: () {
          todoController.addTodo(
            Todo(title: titleController.text, color: dropdownValue!),
          );
          titleController.clear();

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
                DropdownButton<String>(
                    alignment: Alignment.centerLeft,
                    value: dropdownValue,
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.grey[700]),
                    underline: Container(
                      height: 4,
                      color: Colors.white,
                    ),
                    onChanged: (String? newValue) {
                      dropdownValue = newValue;   
                    },
                    items: <String>['purple', 'red', 'green', 'yellow', 'blue']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList()),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
