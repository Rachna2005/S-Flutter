import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Exercise 1
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final number = List.generate(5, (index) => 'Item ${index + 1}');
//     return Column(
//       children: number.map((item) {
//         return Text(item);
//       }).toList()
//     );
//   }
// }

// exercise 2
// final fruits = ['Apple', 'Banana', 'Mango'];

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Column(
//           children: fruits.map((item) {
//             if (item == 'Banana') {
//               return Text('🍌');
//             }
//             return Text(item);
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController textControll = TextEditingController();

  void dispose() {
    textControll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            TextField(
              controller: textControll,
              onChanged: (_) => setState(() {}),
            ),

            // ElevatedButton(
            //   onPressed: () {
            //     print(textControll.text);
            //   },
            //   child: Text('Clicked'),
            // ),
            Text(textControll.text),
          ],
        ),
      ),
    );
  }
}
