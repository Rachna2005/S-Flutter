// import 'package:flutter/material.dart';

// import 'navigation_second.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home Screen'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text('This is the Home Screen'),
//             ElevatedButton(
//               onPressed: ()  {
//                  Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const SecondScreen()),
//                 );
//               },
//               child: const Text('Go to Second Screen'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }