import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myexpensetrackerapp/ExpenseList.dart';
import 'package:myexpensetrackerapp/Model/Expense.dart';
import 'package:myexpensetrackerapp/NewExpense.dart';
import 'package:myexpensetrackerapp/SimpleBarChart.dart';

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

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Expense Added'),
        duration: Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  removeExpense(Expense expense) {
    setState(() {
      registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Expense Deleted'),
        duration: Duration(seconds: 5),
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              registeredExpenses.add(expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    print(screenWidth);

    return Scaffold(
      appBar: AppBar(
        title: Text('EXPENSE TRACKER'),
        actions: [
          IconButton(onPressed: openExpenseAdderOverlay, icon: Icon(Icons.add)),
        ],
      ),
      body:
          screenWidth < 500
              ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SimpleBarChart(expenses: registeredExpenses),
                  ),
                  Expanded(
                    child: Expenselist(
                      expenses: registeredExpenses,
                      onRemoveExpense: removeExpense,
                    ),
                  ),
                ],
              )
              : Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SimpleBarChart(expenses: registeredExpenses),
                    ),
                  ),
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