import 'package:flutter/material.dart';
import 'package:student_management/models/studentmodel.dart';
import 'package:student_management/utils/styles.dart';

class StudentDetailsScreen extends StatelessWidget {
  final Student student;

  const StudentDetailsScreen({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Student Details',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Name: ${student.name}',
                style: TextStyles.heading,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Age: ${student.age}',
                style: TextStyles.subheading,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Phone: ${student.phone}',
                style: TextStyles.subheading,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Address: ${student.address}',
                style: TextStyles.subheading,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
