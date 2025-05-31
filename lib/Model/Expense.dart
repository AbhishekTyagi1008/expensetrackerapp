import 'package:flutter/rendering.dart';
import 'package:uuid/uuid.dart';

enum Category { Food, Travel, Leisure, Work }

final uuid = Uuid();

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