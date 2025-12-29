import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firstproject/theory_practices/modal/model/expense.dart';

class ExpenseItem extends StatelessWidget {
  ExpenseItem({super.key, required this.item});

  Expense item;

  Icon get categoryIcon {
    return switch (item.category) {
      ExpenseType.FOOD => Icon(Icons.fastfood),
      ExpenseType.LEISURE => Icon(Icons.movie),
      ExpenseType.TRAVEL => Icon(Icons.flight),
      ExpenseType.WORK => Icon(Icons.work),
    };
  }

  String get formatDate {
    return DateFormat('MM/dd/yyyy').format(item.date);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title, style: TextStyle(fontWeight: FontWeight.bold)),
                Text('\$${item.amount}'),
              ],
            ),
            Spacer(),
            Row(spacing: 7, children: [categoryIcon, Text(formatDate)]),
          ],
        ),
      ),
    );
  }
}