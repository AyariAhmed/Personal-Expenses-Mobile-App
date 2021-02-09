import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/user_transactions.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Chart!',
                  textAlign: TextAlign.start,
                ),
              ),
              elevation: 5,
              color: Colors.blue,
            ),
          ),
          UserTransactions()
        ],
      ),
    );
  }
}
