import 'package:flutter/material.dart';

import 'package:personal_expenses/widgets/transaction_list.dart';
import 'package:personal_expenses/widgets/new_transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      NewTransaction(),
      TransactionList()
    ],);
  }
}
