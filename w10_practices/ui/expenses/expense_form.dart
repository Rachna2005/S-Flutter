import 'package:flutter/material.dart';
import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  Category? currentItem = Category.food;
  final _amountController = TextEditingController();
  DateTime? chooseDate;

  @override
  void dispose() {
    super.dispose();

    _titleController.dispose();
  }

  void onCreate() {
    //  1 Build an expense
    String title = _titleController.text;
    double amount = double.parse(_amountController.text); // for now..
    Category category = currentItem!; // for now..
    DateTime date = chooseDate!;

    // ignore: unused_local_variable
    
    Expense newExpense = Expense(
      title: title,
      amount: amount,
      date: date,
      category: category,
    );

    // TODO YOUR CODE HERE
    Navigator.pop(context, newExpense);
  }

  void onCancel() {
    // Close the modal
    Navigator.pop(context);
  }

  DropdownButton<Category> dropDownDisplay() {
    return DropdownButton<Category>(
      value: currentItem,
      elevation: 16,
      underline: Container(height: 2, color: Colors.deepPurpleAccent),
      items: Category.values.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item.name.toUpperCase()),
        );
      }).toList(),
      onChanged: (newItem) {
        setState(() {
          currentItem = newItem;
        });
      },
    );
  }

  Future<void> _selectDate() async {
    final pickDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2025),
      lastDate: DateTime(2027),
      initialDate: DateTime.now(),
    );
    if (pickDate != null) {
      setState(() {
        chooseDate = pickDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(label: Text("Title")),
            maxLength: 50,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  decoration: InputDecoration(label: Text('Amount')),
                  maxLength: 30,
                ),
              ),
              TextButton(
                onPressed: _selectDate,
                child: Row(
                  children: [
                    Text(
                      chooseDate != null
                          ? '${chooseDate!.day}/${chooseDate!.month}/${chooseDate!.year}'
                          : 'No date selected',
                    ),
                    Icon(Icons.calendar_month),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              dropDownDisplay(),
              Row(
                children: [
                  ElevatedButton(onPressed: onCancel, child: Text("Cancel")),
                  SizedBox(width: 10),
                  ElevatedButton(onPressed: onCreate, child: Text("Create")),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
