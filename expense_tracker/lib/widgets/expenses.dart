import 'package:expense_tracker/models/expense.dart';
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

class _ExpensesState extends State<Expenses> {
  final List<Expense> _regeisteredExpenses = [
    Expense(
        title: 'food',
        amount: 100,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: 'Flutter Course',
        amount: 499,
        date: DateTime.now(),
        category: Category.work),
  ];

  void _addExpense(Expense expense) {
    setState(() {
      _regeisteredExpenses.add(expense);
    });
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: _addExpense,
      ),
    );
  }

  @override
  Widget build(context) {
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
      body: Column(
        children: [
          const Text("Chart"),
          Expanded(child: ExpensesList(expenses: _regeisteredExpenses)),
        ],
      ),
    );
  }
}
