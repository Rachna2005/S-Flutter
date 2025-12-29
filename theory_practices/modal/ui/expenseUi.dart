import 'package:firstproject/theory_practices/modal/model/expense.dart';
import 'package:firstproject/theory_practices/modal/ui/expense_item.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  Expenses({super.key, required this.registeredExpenses});
  List<Expense> registeredExpenses;
  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.green[100],
        appBar: AppBar(
          title: Text("Expenses App"),
          backgroundColor: Colors.blue,
          actions: [
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext newContext) {
                    return Container(
                      height: 400,
                      color: Colors.green,
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(newContext),
                          child: Text('Close Modal'),
                        ),
                      ),
                    );
                  },
                );
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
        body: ListView.builder(
          padding: EdgeInsets.only(top: 40, left: 10, right: 10),
          itemCount: widget.registeredExpenses.length,
          itemBuilder: (context, index) {
            return ExpenseItem(item: widget.registeredExpenses[index]);
          },
        ),
      ),
    );
  }
}
