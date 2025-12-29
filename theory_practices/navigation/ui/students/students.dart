import 'package:firstproject/theory_practices/navigation/ui/students/student_detail.dart';
import 'package:flutter/material.dart';

class Students extends StatelessWidget {
  const Students({super.key});

  @override
  Widget build(BuildContext context) {
    final students = ['Mona', 'Lita', 'Moka'];
    return Scaffold(
      appBar: AppBar(title: const Text('Students')),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];

          return ListTile(
            leading: const Icon(Icons.person),
            title: Text(student),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Go to the  Student detail

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StudentDetail(studentId: student),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
