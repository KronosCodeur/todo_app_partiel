import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/constants/constants.dart';
import 'package:todo/models/todo.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({super.key, required this.todo});
  final Todo todo;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
              Text(
                todo.endDate.toString().substring(0, 11),
                style: GoogleFonts.poppins(
                    color: Constants.textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 12),
              )
            ],
          ),
          Checkbox(
            value: todo.status,
            onChanged: (value) => todo.status = true,
            checkColor: Constants.primaryColor,
            fillColor: const MaterialStatePropertyAll(Constants.background),
          )
        ],
      ),
    );
  }
}
