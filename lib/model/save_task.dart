import 'package:flutter/material.dart';
import 'package:todo_provider/model/task_modal.dart';

class SaveTask extends ChangeNotifier {
  List<Task> _tasks = [
    Task(title: "learn flutter", isCompleted: false),
    Task(title: "learn dart", isCompleted: false),
  ];

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    tasks.add(task);
    notifyListeners();
  }

  void checkIndex(int index) {
    tasks[index].isDone();
    notifyListeners();
  }

  void removeTask(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }

  void updateTask(int index, Task task) {
    tasks[index] = task;
    notifyListeners();
  }
}
