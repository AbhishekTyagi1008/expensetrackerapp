import 'package:flutter/material.dart';
import 'package:myexpensetrackerapp/Model/Expense.dart';
import 'package:pie_chart/pie_chart.dart';

class SimplePieChart extends StatelessWidget {
  final List<Expense> expenses;

  SimplePieChart({required this.expenses});

  Map<String, double> getCategoryTotals() {
    Map<String, double> totals = {
      'Food': 0,
      'Leisure': 0,
      'Travel': 0,
      'Work': 0,
    };

    for (var expense in expenses) {
      String category = expense.category.name;
      totals[category] = totals[category]! + expense.amount;
    }

    // Remove categories with 0 to avoid empty slices
    totals.removeWhere((key, value) => value == 0);

    return totals;
  }

  @override
  Widget build(BuildContext context) {
    final dataMap = getCategoryTotals();

    return PieChart(
      dataMap: dataMap,
      animationDuration: Duration(milliseconds: 800),
      chartRadius: MediaQuery.of(context).size.width / 2.5,
      chartType: ChartType.disc,
      legendOptions: LegendOptions(showLegends: true),
      chartValuesOptions: ChartValuesOptions(showChartValuesInPercentage: true),
    );
  }
}
