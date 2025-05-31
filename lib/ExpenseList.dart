import 'package:flutter/material.dart';
import 'package:myexpensetrackerapp/ExpenseItemCard.dart';
import 'package:myexpensetrackerapp/Model/Expense.dart';

class Expenselist extends StatelessWidget {
  List<Expense> expenses;

  Expenselist({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Expenseitemcard(expenses[index]),
    );
  }
}
