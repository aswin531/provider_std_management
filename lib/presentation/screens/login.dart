import 'package:flutter/material.dart';
import 'package:student_management/presentation/widgets/loginbutton.dart';
import 'package:student_management/presentation/widgets/textformfield.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTextFormField(
                      labelText: "Username",
                      prefixIcon: Icons.person_outlined,
                      keyboardType: TextInputType.text,
                      controller: usernameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your Name";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTextFormField(
                      labelText: "Password",
                      prefixIcon: Icons.lock,
                      keyboardType: TextInputType.text,
                      controller: passwordController,
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your Password";
                        }
                        return null;
                      },
                    ),
                  ),
                  const LoginButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
