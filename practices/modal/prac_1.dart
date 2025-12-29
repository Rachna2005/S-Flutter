// import 'package:flutter/material.dart';

// void main() => runApp(Exercise1App());

// class Exercise1App extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text("Exercise 1: Simple Modal")),
//         body: Center(
//           child: Builder(
//             builder: (context) => ElevatedButton(
//               onPressed: () {
//                 showDialog(
//                   context: context,
//                   builder: (ctx) => AlertDialog(
//                     title: Text("Hello Modal"),
//                     content: Text("This is your first modal."),
//                     actions: [
//                       TextButton(
//                         onPressed: () => Navigator.of(ctx).pop(),
//                         child: Text("Close"),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//               child: Text("Open Modal"),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



    import 'package:flutter/material.dart';

/// Flutter code sample for [showModalBottomSheet].

void main() => runApp(const BottomSheetApp());

class BottomSheetApp extends StatelessWidget {
  const BottomSheetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Bottom Sheet Sample')),
        body: const BottomSheetExample(),
      ),
    );
  }
}

class BottomSheetExample extends StatelessWidget {
  const BottomSheetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('showModalBottomSheet'),
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 200,
                color: Colors.amber,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text('Modal BottomSheet'),
                      ElevatedButton(
                        child: const Text('Close BottomSheet'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}