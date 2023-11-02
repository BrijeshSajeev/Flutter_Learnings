// import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

enum Category { food, work, leisure, travel }

const categoryIcons = {
  Category.food: Icon(Icons.lunch_dining),
  Category.travel: Icon(Icons.flight_takeoff),
  Category.leisure: Icon(Icons.movie),
  Category.work: Icon(Icons.work),
};

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

  String get formatDate {
    return formatter.format(date);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date.toIso8601String(), // Serialize DateTime to a string
      'category': category.toString(), // Serialize enum to string
      'title': title,
      'amount': amount,
    };
  }

  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      title: json['title'] as String,
      amount: json['amount'] as double,
      date: DateTime.parse(
          json['date'] as String), // Parse string back to DateTime
      category: Category.values.firstWhere((e) =>
          e.toString() ==
          json['category'] as String), // Deserialize enum from string
    );
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }

    return sum;
  }
}
