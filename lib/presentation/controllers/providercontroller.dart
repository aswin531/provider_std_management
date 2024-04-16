import 'package:flutter/material.dart';
import 'package:student_management/models/studentmodel.dart';
import 'package:student_management/services/hiveservices.dart';

class StudentProvider extends ChangeNotifier {
  final BoxServices _boxServices = BoxServices();
  List<Student> _students = [];

  List<Student> get students => _students;

  Future<void> fetchStudents() async {
    _students = await _boxServices.getStudent();
    notifyListeners();
  }

  Future<void> addStudent(Student student) async {
    await _boxServices.addStudent(student);
    await fetchStudents();
  }

  Future<void> updateStudent(int index, Student student) async {
    await _boxServices.updateStudent(index, student);
    await fetchStudents();
  }

  Future<void> deleteStudent(int index) async {
    await _boxServices.deleteStudent(index);
    await fetchStudents();
  }
}
