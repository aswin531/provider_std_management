import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:student_management/models/studentmodel.dart';
import 'package:student_management/presentation/controllers/providercontroller.dart';
import 'package:student_management/presentation/screens/login.dart';
 
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(StudentAdapter());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ChangeNotifier>(create: (context) => StudentProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: LoginScreen(),
    );
  }
}
