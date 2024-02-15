import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo/constants/constants.dart';
import 'package:todo/managers/todo_manager.dart';
import 'package:todo/models/todo.dart';

class TodoInfoPage extends StatelessWidget {
  const TodoInfoPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoManager>(builder: (context, todoManager, child) {
      Todo todo = todoManager.currentTodo!;
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Constants.primaryColor,
          centerTitle: true,
          title: Text(
            todo.title,
            style: GoogleFonts.poppins(
              color: Constants.textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          ),
        ),
      );
    });
  }
}
