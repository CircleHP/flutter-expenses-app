import 'package:flutter/material.dart';
import 'package:flutter_app_1/widgets/Chart/chart_bar.dart';
import 'package:intl/intl.dart';

import '../../models/transaction/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  const Chart(this.recentTransaction, {super.key});

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;

      for (var transaction in recentTransaction) {
        if (transaction.date.day == weekDay.day &&
            transaction.date.month == weekDay.month &&
            transaction.date.year == weekDay.year) {
          totalSum += transaction.amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(
        0.0,
        (previousValue, element) =>
            previousValue += (element['amount'] as double));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: groupedTransactionValues
              .map((element) => Flexible(
                    fit: FlexFit.tight,
                    child: ChartBar(
                      label: element['day'] as String,
                      amount: element['amount'] as double,
                      spendingPercentage:
                          (element['amount'] as double) / totalSpending,
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
