import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Open And Close Modal')),
        body: Modal(),
      ),
    );
  }
}

class Modal extends StatelessWidget {
  Modal({super.key});
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Input Your name"),
              content: TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your name',
                ),
              ),

              actions: [
                ElevatedButton(
                  onPressed: () {
                    
                  },
                  child: Text('submit'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close the Modal'),
                ),
              ],
            ),
          );
        },
        child: Text('Open Modal'),
      ),
    );
  }
}
