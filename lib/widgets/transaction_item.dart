import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required Transaction userTransaction,
    @required this.deleteTransaction,
  }) : _userTransaction = userTransaction, super(key: key);

  final Transaction _userTransaction;
  final Function deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: FittedBox(
                child:
                Text('\$${_userTransaction.amount}')),
          ),
        ),
        title: Text(
          _userTransaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(DateFormat.yMMMMEEEEd()
            .format(_userTransaction.date)),
        trailing: MediaQuery.of(context).size.width > 360
            ? FlatButton.icon(
          onPressed: () =>
              deleteTransaction(_userTransaction.id),
          icon: const Icon(Icons.delete),
          label: const Text('Delete'),
          textColor:  Colors.grey,
        )
            : IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () =>
              deleteTransaction(_userTransaction.id),
        ),
      ),
    );
  }
}
