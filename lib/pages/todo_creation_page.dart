import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo/constants/constants.dart';
import 'package:todo/managers/todo_manager.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/pages/todo_list_page.dart';

class TodoCreationPage extends StatefulWidget {
  const TodoCreationPage({super.key});

  @override
  State<TodoCreationPage> createState() => _TodoCreationPageState();
}

class _TodoCreationPageState extends State<TodoCreationPage> {
  final key = GlobalKey<FormState>();
  final date = TextEditingController();
  final title = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoManager>(builder: (context, todoManager, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Constants.primaryColor,
          centerTitle: true,
          title: Text(
            'Créer une nouvelle tâche',
            style: GoogleFonts.poppins(
              color: Constants.textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: title,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Constants.primaryColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Constants.primaryColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: Constants.primaryColor)),
                    enabled: true,
                    label: Text(
                      "Titre",
                      style: GoogleFonts.poppins(),
                    ),
                    constraints: const BoxConstraints(maxHeight: 50),
                  ),
                ),
                const Gap(10),
                TextFormField(
                  controller: date,
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
                      style: GoogleFonts.poppins(),
                    ),
                    constraints: const BoxConstraints(maxHeight: 50),
                  ),
                ),
                const Gap(15),
                InkWell(
                  onTap: () {
                    todoManager.addTodo(
                      Todo(
                          title: title.text,
                          endDate: DateTime.parse(date.text),
                          status: false),
                    );
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const TodoListPage()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: Text(
                      "Ajouter",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Gap(10),
              ],
            ),
          ),
        ),
      );
    });
  }
}
