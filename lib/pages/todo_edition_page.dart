import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo/constants/constants.dart';
import 'package:todo/managers/todo_manager.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/pages/todo_list_page.dart';

class TodoEditionPage extends StatelessWidget {
  const TodoEditionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoManager>(builder: (context, todoManager, child) {
      Todo todo = todoManager.currentTodo!;
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Constants.primaryColor,
          centerTitle: true,
          title: Text(
            'Modifier une tâche',
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
            children: [
              Text(
                todo.title,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Constants.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(10),
              TextFormField(
                initialValue: todo.title,
                onChanged: (value) => todoManager.setTitle(value),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Constants.primaryColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Constants.primaryColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Constants.primaryColor)),
                  enabled: true,
                  label: Text(
                    "Titre",
                    style: GoogleFonts.poppins(color: Constants.primaryColor),
                  ),
                  constraints: const BoxConstraints(maxHeight: 50),
                ),
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 7,
                    child: TextFormField(
                      onChanged: (value) => todoManager.setDate(value),
                      initialValue: todo.endDate.toString().substring(0, 11),
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Constants.primaryColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Constants.primaryColor),
                        ),
                        enabled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        label: Text(
                          "Date",
                          style: GoogleFonts.poppins(
                              color: Constants.primaryColor),
                        ),
                        constraints: const BoxConstraints(maxHeight: 50),
                      ),
                    ),
                  ),
                  const Expanded(flex: 1, child: Gap(5)),
                  Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Status :",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Constants.primaryColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Checkbox(
                          value: todo.status,
                          onChanged: (value) {
                            todoManager.updateStatus(value!);
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const Gap(15),
              InkWell(
                onTap: () {
                  todoManager.updateTodo(todo);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const TodoListPage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(10)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Text(
                    "Modifier",
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const Gap(10),
            ],
          ),
        ),
      );
    });
  }
}
