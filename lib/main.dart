import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:mxscw_expenses_app/widgets/chart.dart';
import 'package:mxscw_expenses_app/widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import 'models/transaction.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        colorScheme:
          ColorScheme.fromSwatch(primarySwatch: Colors.cyan)
            .copyWith(secondary: Colors.amber),
        textTheme: ThemeData.light().textTheme.copyWith(
          headline1: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)
        )
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController titleController= TextEditingController();
  final TextEditingController amountController= TextEditingController();

  final List<TransactionModel> _userTransactions = [];

  _addTransaction(TransactionModel transactionModel){
    transactionModel.id = _userTransactions.length.toString();
    setState(() {
      _userTransactions.add(transactionModel);
    });
  }
  _deleteTransaction(int index){
    setState((){
      _userTransactions.removeAt(index);
    });
  }
  void _startAddNewTransaction(BuildContext context){
    showModalBottomSheet(
      context:context,
      builder: (_) {
          return GestureDetector(
            onTap: (){},
            child: NewTransaction(addTransactionFunc: _addTransaction),
            behavior: HitTestBehavior.opaque,
          );
        }
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Expenses'),
        actions: [
          IconButton(
              onPressed: ()=> { _startAddNewTransaction(context)},
              icon: Icon(Icons.add)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Chart(_userTransactions.where((t) => DateTime.now().difference(t.date).inDays < 7).toList(),),
            ),
            TransactionList(userTransactions: _userTransactions,deleteTransaction: _deleteTransaction,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()=> {_startAddNewTransaction(context)},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
