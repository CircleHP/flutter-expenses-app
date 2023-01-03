import 'package:flutter/material.dart';

class CreateTransaction extends StatelessWidget {
  final Function createTransaction;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  CreateTransaction(this.createTransaction, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              controller: titleController,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Amount',
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              controller: amountController,
            ),
          ),
          TextButton(
            onPressed: () {
              createTransaction(
                titleController.text,
                double.parse(amountController.text),
              );
            },
            child: const Text('Add transaction',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )),
          )
        ],
      ),
    );
  }
}
