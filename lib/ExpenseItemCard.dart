/*
title
amount
date
category icon

*/

import 'package:flutter/material.dart';
import 'package:myexpensetrackerapp/Model/Expense.dart';

class Expenseitemcard extends StatelessWidget {
  final Expense expense;

  Expenseitemcard(this.expense);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Text(expense.title, style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 4),
            Row(
              children: [
                Text(
                  '\$' + expense.amount.toString(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Spacer(),
                Row(
                  children: [
                    Icon(expense.getCategoryIcon()),
                    Text(
                      expense.category.name.toString(),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    SizedBox(width: 10),
                    Text(
                      expense.getFormattedDate(),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
