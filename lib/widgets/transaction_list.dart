import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  TransactionList({Key? key, required this.userTransactions}) : super(key: key);
  List<TransactionModel> userTransactions;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 700,
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Card(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 4),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(color: Theme.of(context).primaryColor,width:2 ,),borderRadius: BorderRadius.circular(8)
                      ),
                      child:
                      Text(
                        '\$ ${userTransactions[index].amount.toStringAsFixed(2)}',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Theme.of(context).primaryColorDark ),
                      ),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(userTransactions[index].title,style: Theme.of(context).textTheme.headline1,),
                          Text(DateFormat('dd-MM-yyyy hh:mm').format(userTransactions[index].date), style: const TextStyle(color: Colors.grey))
                        ]
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: userTransactions.length,
        ),
      );
  }
}
