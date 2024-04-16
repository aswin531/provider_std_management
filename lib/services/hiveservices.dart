import 'package:hive/hive.dart';
import 'package:student_management/models/studentmodel.dart';

class BoxServices {
  Future<void> addStudent(Student student) async {
    final box = await Hive.openBox<Student>('students');
    await box.add(student);
  }

  Future<List<Student>> getStudent() async {
    final box = await Hive.openBox<Student>('students');
    return box.values.toList();
  }

  Future<void> updateStudent(int index, Student student) async {
    final box = await Hive.openBox<Student>('students');
    await box.putAt(index, student);
  }

  Future<void> deleteStudent(int index) async {
    final box = await Hive.openBox<Student>('students');
    await box.deleteAt(index);
  }
}
