import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './new_transaction.dart';
import './transaction_list.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<TransactionModel> _userTransactions = [
    TransactionModel(id:'0',title: 'New Shoes',amount: 25.26,date:DateTime.now()),
    TransactionModel(id:'1',title: 'New Hoodie',amount: 45.34,date:DateTime.now().add(const Duration(days: -30)))
  ];

  addTransaction(TransactionModel transactionModel){
    transactionModel.id = _userTransactions.length.toString();
    setState(() {
      _userTransactions.add(transactionModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(addTransactionFunc: addTransaction),
        TransactionList(userTransactions:_userTransactions)
      ],
    );
  }
}
