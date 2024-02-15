import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/managers/todo_manager.dart';
import 'package:todo/pages/todo_list_page.dart';

void main() => runApp(
      MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => TodoManager())],
        child: const Todo(),
      ),
    );

class Todo extends StatelessWidget {
  const Todo({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      home: TodoListPage(),
    );
  }
}
