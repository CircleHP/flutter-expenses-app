import 'package:flutter/material.dart';

import '../models/transaction/transaction.dart';
import '../widgets/transactions_list.dart';
import '../widgets/create_transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({super.key});

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _transactions = [
    Transaction(
      id: 't1',
      title: 'New item',
      amount: 15.0,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'New item #2',
      amount: 10.0,
      date: DateTime.now(),
    )
  ];

  void _addNewTransaction(String title, double amount) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreateTransaction(_addNewTransaction),
        TransactionList(
          transactions: _transactions,
        ),
      ],
    );
  }
}
