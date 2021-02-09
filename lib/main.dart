import 'package:flutter/material.dart';
import 'package:personal_expenses/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 't-shirt', amount: 25.99, date: DateTime.now()),
    Transaction(id: 't3', title: 'jeans', amount: 55.78, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              child: Text(
                'Chart!',
                textAlign: TextAlign.start,
              ),
              elevation: 5,
              color: Colors.indigo,
            ),
          ),
          Column(
            children: [
              ...(transactions
                  .map((tx) => Card(
                        child: Text(tx.title),
                      ))
                  .toList())
            ],
          )
        ],
      ),
    );
  }
}
