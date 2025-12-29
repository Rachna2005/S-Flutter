import 'package:flutter/material.dart';
import 'ui/groceries/grocery_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Groceries',

      // theme: ThemeData.dark().copyWith(
      //   colorScheme: ColorScheme.fromSeed(
      //     seedColor: const Color.fromARGB(255, 147, 229, 250),
      //     brightness: Brightness.dark,
      //     surface: const Color.fromARGB(255, 42, 51, 59),
      //   ),
      //   scaffoldBackgroundColor: const Color.fromARGB(255, 50, 58, 60),
      // ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: Colors.blueGrey,
        textTheme: TextTheme(
          titleMedium: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      home: const GroceryList(),
    );
  }
}
