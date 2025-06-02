import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

enum Category { Food, Travel, Leisure, Work }

final uuid = Uuid();
final formatter = DateFormat().add_yMd();

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String getFormattedDate() {
    return formatter.format(date);
  }

  getCategoryIcon() {
    if (category == Category.Food) {
      return Icons.fastfood;
    } else if (category == Category.Leisure) {
      return Icons.movie;
    } else if (category == Category.Work) {
      return Icons.work;
    } else {
      return Icons.flight;
    }
  }
}



/*
charctersrtics of Expense Objcet
//amount;double
//title;string
//category:
//{
////work
//travel
//food
//leisure
}
//Date:Date
id:string

*/