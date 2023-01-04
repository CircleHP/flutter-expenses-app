import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/transaction/transaction.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;

  const TransactionCard({required this.transaction, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.black,
          radius: 30,
          child: Text(
            '\$${transaction.amount.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 14),
          ),
        ),
        title: Text(
          transaction.title,
          style: const TextStyle(color: Colors.black),
        ),
        subtitle: Text(
          DateFormat('MMMM yyyy, HH:MM').format(transaction.date),
        ),
        trailing: const Icon(Icons.delete),
      ),
    );
  }
}
