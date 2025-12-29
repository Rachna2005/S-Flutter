import 'package:flutter/material.dart';
import '../../models/expense.dart';
import 'expense_form.dart';
import 'expense_item.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() {
    return _ExpensesScreenState();
  }
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  final List<Expense> _expenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void onAddClicked(BuildContext context) async {
    final expense = await showModalBottomSheet<Expense>(
      isScrollControlled: false,
      context: context,
      builder: (c) => Center(child: ExpenseForm()),
    );

    //TODO YOUR CODE HERE
    setState(() {
      if (expense != null) {
        _expenses.add(expense);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => {onAddClicked(context)},
            icon: Icon(Icons.add),
          ),
        ],
        backgroundColor: Colors.blue[700],
        title: const Text('My Expenses App'),
      ),
      body: _expenses.isEmpty
          ? Center(child: Text('No expenses found. Start adding some!'))
          : ListView.builder(
              itemCount: _expenses.length,
              itemBuilder: (context, index) {
                final removeExpense = _expenses[index];
                final removeIndex = index;
                return Dismissible(
                  key: ValueKey(_expenses[index]),
                  onDismissed: (direction) {
                    setState(() {
                      _expenses.removeAt(index);
                    });
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Expense deleted'),
                        duration: Duration(seconds: 3),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {
                            setState(() {
                              _expenses.insert(removeIndex, removeExpense);
                            });
                          },
                        ),
                      ),
                    );
                  },
                  child: ExpenseItem(expense: _expenses[index]),
                );
              },
            ),
    );
  }
}
