import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/constants/constants.dart';

class TodoCreationPage extends StatelessWidget {
  const TodoCreationPage({super.key});

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
