import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo/constants/constants.dart';
import 'package:todo/managers/todo_manager.dart';
import 'package:todo/pages/todo_creation_page.dart';
import 'package:todo/widgets/todo_item_widget.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoManager>(builder: (context, todoManager, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Constants.primaryColor,
          centerTitle: true,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back_rounded,
              size: 25,
              color: Colors.white,
            ),
          ),
          title: Text(
            'List des tâches',
            style: GoogleFonts.poppins(
              color: Constants.textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: todoManager.todos.length,
          itemBuilder: (context, index) =>
              TodoItem(todo: todoManager.todos[index]),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal,
          child: const Icon(
            Icons.add_rounded,
            color: Constants.textColor,
            size: 40,
          ),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const TodoCreationPage(),
            ),
          ),
        ),
      );
    });
  }
}
