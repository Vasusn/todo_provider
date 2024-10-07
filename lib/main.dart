import 'package:flutter/material.dart';
import 'package:todo_provider/model/save_task.dart';
import 'package:todo_provider/pages/add_todo.dart';
import 'package:todo_provider/pages/todo_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( ChangeNotifierProvider(
    create: (context) => SaveTask(),
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo Provider',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
         brightness: Brightness.dark,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const TodoList(),
        '/add-todo-screen': (_) => const AddTodo(),
      },
    );
  }
}
