import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  final List<TransactionModel> transactions = [
    TransactionModel(id:'1',title: 'New Shoes',amount: 25.26,date:DateTime.now()),
    TransactionModel(id:'2',title: 'New Hoodie',amount: 45.34,date:DateTime.now().add(const Duration(days: -30)))
  ];
  TextEditingController titleController= TextEditingController();
  TextEditingController amountController= TextEditingController();

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
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(decoration: InputDecoration(labelText: 'Title'), controller: titleController,),
                  TextField(decoration: InputDecoration(labelText: 'Amount'),controller: amountController,),
                  TextButton(onPressed: ()=>{
                    print('title:${titleController.text} amount:${amountController.text} date:${DateTime.now()}')
                  }, child: Text('Add Transaction'),),
                ],
              ),
            ),
          ),
          Column(
            children: [
              ...transactions.map((t) =>
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 4),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.deepPurple,width:2 ,),borderRadius: BorderRadius.circular(8)
                            ),
                            child:
                              Text(
                                '\$ ${t.amount}',
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.deepPurpleAccent ),
                              ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(t.title,style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                              Text(DateFormat('dd-MM-yyyy hh:mm').format(t.date), style: const TextStyle(color: Colors.grey))
                            ]
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
