import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  DateTime inputDate = DateTime.now();
  _presentDatePicker(){
    showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000),lastDate: DateTime.now()).then((value) => {if(value != null) inputDate = value});

  }

  _submitData(){
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
            date: inputDate
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
              onSubmitted: (_)=> _submitData(),),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_)=> _submitData(),),
            SizedBox(
              height: 64,
              child: Row(
                children: [
                  Text('Date: ',),
                  Text(DateFormat('dd-MM-yyyy hh:mm').format(inputDate), style: TextStyle(fontWeight: FontWeight.bold,)),
                  TextButton(
                    child: Text('Choose date',style: TextStyle(fontWeight: FontWeight.bold,)),
                    onPressed: _presentDatePicker,
                  )
                ],
              ),
            ),
            ElevatedButton(onPressed: _submitData, child: Text('Add Transaction'),),
          ],
        ),
      ),
    );
  }
}
