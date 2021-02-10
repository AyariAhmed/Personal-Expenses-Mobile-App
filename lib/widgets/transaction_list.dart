import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:personal_expenses/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;

  TransactionList(userTransaction) : _userTransactions = userTransaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 410,
      child: _userTransactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No Transactions Added Yet',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 15,),
                Container(
                    height: 350,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ))
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          ),
                        ),
                        child: Text(
                          '\$ ${_userTransactions[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        padding: EdgeInsets.all(8),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _userTransactions[index].title,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            DateFormat.yMMMMEEEEd()
                                .format(_userTransactions[index].date),
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: _userTransactions.length,
            ),
    );
  }
}
