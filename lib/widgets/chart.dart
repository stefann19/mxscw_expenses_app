import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mxscw_expenses_app/models/transaction.dart';
import 'package:mxscw_expenses_app/widgets/chart_bar.dart';

class ChartBarDto{
  final double amount;
  final String weekDay;
  ChartBarDto(this.amount, this.weekDay);
}

class Chart extends StatelessWidget {
  const Chart(this.recentTransactions,{Key? key, }) : super(key: key);

  final List<TransactionModel> recentTransactions;

  List<ChartBarDto> get groupedTransactionValues {
    return List.generate(7, (index)
    {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var recentTransactionsToday =recentTransactions.where((t) => t.date.day == weekDay.day);
      final sum = recentTransactionsToday.isEmpty ? 0.0: recentTransactionsToday.fold(0.0,(a, b) => (a as double) + b.amount);
      return ChartBarDto(sum, DateFormat.E().format(weekDay).substring(0,1));
    }).reversed.toList();
  }
  double get maxSpendingsLastWeek{
    var recentTransactionsThisWeek =recentTransactions.where((t) => DateTime.now().difference(t.date).inDays < 7);
    final sum = recentTransactionsThisWeek.isEmpty ? 0.0: recentTransactionsThisWeek.fold(0.0,(a, b) =>(a as double) + b.amount);
    return sum;
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues
              .map((x) => Flexible(fit: FlexFit.tight,child: ChartBar(x.weekDay, x.amount, maxSpendingsLastWeek == 0 ? 1 : x.amount/maxSpendingsLastWeek)))
              .toList()
          ,),
      )
      );
  }
}
