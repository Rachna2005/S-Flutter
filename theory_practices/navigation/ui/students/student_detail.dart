import 'package:flutter/material.dart';

class StudentDetail extends StatefulWidget {
  const StudentDetail({super.key,  required this.studentId});

  final String studentId;

  @override
  State<StudentDetail> createState() => _ClassroomDetailsState();
}

class _ClassroomDetailsState extends State<StudentDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.studentId)),
      // body: Container(
      //   color: Colors.green,
      //   child: Center(child: Text("Classroom ${widget.studentId}")),
      // ),
    );
  }
}