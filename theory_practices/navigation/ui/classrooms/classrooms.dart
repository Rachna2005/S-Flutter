// import 'package:flutter/material.dart';

// import 'classroom/classroom_details.dart';

// class Classrooms extends StatelessWidget {
//   const Classrooms({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final classrooms = [
//       'Flutter – Group 1',
//       'Algorithms – Group 7',
//       'Web Dev – Group 3',
//     ];

//     return Scaffold(
//       appBar: AppBar(title: const Text('Classrooms')),
//       body: ListView.builder(
//         itemCount: classrooms.length,
//         itemBuilder: (context, index) {
//           final classroom = classrooms[index];

//           return ListTile(
//             leading: const Icon(Icons.class_),
//             title: Text(classroom),
//             trailing: const Icon(Icons.chevron_right),
//             onTap: () {
//               // Go to the  ClassroomDetails

//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) =>
//                       ClassroomDetails(classroomId: classroom),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

import 'tabs/classroom_feeds.dart';
import 'tabs/classroom_students.dart';

class Classroom extends StatefulWidget {
  const Classroom({super.key, required this.classroomId});

  final String classroomId;

  @override
  State<Classroom> createState() => _ClassroomDetailsState();
}

enum ClassroomTab { feedTab, studentsTab }

class _ClassroomDetailsState extends State<Classroom> {
  ClassroomTab _currentTab = ClassroomTab.feedTab;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Classroom ${widget.classroomId}')),
      body: IndexedStack(
        index: _currentTab.index,
        // children: [
        //   ClassroomFeeds(classroomId: widget.classroomId),
        //   ClassroomStudents(classroomId: widget.classroomId),
        // ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        currentIndex: _currentTab.index,
        onTap: (index) {
          setState(() {
            _currentTab = ClassroomTab.values[index];
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dynamic_feed),
            label: 'Feed',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Students'),
         
        ],
      ),
    );
  }
}