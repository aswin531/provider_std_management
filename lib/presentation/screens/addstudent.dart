// ignore_for_file: use_build_context_synchronously
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management/presentation/controllers/providercontroller.dart';
import 'package:student_management/presentation/widgets/textformfield.dart';

class AddStudentScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AddStudentScreen({super.key});
    final student = Provider.of<StudentProvider>(context as BuildContext);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Center(
                child: Column(
                  children: [
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
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
