import 'package:flutter/material.dart';

import 'package:personal_expenses/widgets/transaction_list.dart';
import 'package:personal_expenses/widgets/new_transaction.dart';
import 'package:personal_expenses/models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 't-shirt', amount: 25.99, date: DateTime.now()),
    Transaction(
      id: 't3',
      title: 'jeans',
      amount: 55.78,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction({String txTitle, double txAmount}) {
    final Transaction newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
