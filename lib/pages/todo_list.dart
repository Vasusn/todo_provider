import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/model/save_task.dart';
import 'package:todo_provider/model/task_modal.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todo List',
          style: TextStyle(color: Colors.white), // White title for dark mode
        ),
        backgroundColor: Colors.black, // Dark background for AppBar
        iconTheme: const IconThemeData(color: Colors.white), // White icon color
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed('/add-todo-screen'),
        backgroundColor: Colors.white, // White button background
        child: const Icon(Icons.add, color: Colors.black), // Black '+' icon
      ),
      body: Consumer<SaveTask>(builder: (context, value, child) {
        return Container(
          color: Colors.black87, // Dark background for the screen
          child: ListView.builder(
            itemCount: value.tasks.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.grey[850], // Dark grey background for each list item
                margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: ListTile(
                  title: Text(
                    value.tasks[index].title,
                    style: TextStyle(
                      color: Colors.white, // White text color
                      fontWeight: FontWeight.w500,
                      decoration: value.tasks[index].isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  trailing: Wrap(
                    spacing: 6, // Space between buttons
                    children: [
                      Checkbox(
                        value: value.tasks[index].isCompleted,
                        onChanged: (_) {
                          context.read<SaveTask>().checkIndex(index);
                        },
                        activeColor: Colors.green, // Green checkbox color
                        checkColor: Colors.black, // Black check color
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<SaveTask>().removeTask(index);
                        },
                        icon: const Icon(Icons.delete),
                        color: Colors.white, // White delete icon
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                final updateController = TextEditingController();
                                return AlertDialog(
                                  title: const Text(
                                    'Update Task',
                                    style: TextStyle(color: Colors.white), // Black text color for dialog title
                                  ),
                                  backgroundColor: Colors.grey[800], // Dark grey dialog background
                                  content: TextField(
                                    controller: updateController,
                                    decoration: InputDecoration(
                                      hintText: value.tasks[index].title,
                                      hintStyle: TextStyle(color: Colors.grey[400]), // Light grey hint text
                                      enabledBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white),
                                      ),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white),
                                      ),
                                    ),
                                    style: const TextStyle(color: Colors.white), // Black text for input
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        context.read<SaveTask>().updateTask(
                                            index,
                                            Task(
                                                title: updateController.text,
                                                isCompleted: false));
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Update', style: TextStyle(color: Colors.white)),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Cancel', style: TextStyle(color: Colors.white)),
                                    ),
                                  ],
                                );
                              });
                        },
                        icon: const Icon(Icons.edit),
                        color: Colors.white, // White edit icon
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
