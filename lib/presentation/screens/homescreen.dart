import 'package:flutter/material.dart';
import 'package:student_management/presentation/screens/addstudent.dart';
import 'package:student_management/presentation/widgets/searchbar.dart';
import 'package:student_management/utils/styles.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const SearchBarScreen(),
          Text(
            "Student List",
            style: TextStyles.heading,
          ),
          AddStudentScreen()
          
        ],
      )),
    );
  }
}
