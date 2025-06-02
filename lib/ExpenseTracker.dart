import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myexpensetrackerapp/ExpenseList.dart';
import 'package:myexpensetrackerapp/Model/Expense.dart';
import 'package:myexpensetrackerapp/NewExpense.dart';

class ExpenseTracker extends StatefulWidget {
  @override
  State<ExpenseTracker> createState() {
    return ExpensetrackerState();
  }
}

class ExpensetrackerState extends State<ExpenseTracker> {
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

  void openExpenseAdderOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (context) => NewExpense(onAddExpense: addExpense),
    );
  }

  addExpense(Expense expense) {
    print(expense);
    setState(() {
      registeredExpenses.add(expense);
    });
  }

  removeExpense(Expense expense) {
    registeredExpenses.remove(expense);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EXPENSE TRACKER'),
        actions: [
          IconButton(onPressed: openExpenseAdderOverlay, icon: Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [
          Text('EXPENSE'),
          Expanded(
            child: Expenselist(
              expenses: registeredExpenses,
              onRemoveExpense: removeExpense,
            ),
          ),
        ],
      ),
    );
  }
}


//work
//travel
//food
//leisure