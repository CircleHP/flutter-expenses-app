import 'package:flutter/material.dart';

import '../models/transaction/transaction.dart';
import '../widgets/Transactions/create_transaction.dart';
import '../widgets/Transactions/transactions_list.dart';
import '../widgets/Transactions/no_transactions.dart';
import '../widgets/Chart/chart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _transactions = [];

  List<Transaction> get _recentTransactions {
    return _transactions
        .where(
          (transaction) => transaction.date.isAfter(
            DateTime.now().subtract(const Duration(days: 7)),
          ),
        )
        .toList();
  }

  void _addNewTransaction(String title, double amount, DateTime date) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: date,
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.pop(context);
  }

  void _toggleCreateTransactionModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: ((_) {
        return CreateTransaction(_addNewTransaction);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses'),
        actions: [
          IconButton(
            onPressed: () => _toggleCreateTransactionModal(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: _transactions.isEmpty
            ? const NoTransactions()
            : Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Chart(_recentTransactions),
                  ),
                  TransactionList(_transactions),
                ],
              ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _toggleCreateTransactionModal(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
