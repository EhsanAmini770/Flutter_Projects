import 'package:expense_tracker/expense_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Groceries',
      amount: 100.00,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Transportation',
      amount: 50.00,
      date: DateTime.now(),
      category: Category.transportation,
    ),
    Expense(
      title: 'Movie',
      amount: 30.00,
      date: DateTime.now(),
      category: Category.entertainment,
    ),
    Expense(
      title: 'Books',
      amount: 20.00,
      date: DateTime.now(),
      category: Category.other,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ExpensesList(expenses: _registeredExpenses),
            ),
          ],
        ),
      ),
    );
  }
}
