import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
                return Card(
                  elevation: 3,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: FittedBox(
                            child:
                                Text('\$${_userTransactions[index].amount}')),
                      ),
                    ),
                    title: Text(
                      _userTransactions[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(DateFormat.yMMMMEEEEd()
                        .format(_userTransactions[index].date)),
                    trailing: MediaQuery.of(context).size.width > 360
                        ? FlatButton.icon(
                            onPressed: () =>
                                deleteTransaction(_userTransactions[index].id),
                            icon: Icon(Icons.delete),
                            label: Text('Delete'),
                            textColor: Colors.grey,
                          )
                        : IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () =>
                                deleteTransaction(_userTransactions[index].id),
                          ),
                  ),
                );
              },
              itemCount: _userTransactions.length,
            ),
    );
  }
}
