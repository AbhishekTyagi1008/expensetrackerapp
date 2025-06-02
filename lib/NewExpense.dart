import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat().add_yMd();

class NewExpense extends StatefulWidget {
  @override
  State<NewExpense> createState() {
    return NewexpenseState();
  }
}

class NewexpenseState extends State<NewExpense> {
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController amountTextEditingController = TextEditingController();
  String? selectedDate;
  presentDatePicker() async {
    DateTime now = DateTime.now();
    DateTime firstDate = DateTime(2025, 1, 1);
    DateTime lastDate = DateTime(2025, 12, 31);
    final dateSelected = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    setState(() {
      selectedDate = formatter.format(dateSelected!).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            maxLength: 50,
            controller: titleTextEditingController,
            decoration: InputDecoration(labelText: 'Title'),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: amountTextEditingController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixText: '\$',
                    labelText: 'Amount',
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Row(
                  children: [
                    Text(selectedDate == null ? "" : selectedDate!),
                    IconButton(
                      onPressed: presentDatePicker,
                      icon: Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
