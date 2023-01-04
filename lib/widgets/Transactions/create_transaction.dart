import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateTransaction extends StatefulWidget {
  final Function createTransaction;

  CreateTransaction(this.createTransaction, {super.key});

  @override
  State<CreateTransaction> createState() => _CreateTransactionState();
}

class _CreateTransactionState extends State<CreateTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.createTransaction(enteredTitle, enteredAmount, _selectedDate);
  }

  void _toggleDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((date) {
      setState(() {
        _selectedDate = date;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_selectedDate);
    return Card(
      elevation: 3,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _titleController,
              onSubmitted: (_) => _submitData(),
              decoration: const InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _amountController,
              onSubmitted: (_) => _submitData(),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Amount',
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 12.0,
            ),
            child: Row(
              children: [
                Text(
                  _selectedDate == null
                      ? 'No date selected'
                      : DateFormat('dd MMMM yyyy').format(_selectedDate!),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 25.0),
                  child: IconButton(
                    onPressed: () => _toggleDatePicker(context),
                    icon: Icon(
                      Icons.date_range,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          TextButton(
            onPressed: _submitData,
            child: const Text('Add transaction',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )),
          )
        ],
      ),
    );
  }
}
