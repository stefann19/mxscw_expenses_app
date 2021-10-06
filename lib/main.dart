import 'package:flutter/material.dart';
import './transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final List<Transaction> transactions = [
    Transaction(id:'1',title: 'New Shoes',amount: 25.26,date:DateTime.now()),
    Transaction(id:'2',title: 'New Hoodie',amount: 45.34,date:DateTime.now().add(const Duration(days: -30)))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Card(
              child:Text ('Chart placeholder',),
              elevation: 5,
              color: Colors.cyan,
            ),
          ),
          Card(child: Text('List of transactions'),)
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
