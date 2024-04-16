import 'package:hive/hive.dart';
part 'studentmodel.g.dart';

@HiveType(typeId: 0)
class Student {
  @HiveField(0)
  late String name;
  @HiveField(1)
  late String age;
  @HiveField(2)
  late String phone;
  @HiveField(3)
  late String address;
  @HiveField(4)
  late String? imagePath;

  Student(
      {required this.name,
      required this.age,
      required this.phone,
      required this.address,
       this.imagePath});
}
