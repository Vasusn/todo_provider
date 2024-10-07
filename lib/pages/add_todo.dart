import 'package:flutter/material.dart';
import 'package:todo_provider/model/save_task.dart';
import 'package:todo_provider/model/task_modal.dart';
import 'package:provider/provider.dart';

class AddTodo extends StatelessWidget {
  const AddTodo({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Todo',
          style: TextStyle(color: Colors.white), // White title for dark mode
        ),
        backgroundColor: Colors.black, // Dark background for AppBar
      ),
      body: Container(
        color: Colors.black87, // Dark background for the body
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: textController,
                autofocus: true,
                style: const TextStyle(color: Colors.white), // White text color
                decoration: InputDecoration(
                  hintText: 'Enter task title',
                  hintStyle: TextStyle(color: Colors.grey[400]), // Light grey hint text
                  labelText: 'Task Title',
                  labelStyle: TextStyle(color: Colors.white), // White label text
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(
                      color: Colors.grey, // Grey color for the border
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  if (textController.text.isNotEmpty) {
                    context.read<SaveTask>().addTask(
                      Task(
                        title: textController.text,
                        isCompleted: false,
                      ),
                    );
                    textController.clear();
                    Navigator.of(context).pop();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // White button background
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  'Add Task',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Black text color for button
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
