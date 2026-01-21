import 'package:flutter/material.dart';
import '../../models/restaurant_comment.dart';

class CommentsForm extends StatefulWidget {
  const CommentsForm({super.key});

  @override
  State<CommentsForm> createState() => _CommentsFormState();
}

class _CommentsFormState extends State<CommentsForm> {
  final _commentController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final List<int> rate = [0, 1, 2, 3, 4, 5];
  final int initialValue = 0;

  late int _selectedRate = initialValue;

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void submitForm() {
    if (!_formKey.currentState!.validate()) return;

    String comment = _commentController.text;
    int rate = _selectedRate;
    RestaurantComment myComment = RestaurantComment(
      star: rate,
      feedback: comment,
    );

    Navigator.pop(context, myComment);
  }

  String? validateComment(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter your feedback";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            DropdownButtonFormField<int>(
              initialValue: initialValue,
              items: rate
                  .map(
                    (g) =>
                        DropdownMenuItem(value: g, child: Text(g.toString())),
                  )
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedRate = value;
                  });
                }
              },
              decoration: const InputDecoration(labelText: "Rate"),
            ),

            const SizedBox(height: 12),

            TextFormField(
              validator: validateComment,
              controller: _commentController,
              maxLength: 50,
              decoration: const InputDecoration(labelText: 'Comment'),
            ),

            const SizedBox(height: 20),

            /// Submit button
            ElevatedButton(onPressed: submitForm, child: const Text('Comment')),
          ],
        ),
      ),
    );
  }
}
