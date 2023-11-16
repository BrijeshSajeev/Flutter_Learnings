import 'package:expense_tracker/models/expense.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ExpenseStorage {
  Future<void> saveExpenses(List<Expense> expenses) async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'expenses';

    // Convert List<Expense> to List<String>
    final value =
        expenses.map((expense) => jsonEncode(expense.toJson())).toList();

    prefs.setStringList(key, value);
  }

  Future<List<Expense>> loadExpenses() async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'expenses';
    final value = prefs.getStringList(key);

    if (value == null) {
      return [];
    }

    // Convert List<String> to List<Expense>
    return value
        .map((jsonString) => Expense.fromJson(jsonDecode(jsonString)))
        .toList();
  }
}
