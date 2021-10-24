import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String weekDay;
  final double spendingAmount;
  final double spendingPercentage;
  const ChartBar(this.weekDay,this.spendingAmount,this.spendingPercentage,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx,constraint) {
        return Column(
          children: [
            SizedBox(height: constraint.maxHeight *0.15,child: FittedBox(child: Text('\$${spendingAmount.toStringAsFixed(0)}',))),
            SizedBox(height: constraint.maxHeight *0.05,),
            Container(
              height: constraint.maxHeight *0.6 ,
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
            SizedBox(height: constraint.maxHeight *0.05,),
            SizedBox(height: constraint.maxHeight *0.15,child: FittedBox(child: Text(weekDay))),
          ],
        );
      },
    );
  }
}
