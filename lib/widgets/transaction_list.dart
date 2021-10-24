import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatefulWidget {
  TransactionList({Key? key, required this.userTransactions, required this.deleteTransaction}) : super(key: key);
  List<TransactionModel> userTransactions;
  final Function(int index) deleteTransaction;
  @override
  State<TransactionList> createState() => _TransactionListState();

}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return widget.userTransactions.isNotEmpty ?
          ListView.builder(
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
                        '\$ ${widget.userTransactions[index].amount.toStringAsFixed(2)}',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Theme.of(context).primaryColorDark ),
                      ),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(widget.userTransactions[index].title,style: Theme.of(context).textTheme.headline1,),
                          Text(DateFormat('dd-MM-yyyy hh:mm').format(widget.userTransactions[index].date), style: const TextStyle(color: Colors.grey))
                        ]
                    ),
                    IconButton(onPressed: ()=>widget.deleteTransaction(index), icon: Icon(Icons.delete))
                  ],
                ),
              ),
            );
          },
          itemCount: widget.userTransactions.length,
        ) :
          Column(
            children: [
              Text('No transactions added yet',style: Theme.of(context).textTheme.headline1,),
              SizedBox(
                height: 32,
              ),
              Container(
                child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover),
                height: 256,
              )
            ],
      );
  }
}
