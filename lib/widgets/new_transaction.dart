import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function _addNewTransaction;

  NewTransaction(addNewTransaction) : _addNewTransaction = addNewTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              /*onChanged: (value) => titleInput=value,*/
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              /*onChanged: (value) => amountInput=value,*/
            ),
            FlatButton(
              onPressed: () {
                _addNewTransaction(
                    txTitle: titleController.text,
                    txAmount: double.parse(amountController.text));
              },
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              color: Color(0x3C9E9E9E),
            )
          ],
        ),
      ),
    );
  }
}
