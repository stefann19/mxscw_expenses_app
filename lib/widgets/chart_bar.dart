import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String weekDay;
  final double spendingAmount;
  final double spendingPercentage;
  const ChartBar(this.weekDay,this.spendingAmount,this.spendingPercentage,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16,child: FittedBox(child: Text('\$${spendingAmount.toStringAsFixed(0)}',))),
        SizedBox(height: 4,),
        Container(
          height: 60,
          width: 10,
          child: Stack(
              children: [
                Container(
                  child: null,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1,color: Colors.grey),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(8)
                  ),
                ),
                FractionallySizedBox(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(8)
                    ),
                  ),
                  heightFactor: spendingPercentage,
                )
              ]
          ),
        ),
        SizedBox(height: 4,),
        Text(weekDay)
      ],
    );
  }
}
