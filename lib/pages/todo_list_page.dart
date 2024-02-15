import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/constants/constants.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/widgets/todo_item_widget.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.background,
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        centerTitle: true,
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
        itemCount: 5,
        itemBuilder: (context, index) => TodoItem(
          todo: Todo(title: 'title', endDate: DateTime.now(), status: false),
        ),
      ),
    );
  }
}
