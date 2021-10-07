import 'package:flutter/material.dart';
import 'package:mxscw_expenses_app/models/transaction.dart';

class NewTransaction extends StatelessWidget {
  NewTransaction({Key? key,  required this.addTransactionFunc}) : super(key: key);

  final TextEditingController titleController= TextEditingController();
  final TextEditingController amountController= TextEditingController();
  final Function(TransactionModel transactionModel) addTransactionFunc;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(decoration: InputDecoration(labelText: 'Title'), controller: titleController,),
            TextField(decoration: InputDecoration(labelText: 'Amount'),controller: amountController,),
            TextButton(onPressed: ()=> addTransactionFunc(new TransactionModel(id: 'id', title: titleController.text, amount: double.parse(amountController.text), date: DateTime.now())), child: Text('Add Transaction'),),
          ],
        ),
      ),
    );
  }
}
