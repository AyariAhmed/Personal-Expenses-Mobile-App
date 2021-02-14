import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/transaction_item.dart';

import 'package:personal_expenses/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;
  final Function deleteTransaction;

  TransactionList(userTransaction, this.deleteTransaction)
      : _userTransactions = userTransaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _userTransactions.isEmpty
          ? LayoutBuilder(builder: (ctx, constraints) {
              return Column(
                children: [
                  Text(
                    'No Transactions Added Yet',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.08,
                  ),
                  Container(
                      height: constraints.maxHeight * 0.65,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ))
                ],
              );
            })
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return TransactionItem(userTransaction: _userTransactions[index], deleteTransaction: deleteTransaction);
              },
              itemCount: _userTransactions.length,
            ),
    );
  }
}
