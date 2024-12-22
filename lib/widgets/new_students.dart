import 'package:flutter/material.dart';
import '../models/student.dart';

class NewStudentScreen extends StatefulWidget {
  final Function(Student)? onSave; // Функція зворотного виклику
  final Student? existingStudent; // Для редагування студента

  const NewStudentScreen({Key? key, this.onSave, this.existingStudent}) : super(key: key);

  @override
  _NewStudentScreenState createState() => _NewStudentScreenState();
}

class _NewStudentScreenState extends State<NewStudentScreen> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  Department? selectedDepartment;
  Gender? selectedGender;
  late int grade;

  @override
  void initState() {
    super.initState();
    final existing = widget.existingStudent;
    firstNameController = TextEditingController(text: existing?.firstName ?? '');
    lastNameController = TextEditingController(text: existing?.lastName ?? '');
    selectedDepartment = existing?.department;
    selectedGender = existing?.gender;
    grade = existing?.grade ?? 1;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: firstNameController,
            decoration: InputDecoration(labelText: 'First Name'),
          ),
          TextField(
            controller: lastNameController,
            decoration: InputDecoration(labelText: 'Last Name'),
          ),
          DropdownButton<Department>(
            value: selectedDepartment,
            items: Department.values.map((department) {
              return DropdownMenuItem(
                value: department,
                child: Text(department.name),
              );
            }).toList(),
            onChanged: (value) => setState(() => selectedDepartment = value),
            hint: Text('Select Department'),
          ),
          DropdownButton<Gender>(
            value: selectedGender,
            items: Gender.values.map((gender) {
              return DropdownMenuItem(
                value: gender,
                child: Text(gender.name),
              );
            }).toList(),
            onChanged: (value) => setState(() => selectedGender = value),
            hint: Text('Select Gender'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Grade: $grade'),
              Slider(
                value: grade.toDouble(),
                min: 1,
                max: 10,
                divisions: 9,
                label: grade.toString(),
                onChanged: (value) => setState(() => grade = value.toInt()),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              if (selectedDepartment != null && selectedGender != null) {
                widget.onSave?.call(Student(
                  firstName: firstNameController.text,
                  lastName: lastNameController.text,
                  department: selectedDepartment!,
                  grade: grade,
                  gender: selectedGender!,
                ));
                Navigator.pop(context);
              }
            },
            child: Text(widget.existingStudent == null ? 'Add' : 'Save'),
          ),
        ],
      ),
    );
  }
}


