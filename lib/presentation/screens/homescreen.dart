import 'package:flutter/material.dart';
import 'package:student_management/presentation/screens/displayscreen.dart';
import 'package:student_management/presentation/widgets/searchbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: const Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SearchBarScreen(),
              // Text(
              //   "Student List",
              //   style: TextStyles.heading,
              // ),
              Expanded(
                child: DetailedScreen(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
