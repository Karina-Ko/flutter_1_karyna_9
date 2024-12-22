import 'package:flutter/material.dart';
import 'widgets/students.dart';
import 'widgets/new_students.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Students App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => StudentsScreen(), // Головний екран
        '/add-student': (context) => NewStudentScreen(), // Додавання студента
      },
    );
  }
}
