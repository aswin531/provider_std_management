import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management/models/studentmodel.dart';
import 'package:student_management/presentation/controllers/providercontroller.dart';
import 'package:student_management/presentation/screens/studentdetailscreen.dart';
import 'package:student_management/utils/colors.dart';

class DetailedScreen extends StatelessWidget {
  const DetailedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Management'),
      ),
      body: Consumer<StudentProvider>(
        builder: (context, studentProvider, _) {
          return ListView.builder(
            itemCount: studentProvider.students.length,
            itemBuilder: (context, index) {
              final student = studentProvider.students[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/profile.png"),
                      ),
                      title: Text(
                        student.name,
                        style: TextStyle(color: white),
                      ),
                      subtitle: Text(
                        student.age.toString(),
                        style: TextStyle(color: white),
                      ),
                      onTap: () {
                        _navigateToStudentDetails(context, student);
                      },
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          _showConfirmationDialog(context, index);
                        },
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _navigateToStudentDetails(BuildContext context, Student student) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => StudentDetailsScreen(student: student),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirm Deletion'),
          content: const Text('Are you sure you want to delete this student?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Provider.of<StudentProvider>(context, listen: false)
                    .deleteStudent(index);
                Navigator.of(context).pop();
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
