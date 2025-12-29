import 'package:uuid/uuid.dart';

var uuid = Uuid();

enum ExpenseType{
  FOOD,
  TRAVEL,
  LEISURE,
  WORK
}

class Expense {
  String id;
  String title;
  double amount;
  DateTime date;
  ExpenseType category;
  Expense({String? id ,required this.title,required this.amount, required this.date,required this.category }) : id = id ?? uuid.v4() ;
}