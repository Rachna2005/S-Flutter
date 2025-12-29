import 'package:flutter/material.dart';

import '../../models/expense.dart' ;

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  String titleValue = '';


 void dispose() {
    _titleController.dispose(); 
    super.dispose();
  }
  void onTitleChanged(String newValue) {
    setState(() {
      titleValue = newValue;
    });
  }

   void onCreate() {
    //  1 Build an expense
    String  title = _titleController.text;
    double amount = 0;             // for now..
    Category category =Category.food;   // for now..
    DateTime date = DateTime.now();

    Expense newExpense = Expense(title: title, amount: amount, date: date, category: category);

    // YOUR CODE
    
    // 2 Close the modal
    Navigator.pop(context);
  }


  void onCancel() {
    // Close the modal
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(label: Text("Title")),
            maxLength: 50,
          ),
          Text("Value is ${_titleController.text}"),
          ElevatedButton(onPressed: onCreate, child: Text("Create")),
        ],
      ),
    );
  }
}
