import 'dart:convert';
import 'dart:io';

import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/models/expense_storage.dart';
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
  List<Expense> _regeisteredExpenses = [
    Expense(
      title: "title",
      amount: 200,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: "title2",
      amount: 200,
      date: DateTime.now(),
      category: Category.food,
    ),
  ];

  // Expense storage instance
  final ExpenseStorage _expenseStorage = ExpenseStorage();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    // Load expenses when the app is opened
    _loadExpenses();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // Callback for app lifecycle state changes
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    // Save expenses when the app is closed
    if (state == AppLifecycleState.detached ||
        state == AppLifecycleState.paused) {
      _saveExpenses();
    }
  }

  // Function to save expenses
  Future<void> _saveExpenses() async {
    await _expenseStorage.saveExpenses(_regeisteredExpenses);
  }

  // Function to load expenses
  Future<void> _loadExpenses() async {
    final loadedExpenses = await _expenseStorage.loadExpenses();
    setState(() {
      _regeisteredExpenses = loadedExpenses;
    });
  }

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
                TextButton(
                  onPressed: () async {
                    await _expenseStorage.saveExpenses(_regeisteredExpenses);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(59, 239, 221, 253),
                  ),
                  child: const Text("save",
                      style: TextStyle(
                        fontSize: 16,
                      )),
                ),
                const SizedBox(
                  height: 20,
                )
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
                TextButton(
                  onPressed: () async {
                    await _expenseStorage.saveExpenses(_regeisteredExpenses);
                  },
                  child: const Text("save"),
                )
              ],
            ),
    );
  }
}
