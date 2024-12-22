import 'package:flutter/material.dart';

enum Department { engineering, arts, sports, business }
enum Gender { male, female }

const departmentIcons = {
  Department.engineering: Icons.build,
  Department.arts: Icons.palette,
  Department.sports: Icons.sports_basketball,
  Department.business: Icons.business_center,
};

const genderColors = {
  Gender.male: Colors.blueGrey, 
  Gender.female: Colors.orangeAccent, 
};

class Student {
  final String firstName;
  final String lastName;
  final Department department;
  final int grade;
  final Gender gender;

  Student({
    required this.firstName,
    required this.lastName,
    required this.department,
    required this.grade,
    required this.gender,
  });
}

