import 'package:firstproject/theory_practices/modal/model/expense.dart';
import 'package:firstproject/theory_practices/modal/ui/expenseUi.dart';
import 'package:flutter/cupertino.dart';

void main(){
  List<Expense> item = [
      Expense(
      title: "Lunch",
      amount: 15.99,
      date: DateTime.now(),
      category: ExpenseType.FOOD,
    ),
    Expense(
      title: "Bus Ticket", 
      amount: 2.50,
      date: DateTime.now(),
      category: ExpenseType.TRAVEL,
    ),
  ];
  
  runApp(Expenses(registeredExpenses: item));
}

