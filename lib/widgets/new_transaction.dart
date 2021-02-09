import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function _addNewTransaction;

  NewTransaction(addNewTransaction) : _addNewTransaction = addNewTransaction;

  void submitData() {
    final String enteredTitle = titleController.text;
    double enteredAmount;
    if (amountController.text.isEmpty)
      enteredAmount = 0;
    else
      enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) return;

    _addNewTransaction(txTitle: enteredTitle, txAmount: enteredAmount);
  }

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
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData,
            ),
            FlatButton(
              onPressed: submitData,
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
