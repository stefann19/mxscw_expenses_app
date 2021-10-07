import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  TransactionList({Key? key, required this.userTransactions}) : super(key: key);
  List<TransactionModel> userTransactions;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 700,
        child: Column(
          children: userTransactions.map((t) =>
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
              )).toList()
          ,
        ),
      ),
    );
  }
}
