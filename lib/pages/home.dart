import 'package:flutter/material.dart';

import '../models/transaction/transaction.dart';
import '../widgets/create_transaction.dart';
import '../widgets/transactions_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 3,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text('Chart'),
                ),
              ),
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
