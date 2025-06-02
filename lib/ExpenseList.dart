import 'package:flutter/material.dart';
import 'package:myexpensetrackerapp/ExpenseItemCard.dart';
import 'package:myexpensetrackerapp/Model/Expense.dart';

class Expenselist extends StatelessWidget {
  List<Expense> expenses;

  final void Function(Expense) onRemoveExpense;

  Expenselist({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder:
          (context, index) => Dismissible(
            key: ValueKey(expenses[index]),
            child: Expenseitemcard(expenses[index]),
            onDismissed: (direction) {
              onRemoveExpense(expenses[index]);
            },
          ),
    );
  }
}
