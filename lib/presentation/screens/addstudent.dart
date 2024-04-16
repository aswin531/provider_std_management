import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management/models/studentmodel.dart';
import 'package:student_management/presentation/controllers/providercontroller.dart';
import 'package:student_management/presentation/widgets/savebutton.dart';
import 'package:student_management/presentation/widgets/textformfield.dart';
import 'package:student_management/utils/colors.dart';
import 'package:student_management/utils/styles.dart';

class AddStudentScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AddStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: white,
          title: Text(
            "Add Student ",
            style: TextStyles.heading,
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      width: double.infinity,
                      height: 300,
                    ),
                    // GestureDetector(
                    //   onTap: () => _getImage(context),
                    //   child: Consumer<ImageProvider>(
                    //     builder: (context, value, _) => Container(
                    //       color: Colors.grey,
                    //       height: 100,
                    //       width: 100,
                    //       child: imageProvider.imagePath != null
                    //           ? Image.file(
                    //               File(imageProvider.imagePath!),
                    //               fit: BoxFit.cover,
                    //             )
                    //           : const Icon(
                    //               Icons.add_a_photo_outlined,
                    //               size: 50,
                    //             ),
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: CustomTextFormField(
                        labelText: 'Name',
                        keyboardType: TextInputType.name,
                        prefixIcon: Icons.person_pin_circle_rounded,
                        controller: _nameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter your name';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: CustomTextFormField(
                        keyboardType: TextInputType.number,
                        labelText: 'Age',
                        prefixIcon: Icons.format_list_numbered_outlined,
                        controller: _ageController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Age';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: CustomTextFormField(
                        keyboardType: TextInputType.phone,
                        labelText: 'Phone',
                        prefixIcon: Icons.phone,
                        controller: _phoneController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter your Phone number';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: CustomTextFormField(
                        keyboardType: TextInputType.text,
                        labelText: 'Address',
                        prefixIcon: Icons.location_on_outlined,
                        controller: _addressController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter your Address';
                          }
                          return null;
                        },
                      ),
                    ),
                    SaveButton(
                        onPressed: () {
                          _addStudent(context);
                        },
                        text: "Save")
                  ],
                ),
              )),
        ),
      ),
    );
  }

  void _addStudent(BuildContext context) {
    final String name = _nameController.text;
    final String age = _ageController.text;
    final String phone = _phoneController.text;
    final String address = _addressController.text;

    if (name.isNotEmpty &&
        age.isNotEmpty &&
        phone.isNotEmpty &&
        address.isNotEmpty) {
      final Student newStudent = Student(
          name: name, age: age, phone: phone, address: address, imagePath: '');
      Provider.of<StudentProvider>(context, listen: false)
          .addStudent(newStudent);
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all fields'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  // @override
  // void dispose() {
  //   _nameController.dispose();
  //   _ageController.dispose();
  //   _phoneController.dispose();
  //   _addressController.dispose();
  //       super.dispose();

  // }
}
