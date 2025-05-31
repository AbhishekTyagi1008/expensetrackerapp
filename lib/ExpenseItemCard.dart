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
            Text(expense.title),
            SizedBox(height: 4),
            Row(
              children: [
                Text(expense.amount.toString()),
                Spacer(),
                Row(
                  children: [
                    Icon(Icons.play_arrow),
                    SizedBox(width: 4),
                    Text(expense.date.toString()),
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
