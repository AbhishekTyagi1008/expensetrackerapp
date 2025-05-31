import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myexpensetrackerapp/ExpenseList.dart';
import 'package:myexpensetrackerapp/Model/Expense.dart';

class Expensetracker extends StatelessWidget {
  List<Expense> registeredExpenses = [
    Expense(
      title: 'Flutter',
      amount: 5.25,
      date: DateTime.now(),
      category: Category.Work,
    ),
    Expense(
      title: 'Moive',
      amount: 10,
      date: DateTime.now(),
      category: Category.Leisure,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('EXPENSE'),
          Expanded(child: Expenselist(expenses: registeredExpenses)),
        ],
      ),
    );
  }
}


//work
//travel
//food
//leisure