import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text("Custom buttons")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SelectionButton(),
            SelectionButton(),
            SelectionButton(),
            SelectionButton(),
          ],
        ),
      ),
    ),
  ),
);

class SelectionButton extends StatefulWidget {
  const SelectionButton({super.key});

  @override
  State<SelectionButton> createState() => _SelectionButtonState();
}

class _SelectionButtonState extends State<SelectionButton> {
  bool clickButton = false;
  String get text => clickButton ? 'Selected' : 'Not Selected';
  Color get textColor => clickButton ? Colors.white : Colors.black;
  Color get backgrounfColor =>
      clickButton ? Colors.blue[500]! : Colors.blue[50]!;
  void onClickButton() {
    setState(() {
      clickButton = !clickButton;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        onPressed: onClickButton,
        style: TextButton.styleFrom(
          backgroundColor: backgrounfColor,
          textStyle: const TextStyle(fontSize: 28),
        ),
        child: Text(text, style: TextStyle(color: textColor)),
      ),
    );
  }
}
