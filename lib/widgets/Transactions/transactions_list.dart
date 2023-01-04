import 'package:flutter/material.dart';

import '../../models/transaction/transaction.dart';
import 'transaction_card.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList(this.transactions, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: transactions
            .map(
              ((transaction) => TransactionCard(
                    transaction: transaction,
                  )),
            )
            .toList(),
      ),
    );
  }
}
