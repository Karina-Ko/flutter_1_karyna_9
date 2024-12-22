import 'package:flutter/material.dart';
import '../models/student.dart';

class StudentItem extends StatelessWidget {
  final Student student;

  const StudentItem({Key? key, required this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Використовуємо нові кольори для статі
    final color = genderColors[student.gender]!;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${student.firstName} ${student.lastName}',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Row(
            children: [
              Icon(departmentIcons[student.department], color: Colors.white),
              SizedBox(width: 5),
              Text(
                student.grade.toString(),
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}