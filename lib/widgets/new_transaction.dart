import 'package:flutter/material.dart';
import 'package:mxscw_expenses_app/models/transaction.dart';

class NewTransaction extends StatefulWidget {
  NewTransaction({Key? key,  required this.addTransactionFunc}) : super(key: key);

  final Function(TransactionModel transactionModel) addTransactionFunc;

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final TextEditingController titleController= TextEditingController();

  final TextEditingController amountController= TextEditingController();

  submitData(){
    final inputTitle =titleController.text;
    final inputAmount = double.tryParse(amountController.text);
    if(inputAmount == null || inputAmount <=0){
      //throw something
      return;
    }
    widget.addTransactionFunc(
        TransactionModel(
            id: 'id',
            title: inputTitle,
            amount:  inputAmount,
            date: DateTime.now()
        )
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_)=> submitData(),),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_)=> submitData(),),
            TextButton(onPressed: submitData, child: Text('Add Transaction'),),
          ],
        ),
      ),
    );
  }
}
