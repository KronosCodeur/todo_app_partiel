import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo/constants/constants.dart';
import 'package:todo/managers/todo_manager.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/pages/todo_edition_page.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({super.key, required this.todo});
  final Todo todo;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Consumer<TodoManager>(builder: (context, todoManager, child) {
      return Container(
        width: size.width,
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Constants.primaryColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => todoManager.setCurrentTodo(todo),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    todo.title,
                    style: GoogleFonts.poppins(
                        color: Constants.textColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                  ),
                  const Gap(10),
                  Text(
                    todo.endDate.toString().substring(0, 11),
                    style: GoogleFonts.poppins(
                        color: Constants.textColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 12),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TodoEditionPage(todo: todo),
                    ),
                  ),
                  child: Icon(
                    Icons.edit_rounded,
                    size: 30,
                    color: Colors.amberAccent,
                  ),
                ),
                Checkbox(
                  value: todo.status,
                  onChanged: (value) => (),
                  checkColor: Constants.primaryColor,
                  fillColor:
                      const MaterialStatePropertyAll(Constants.background),
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}
