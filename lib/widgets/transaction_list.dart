import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:personal_expenses/models/transaction.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> _userTransactions;

  TransactionList(userTransaction) : _userTransactions = userTransaction;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...(_userTransactions
            .map((tx) => Card(
                  child: Row(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.purple,
                            width: 2,
                          ),
                        ),
                        child: Text(
                          '\$ ${tx.amount}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                            color: Colors.purple,
                          ),
                        ),
                        padding: EdgeInsets.all(8),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            tx.title,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            DateFormat.yMMMMEEEEd().format(tx.date),
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  ),
                ))
            .toList())
      ],
    );
  }
}
