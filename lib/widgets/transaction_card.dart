import 'package:flutter/material.dart';

import '../classes/transaction/transaction.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;

  const TransactionCard({required this.transaction, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.orange,
            width: 1,
          ),
        ),
        width: double.infinity,
        child: Row(
          children: [
            Text(transaction.amount.toString()),
            Column(
              children: [
                Text(transaction.title),
                Text(transaction.date.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
