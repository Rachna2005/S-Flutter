
import 'package:flutter/material.dart';

enum ButtonType { primary, secondary, disable }

const Map<ButtonType, Color> buttonColor = {
  ButtonType.primary: Colors.blue,
  ButtonType.secondary: Colors.green,
  ButtonType.disable: Colors.grey,
};

enum iconPosition { left, right }

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            children: [
              CustomButton(label: 'Home', icon: Icons.home),
              CustomButton(
                label: 'School',
                icon: Icons.school,
                position: iconPosition.right,
                type: ButtonType.secondary,
              ),
              CustomButton(
                label: 'Music',
                icon: Icons.music_note,
                type: ButtonType.disable,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  String label;
  IconData icon;
  iconPosition position;
  ButtonType type;
  CustomButton({
    required this.label,
    required this.icon,
    this.position = iconPosition.left,
    this.type = ButtonType.primary,
  });
  @override
  Widget build(BuildContext context) {
    Color backgroundColor = buttonColor[type]!;
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: backgroundColor,
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (position == iconPosition.left)
            Padding(padding: EdgeInsets.only(right: 20), child: Icon(icon)),

          Text(label),

          if (position == iconPosition.right)
            Padding(padding: EdgeInsets.only(left: 20), child: Icon(icon)),
        ],
      ),
    );
  }
}
