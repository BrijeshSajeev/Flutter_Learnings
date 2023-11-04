import 'dart:convert';
import 'dart:io';

import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expense_helper/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> with WidgetsBindingObserver {
  List<Expense> _regeisteredExpenses = [];

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addObserver(this);
  //   // Load transactions from file when the app starts
  //   loadTransactionsFromFile();
  // }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   if (state == AppLifecycleState.paused) {
  //     // Save transactions to file when the app is paused (closed)
  //     saveTransactionsToFile();
  //   }
  // }

  // void saveTransactionsToFile() async {
  //   print("hello save tarnsaction");
  //   final file = File('transactions.txt');
  //   print(file);
  //   await file.writeAsString(
  //       jsonEncode(_regeisteredExpenses.map((t) => t.toJson()).toList()));
  // }

  // void loadTransactionsFromFile() async {
  //   final file = File('transactions.txt');
  //   if (await file.exists()) {
  //     String transactionsString = await file.readAsString();
  //     List<dynamic> decodedJson = jsonDecode(transactionsString);
  //     _regeisteredExpenses =
  //         decodedJson.map((item) => Expense.fromJson(item)).toList();
  //   }
  // }

  void _addExpense(Expense expense) {
    setState(() {
      _regeisteredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _regeisteredExpenses.indexOf(expense);
    setState(() {
      _regeisteredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense Deleted'),
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
        action: SnackBarAction(
          label: 'undo',
          onPressed: () {
            setState(
              () {
                _regeisteredExpenses.insert(expenseIndex, expense);
              },
            );
          },
        ),
      ),
    );
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: _addExpense,
      ),
    );
  }

  @override
  Widget build(context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Track Day"),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: _regeisteredExpenses),
                Expanded(
                  child: _regeisteredExpenses.isNotEmpty
                      ? ExpensesList(
                          expenses: _regeisteredExpenses,
                          onRemovedExpense: _removeExpense,
                        )
                      : const Center(
                          child: Text('Add new Expense'),
                        ),
                ),
              ],
            )
          : Row(
              children: [
                Expanded(child: Chart(expenses: _regeisteredExpenses)),
                Expanded(
                  child: _regeisteredExpenses.isNotEmpty
                      ? ExpensesList(
                          expenses: _regeisteredExpenses,
                          onRemovedExpense: _removeExpense,
                        )
                      : const Center(
                          child: Text('Add new Expense'),
                        ),
                ),
              ],
            ),
    );
  }
}
