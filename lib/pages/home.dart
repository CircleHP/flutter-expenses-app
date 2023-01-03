import 'package:flutter/material.dart';

import '../widgets/user_transactions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('App')),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 3,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text('Chart'),
                ),
              ),
            ),
            UserTransactions(),
          ],
        ),
      ),
    );
  }
}
