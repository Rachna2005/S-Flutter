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
        backgroundColor: const Color.fromARGB(255, 151, 247, 155),
        body: Column(
          children: [
            ScoreCard(subject: 'Dart', score: 5, color: Colors.blue),
            ScoreCard(subject: 'OOP', score: 2, color: Colors.green),
            ScoreCard(subject: 'Java', score: 8, color: Colors.red),
          ],
        ),
      ),
    );
  }
}

class ScoreCard extends StatefulWidget {
  const ScoreCard({
    super.key,
    required this.subject,
    required this.score,
    required this.color,
  });
  final String subject;
  final int score;
  final Color color;

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  late int currentScore = widget.score;

  void increase() {
    setState(() {
      if (currentScore < 10) {
        currentScore++;
      }
    });
  }

  void decrease() {
    setState(() {
      if (currentScore > 0) {
        currentScore--;
      }
    });
  }

  Color getColor(int score) {
    if (score <= 4) return widget.color.withOpacity(0.5);
    if (score <= 8) return widget.color.withOpacity(0.7);
    return widget.color;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'My Score in ${widget.subject}',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: decrease,
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Text('-', style: TextStyle(fontSize: 20)),
                ),
              ),
              GestureDetector(
                onTap: increase,
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Text('+', style: TextStyle(fontSize: 20)),
                ),
              ),
            ],
          ),

          SizedBox(
            width: 400,
            child: Stack(
              children: [
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 40,
                  width: (currentScore / 10) * 400,
                  decoration: BoxDecoration(
                    color: getColor(currentScore),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
