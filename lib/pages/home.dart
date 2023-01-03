import 'package:flutter/material.dart';

import '../classes/transaction/transaction.dart';
import '../widgets/transaction_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Transaction> transactions = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('App')),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: const Card(
              elevation: 3,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Text('Chart'),
              ),
            ),
          ),
          Column(
            children: transactions
                .map(((transaction) => TransactionCard(
                      transaction: transaction,
                    )))
                .toList(),
          )
        ],
      ),
    );
  }
}
